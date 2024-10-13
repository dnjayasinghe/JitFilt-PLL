

#include <stdio.h>
#include "helpers.cuh"
#include "data.cuh"
#include <string>
#include <cuda.h>

#define SAMPLES 2000000
    // samples * wavelength  must to be less than 50,000,00
#define WAVELENGTH 600 // length of processed sampling points at a time
#define TOTAL  600	// total samplings in a power trace  // 280 for lattice 1024 for giii
#define KEYBYTES 16
#define KEYS 256
#define CHUNK 600	// number of chunk which must be loaded in to memory. chunk = wavelength *X ; x is an in
#define SEGMENTS 5
#define LIMIT (SAMPLES/SEGMENTS)	


#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)
{
   if (code != cudaSuccess) 
   {
      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}


typedef  unsigned char byte;
						//samples * CHUNK  must to be less than 4,000,000,000 this limit is from ram

__device__ byte hammingweight(byte M, byte R);
__device__ byte hamming(unsigned int *cipher, unsigned int i,unsigned int n,unsigned int key);
__global__ void maxCorelationkernel(double *corelation,double *wavestat,double *wavestat2,double *hammingstat, double *wavestatW2);
__global__ void wavestatkernel(unsigned char *wavedata, double *wavestat,double *wavestat2,byte *hammingArray, double *wavestatW2);
__global__ void hammingkernel(unsigned int *cipher, byte *hammingArray,double *hammingstat);

int main(int argc, char *argv[]){
//cudaSetDevice(0);

//unsigned char dat;
float dat;
	
unsigned int i,j,k,temp;
//int l=atoi(argv[3]);
//char filename[80];
//strcpy(filename,"final");
//strcpy(filename,l+"");
//strcpy(filename,".txt");
FILE *file;
// empty the file. 
	file=fopen("all.txt","w");
	fprintf(file,"");
	fclose(file);
	
	double *MAXCorrelation=(double *)malloc(sizeof(double) * KEYS* KEYBYTES);
	isMemoryFull(MAXCorrelation);
	for (i=0;i<KEYS;i++){
		for(j=0;j<KEYBYTES;j++){
			MAXCorrelation[i*KEYBYTES+j]=0;
		}
	}
	
	//check args
	if(argc!=4){
		fprintf(stderr,"%s\n", "Not enough args. eg ./cpa wavedata.txt cipher.txt");
		exit(EXIT_FAILURE);
	}
	int ARRAY_CHUNKS = SAMPLES/LIMIT;
	
	//unsigned int *cipher[5];
	
	//for (i=0;i<5;i++){
	unsigned int *readCipher=(unsigned int *)malloc(sizeof(unsigned int)*(SAMPLES)*KEYBYTES);
	isMemoryFull(readCipher);

	//}

	unsigned int *cipher=(unsigned int *)malloc(sizeof(unsigned int)*(LIMIT)*KEYBYTES);
	isMemoryFull(cipher);

    unsigned char *readWaveData=(unsigned char *)malloc(1L*sizeof(byte) * SAMPLES*CHUNK);
	isMemoryFull(readWaveData);
	
	
//space for corelation
	double *corelation=(double *)malloc(sizeof(double) * KEYS * KEYBYTES);
	isMemoryFull(corelation);
	

	
//get cipher texts
			
	file=fopen(argv[2],"r");
	isFileOK(file);
	for(i=0; i<SAMPLES ;i++){
		int array_index = (i/LIMIT);
		//fprintf(stderr,"%d %f %d ",i, temp_1, array_index*LIMIT);
		//printf("%d %d %d ",i, array_index , array_index*LIMIT);
		for(j=0; j<KEYBYTES; j++){			
				fscanf(file,"%X",&readCipher[(i)*KEYBYTES+j]);
				//printf("%X",cipher[array_index][(i-(array_index*LIMIT))*KEYBYTES+j]);
		}
		//printf("%s","\n");
	}
	int numOfChunks=TOTAL/CHUNK;
	int l=0;
	for(l=0;l<numOfChunks;l++)
{	
		file=fopen(argv[1],"r");
		isFileOK(file);
		unsigned int rounds=TOTAL/WAVELENGTH;
		if(TOTAL%WAVELENGTH!=0) rounds++;
		int fileLength = strlen(argv[1]);
		char extention[4];
		strncpy(extention,argv[1]+fileLength-4,4) ;
		
		if(1){
	    fprintf(stderr,"%s\n",".data file is detected");
		//unsigned char  dat;
		
		//float dat;

/////////////////////	file read
	//fseek(file,sizeof(float)*CHUNK*l,SEEK_CUR);
		for(i=0; i<1*SAMPLES ;i++){
		   while(temp<CHUNK*l) {fread((void*)(&dat),sizeof(dat),1,file); temp++;}
		  
			temp=0;
			for(j=0; j<CHUNK; j++){
			fread((void*)(&dat),sizeof(dat),1,file);
                 	readWaveData[(i/1)*CHUNK+j]=(double)(dat);
					//if(dat>200)
					//  fprintf(stderr,"%f ",dat);
					}
			//fseek(file,sizeof(float)*(TOTAL-CHUNK),SEEK_CUR);
			while(temp<TOTAL-(CHUNK*(l+1))) {fread((void*)(&dat),sizeof(dat),1,file); temp++;}
			temp=0;
			//fprintf(stderr,"\n ");
				
			}
		}
		else{
		 long int dat;
			 fprintf(stderr,"%s\n",".txt file is detected");
			 for(i=0; i<SAMPLES ;i++){
	               	 for(j=0; j<WAVELENGTH; j++){
					fscanf(file,"%d",&dat); readWaveData[i*CHUNK+j]=(double)dat; 
					//printf("%ld ",dat);
							}
                        			}

			}
	
	//unsigned char *wavedata[5];
	//for(i=0; i<5 ;i++){	
	unsigned char *wavedata=(unsigned char *)malloc(sizeof(unsigned char) * (LIMIT)*  WAVELENGTH);
		isMemoryFull(wavedata);
	//}
	
			
	unsigned int insideRounds=CHUNK/WAVELENGTH;
	if(CHUNK%WAVELENGTH!=0) insideRounds++;
	for(k=0;k<insideRounds;k++) {   /// main loop
	
		//get wave data
	
	fprintf(stderr,"%s %d %d \n","calculating", l,k);
    
	
	//printf("%uc ",wavedata[0][0]);
	//Time
	
	//cudaEvent_t start,stop;
	float elapsedtime;
	//cudaEventCreate(&start);
	//cudaEventRecord(start,0);
	//cudaSetDevice(1);
	//cuda arrays and copying
	unsigned char *dev_wavedata;
	unsigned int *dev_cipher;
	
	double *dev_corelation,*dev_wavestat,*dev_wavestat2,*dev_hammingstat, *dev_wavestatW2;
	byte *dev_hammingArray;
	
	//gpuErrchk(cudaMallocManaged((void**)&dev_wavedata, 5*sizeof(unsigned char*)));
	//gpuErrchk(cudaMallocManaged((void**)&dev_cipher, 5*sizeof(unsigned int*)));
	//gpuErrchk(cudaMallocManaged((void**)&dev_hammingArray, 5*sizeof(unsigned char*)));
	
	//for(i=0;i<5;i++){
		gpuErrchk(cudaMallocManaged((void**)&dev_wavedata, 1L*(LIMIT)*WAVELENGTH*sizeof(unsigned char)));
	    cudaGetLastError();
	
		gpuErrchk(cudaMallocManaged((void**)&dev_cipher, 1L*(LIMIT)*KEYBYTES*sizeof(unsigned int)));
	    cudaGetLastError();
		
		gpuErrchk(cudaMallocManaged((void**)&dev_hammingArray, 1L*KEYS*KEYBYTES*(LIMIT)*sizeof(byte)));
	    cudaGetLastError();
	
	//} // end for
	
	
	//gpuErrchk(cudaMallocManaged((void**)&dev_wavedata1, 1L*(SAMPLES/2)*WAVELENGTH*sizeof(unsigned char)));
	//cudaGetLastError();
	//gpuErrchk(cudaMallocManaged((void**)&dev_cipher, 1L*(SAMPLES/2)*KEYBYTES*sizeof(unsigned int)));
	//cudaGetLastError();
	//gpuErrchk(cudaMallocManaged((void**)&dev_cipher1, 1L*(SAMPLES/2)*KEYBYTES*sizeof(unsigned int)));
	
	gpuErrchk(cudaMallocManaged((void**)&dev_corelation, KEYS*KEYBYTES*sizeof(double)));
	cudaGetLastError();
	gpuErrchk(cudaMallocManaged((void**)&dev_wavestat, 1*WAVELENGTH*sizeof(double)));
	cudaGetLastError();
	gpuErrchk(cudaMallocManaged((void**)&dev_wavestatW2, 1*WAVELENGTH*sizeof(double)));
	cudaGetLastError();
	gpuErrchk(cudaMallocManaged((void**)&dev_wavestat2, 1L*KEYS*KEYBYTES*WAVELENGTH*sizeof(double)));
	cudaGetLastError();
	gpuErrchk(cudaMallocManaged((void**)&dev_hammingstat, 2*KEYS*KEYBYTES*sizeof(double)));
	cudaGetLastError();
	
	dim3 grid(KEYBYTES/16,KEYS/16);
	dim3 block(16,16);
	
	dim3 block3d(16,16,4);
	dim3 grid3d(KEYBYTES/16,KEYS/16,WAVELENGTH/4);
	
	int array_index=0;
	
	cudaMemset(&dev_wavestat, 0x00, 1*WAVELENGTH*sizeof(double));
	cudaMemset(&dev_wavestatW2, 0x00, 1*WAVELENGTH*sizeof(double));
	cudaMemset(&dev_wavestat2, 0x00, 1L*KEYS*KEYBYTES*WAVELENGTH*sizeof(double));
	cudaMemset(&dev_hammingstat, 0x00, 2*KEYS*KEYBYTES*sizeof(double));
	
	for(int ir=0;ir<SEGMENTS;ir++){
	
	
	for(i=ir*LIMIT; i<(ir+1)*LIMIT ;i++){
		array_index = (i/LIMIT);
		for(j=0; j<KEYBYTES; j++){
			unsigned int temp=readCipher[(i)*KEYBYTES+j];
			cipher[(i-(array_index*LIMIT))*KEYBYTES+j] = temp;
		}
		for(j=0; j<WAVELENGTH; j++){
			double value1= readWaveData[(i)*CHUNK+j+k*WAVELENGTH];
			wavedata[(i-array_index*LIMIT)*WAVELENGTH+j] =(unsigned char)value1;
		
	
		}
	}
		
		gpuErrchk(cudaMemcpy(dev_wavedata,wavedata,1L*(LIMIT)*WAVELENGTH*sizeof(unsigned char),cudaMemcpyHostToDevice));
		cudaGetLastError();
		
		gpuErrchk(cudaMemcpy(dev_cipher,cipher, 1L*(LIMIT)*KEYBYTES*sizeof(unsigned int),cudaMemcpyHostToDevice));
		cudaGetLastError();
	
		//findhamming
		hammingkernel<<<grid,block>>>(dev_cipher,dev_hammingArray,dev_hammingstat);
		cudaDeviceSynchronize();
		cudaGetLastError();

	
		//find wave stats
		wavestatkernel<<<grid3d,block3d>>>(dev_wavedata,dev_wavestat,dev_wavestat2,dev_hammingArray,dev_wavestatW2);
		cudaDeviceSynchronize();
		cudaGetLastError();
	
		
		}  // end for
	
	//gpuErrchk(cudaMallocManaged((void**)&dev_Numerator, 1L*KEYS*KEYBYTES*WAVELENGTH*sizeof(double)));
	//gpuErrchk(cudaMallocManaged((void**)&dev_Denominator, 1L*KEYS*KEYBYTES*WAVELENGTH*sizeof(double)));
	
	//deploy double 
	maxCorelationkernel<<<grid,block>>>(dev_corelation,dev_wavestat,dev_wavestat2,dev_hammingstat,dev_wavestatW2);
	cudaDeviceSynchronize();
	cudaGetLastError();


	//copy back
	cudaMemcpy(corelation, dev_corelation, KEYS*KEYBYTES*sizeof(double),cudaMemcpyDeviceToHost);
	
	
	//for (i=0;i<KEYBYTES;i++){
	//
	//	for (j=0;j<KEYS;j++){
	//		double max_correlation =0.0;
	//		
	//		for (k=0;k<WAVELENGTH;k++){
	//			
	//		double N = Numerator[i*KEYS*WAVELENGTH+ j* WAVELENGTH+ k];
	//		double D = Denominator[i*KEYS*WAVELENGTH+ j* WAVELENGTH+ k];
	//		
	//		double corr = fabs(N/D);
	//		if(corr > max_correlation)
	//			max_correlation   =  corr;		
	//			
	//		}
	//		//corelation[i*KEYBYTES+j] = max_correlation; 
	//					
	//	}
	//
	//}
	
	
	//for(i=0;i<5;i++){
		cudaFree(dev_wavedata);
		cudaFree(dev_cipher);
		cudaFree(dev_hammingArray);
	//}
		
	//cudaFree(dev_wavedata);
	//cudaFree(dev_cipher);
	cudaFree(dev_corelation);
	cudaFree(dev_wavestat);
	cudaFree(dev_wavestat2);
	cudaFree(dev_wavestatW2);
	
	cudaFree(dev_hammingstat);
	//cudaFree(dev_hammingArray);
	//cudaFree(dev_Denominator);
	//cudaFree(dev_Numerator);
	
	
	
	
	
	//Time
	//cudaEventCreate(&stop);
	//cudaEventRecord(stop,0);
	//cudaEventSynchronize(stop);
	//cudaEventElapsedTime(&elapsedtime,start,stop);
	//fprintf(stderr,"Time spent for CUDA operation : %.10f\n",elapsedtime/(float)1000);

	//char finishtime[30];
	//time_t stopRound=time(NULL);
	//struct tm *loctime;
	//loctime = localtime (&stopRound);
	//strftime (finishtime, 30, "%Y-%m-%d %H:%M:%S", loctime);
	
	file=fopen("all.txt","a");
	fprintf(file,"\n");
	//fprintf(file,"%s \n",finishtime);
	fprintf(file,"%d,  pk0,   pk1,   pk2,   pk3,   pk4,   pk5,   pk6,   pk7,   pk8,   pk9,  pk10,  pk11,  pk12,  pk13,  pk14,  pk15, \n",SAMPLES);
	for (i=0;i<KEYS;i++){
	fprintf(file,"0x%02X,",i);
		for(j=0;j<KEYBYTES;j++){
			fprintf(file,"%.5f,",i,corelation[i*KEYBYTES+j]);
			double value1 =MAXCorrelation[i*KEYBYTES+j];
			double value2 = corelation[i*KEYBYTES+j];
			
			if(value1<value2) 
				MAXCorrelation[i*KEYBYTES+j] = value2;			
		}
		fprintf(file,"\n");
	}
	fprintf(file,"\n");
	fclose(file);

	
	} // inside loop
	

}
free(readWaveData);

//free(wavedata);
//free(wavedata1);

double finalCorrelations[KEYS][KEYBYTES];
double n=0; int positions[KEYS][KEYBYTES];

	char finishtime[30];
 	time_t stop=time(NULL);
	//finishtime= ctime(&stop);  
	struct tm *loctime;
	loctime = localtime (&stop);
	strftime (finishtime, 30, "%Y-%m-%d %H:%M:%S", loctime);
	
	char krFilePath[30] = "./kr_files/";
	
	char krFileName[20];
	sprintf(krFileName, "%d", SAMPLES);
	
	strcat(krFileName, ".txt");
	
	strcat(krFilePath, krFileName);
	printf("%s ", krFilePath);
	
	// write the csv file
	file=fopen(krFilePath,"w");
	//fprintf(file,"\n");
	//fprintf(file,"%s \n",finishtime);
	//fprintf(file,"%d,  pk0,  pk1,  pk2,  pk3,  pk4,  pk5,  pk6,  pk7,  pk8,  pk9, pk10, pk11, pk12, pk13, pk14, pk15, \n",SAMPLES);
	for (i=0;i<KEYS;i++){
	//fprintf(file,"0x%02X,",i);
		for(j=0;j<KEYBYTES;j++){
			if(j==KEYBYTES-1)
				fprintf(file,"%.5f",MAXCorrelation[i*KEYBYTES+j]);
			else
				fprintf(file,"%.5f,",MAXCorrelation[i*KEYBYTES+j]);
			finalCorrelations[i][j]=MAXCorrelation[i*KEYBYTES+j];
			}
		fprintf(file,"\n");
	}
////////////////////////////// sort the results /// 
	int p=0;
	for(j=0;j<KEYBYTES;j++){
		for(i=0;i<KEYS;i++) positions[i][j] =i;
		for (p=0;p<255;p++){
		
		for (i=0;i<KEYS-p-1;i++){
					if(finalCorrelations[i][j]<finalCorrelations[i+1][j]) { 
						n=finalCorrelations[i][j];
						finalCorrelations[i][j]=finalCorrelations[i+1][j];
						finalCorrelations[i+1][j]=n; 
					
						n=positions[i][j];
						positions[i][j]=positions[i+1][j];
						positions[i+1][j]=n; 
						}
					
					}
			}
	}
	
	for(j=0;j<KEYBYTES;j++){
	printf("    |%d|\t",j);
	}
	printf("\n");
	
	for (i=0;i<5;i++){
	for(j=0;j<KEYBYTES;j++){
		printf("   %02x  \t",positions[i][j]);
		}
		printf("\n");
	for(j=0;j<KEYBYTES;j++){
		printf("%.5f  ",finalCorrelations[i][j]);
		}
		printf("\n\n");
	}
		
	
	
	return 0;
}


__device__ byte hammingweight(byte M, byte R){
	byte H=M^R;
	// Count the number of set bits
	byte dist=0;
	while(H){
		dist++; 
		H &= H - 1;
}
	

	return dist;
}

__device__ byte hamming(unsigned int *cipher, unsigned int i,unsigned int n,unsigned int key) { //n is byteno  i is the sample
      byte st10 = (byte)cipher[i*KEYBYTES+inv_shift[n]];
      byte st9 = (byte)inv_sbox[cipher[i*KEYBYTES+n]  ^ key] ;
      byte st19 = (byte)(inv_sbox[cipher[i*KEYBYTES+inv_shift[n] ]  ^ key]) ;

//   byte st9 = (byte)((tbox[cipher[i*KEYBYTES+n]  ^ key]>>24));
//   byte st9 = (byte)(inv_sbox[cipher[i*KEYBYTES+n]  ^ key ]);
//  byte st10 = (byte)(cipher[i*KEYBYTES+n] ^key );

//	byte dist=0;
//if((st9 ^ st10) & 0x0FF)
//idf((st9 ^ st10) & 0x0)
//		 dist= 1;
//	else
//		 dist= 0;  

   byte dist = hammingweight(st9,st10);
 

// byte dist = hammingweight(st9&0xf0,st10&0xf0);	  
//   byte dist = hammingweight(st9, 0);
// byte dist = hammingweight(st19 ,0);

// byte dist = hammingweight(st9, 0);
//

	return dist;
}


__global__ void maxCorelationkernel(double *corelation,double *wavestat,double *wavestat2,double *hammingstat, double *wavestatW2){ 
	
	int keyguess=blockDim.y*blockIdx.y+threadIdx.y;
	int keybyte=blockDim.x*blockIdx.x+threadIdx.x;

	if (keybyte<KEYBYTES && keyguess<KEYS ){ 
		
		double sigmaH,sigmaH2,sigmaW=0,sigmaW2=0,sigmaWH=0;	
		sigmaH=hammingstat[KEYBYTES*keyguess+keybyte];    					// already log 10
		sigmaH2=hammingstat[KEYS*KEYBYTES+KEYBYTES*keyguess+keybyte];		// already log 10
		double temp_corelation=0;;
		double corelationmax=0;
		unsigned int j;
		double logSample=  __log10f(SAMPLES);
		
		for(j=0;j<WAVELENGTH;j++){
			
			sigmaWH=wavestat2[j*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte]; // already log 10
			sigmaW=wavestat[j];                                               // already log 10 
			sigmaW2=wavestatW2[j];                                   // already log10
	
						
			double denominator=sqrt((SAMPLES)*sigmaW2 - sigmaW*sigmaW)*sqrt((SAMPLES)*sigmaH2 - sigmaH*sigmaH);
			double numerator  =(SAMPLES)*sigmaWH - sigmaW*sigmaH;
			
			//Numerator[keybyte*KEYS*WAVELENGTH+ keyguess* WAVELENGTH+ j] = numerator;
			//Denominator[keybyte*KEYS*WAVELENGTH+ keyguess* WAVELENGTH+ j] = denominator;
			
			temp_corelation= fabs((double)numerator/(double)denominator);
			
			if(temp_corelation>corelationmax){
				corelationmax=temp_corelation; 
			}
		}

		corelation[keyguess*KEYBYTES+keybyte]=corelationmax;
	}
	return;
}

__global__ void wavestatkernel(unsigned char *wavedata, double *wavestat,double *wavestat2,byte *hammingArray, double *wavestatW2){

	int keyguess=blockDim.y*blockIdx.y+threadIdx.y;
	int keybyte=blockDim.x*blockIdx.x+threadIdx.x;
	int wave=blockDim.z*blockIdx.z+threadIdx.z;

	if (keyguess<KEYS && keybyte<KEYBYTES && wave<WAVELENGTH ){
		unsigned int i=0, j=0;
		double sigmaWH=0;
		//for(j=0;j<5;j++){
			for(i=0;i<LIMIT;i++){
				sigmaWH+=wavedata[i*WAVELENGTH+wave]*(double)hammingArray[i*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte];	
			}
		//}
		
		
		wavestat2[wave*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte ]  = wavestat2[wave*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte ] + (sigmaWH);
	}

	if (keyguess==0 && keybyte==0 && wave<WAVELENGTH ){
		unsigned long i=0, j=0;
		double sigmaW=0,sigmaW2=0,W=0, temp=0;
		
		//for(j=0;j<5;j++){
		
			for(i=0;i<LIMIT;i++){
				W=wavedata[i*WAVELENGTH+wave];
				sigmaW+=W;
				temp =(W*W);
				sigmaW2 = sigmaW2 + temp;// temp;
			}
		//}

		wavestat[wave]  =wavestat[wave]+(sigmaW);
		wavestatW2[wave]=wavestatW2[wave]+(sigmaW2);
		
	}
	return;
}

__global__ void hammingkernel(unsigned int *cipher,byte *hammingArray,double *hammingstat){
	int keyguess=blockDim.y*blockIdx.y+threadIdx.y;
	int keybyte=blockDim.x*blockIdx.x+threadIdx.x;

	if (keybyte<KEYBYTES && keyguess<KEYS ){
		double sigmaH=0,sigmaH2=0, temp=0;
		byte H;
		unsigned int i=0, j=0;
		//for(j=0;j<5;j++){
			for(i=0;i<LIMIT;i++){
				H=hamming(cipher,i,keybyte,keyguess);
				hammingArray[(i)*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte]= (H);
				sigmaH+=(double)H;
				temp   =(H*H);
				sigmaH2=sigmaH2 + temp;
			}
		//}
		
		hammingstat[KEYBYTES*keyguess+keybyte]  = hammingstat[KEYBYTES*keyguess+keybyte]+ (sigmaH);
		hammingstat[KEYS*KEYBYTES+KEYBYTES*keyguess+keybyte]=hammingstat[KEYS*KEYBYTES+KEYBYTES*keyguess+keybyte]+sigmaH2;
	}
	return;
}

