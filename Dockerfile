# For access to GPU
FROM nvidia/cuda:11.0.3-cudnn8-devel-ubuntu18.04
# Install tools
RUN apt-get update && \
    apt-get install -y g++ make software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3-pip python3.8 python3.8-dev && \
    rm -rf /var/lib/apt/lists/*

# Install pip and install tools
RUN python3.8 -m pip install --upgrade pip && \
    python3.8 -m pip install setuptools && \
    python3.8 -m pip install certifi


				

