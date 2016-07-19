NAME = shifter-gpu
VERSIONS = 0.2 0.3
BENCHMARKS = bandwidthTest cuda-stream deviceQuery matrixMulCUBLAS nvidia-smi shoc

all: $(VERSIONS)

$(VERSIONS):
	cd benchmarks
	docker build --rm=true --tag=$(NAME):$@ --file=$(shell pwd)/benchmarks/Dockerfile.$@ .

run: $(BENCHMARKS)
	echo "### Done ###"

bandwidthTest cuda-stream deviceQuery matrixMulCUBLAS nvidia-smi:
	cd benchmarks/$@/src
	make run

shoc:
	cd benchmarks/shoc/bin
	./shocdriver -cuda   -s 4 -d 0
	./shocdriver -opencl -s 4 -d 0
	
clean:
	@$(foreach ver,$(VERSIONS),docker rmi shifter-gpu:$(ver);)
