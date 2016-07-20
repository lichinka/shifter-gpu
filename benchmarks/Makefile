NAME = shifter-gpu
VERSIONS = 0.2 0.3
BENCHMARKS = bandwidthTest cuda-stream deviceQuery matrixMulCUBLAS nvidia-smi shoc

all: $(VERSIONS)

$(VERSIONS):
	docker build --rm=true --tag=$(NAME):$@ --file=Dockerfile.$@ .

run: $(BENCHMARKS)
	echo "### Done ###"

bandwidthTest cuda-stream deviceQuery matrixMulCUBLAS nvidia-smi:
	cd $@/src
	make run

shoc:
	cd shoc/bin
	./shocdriver -cuda   -s 4 -d 0
	./shocdriver -opencl -s 4 -d 0
	
clean:
	@$(foreach ver,$(VERSIONS),docker rmi shifter-gpu:$(ver);)
