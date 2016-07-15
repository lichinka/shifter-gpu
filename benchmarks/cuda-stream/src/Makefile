stream : stream.cu
	nvcc -std=c++11 stream.cu -arch=sm_35 -o stream

run : stream
	./stream

clean :
	rm -f stream
