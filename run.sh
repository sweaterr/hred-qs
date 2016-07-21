#!/bin/bash
# Run program
#echo $*
#CUDA_ROOT=/Developer/NVIDIA/CUDA-7.5
#LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.5/lib
THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32,allow_gc=True,scan.allow_gc=False,nvcc.flags=-use_fast_math python $*
