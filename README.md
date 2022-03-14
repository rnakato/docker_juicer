# docker_juicer
A docker image for Juicer analysis. Docker image is at: https://hub.docker.com/repository/docker/rnakato/juicer/general

## Run

For Docker:

    # pull docker image
    docker pull rnakato/juicer

    # container login
    docker run [--gpus all] --rm -it rnakato/juicer /bin/bash
    # jupyter notebook
    docker run [--gpus all] --rm -p 8888:8888 -v (your directory):/opt/work rnakato/juicer <command>

For Singularity:

    # build image
    singularity build -F rnakato_juicer.sif docker://rnakato/juicer 
    # jupyter notebook
    singularity exec [--nv] rnakato_juicer.sif <command>

## Build image from Dockerfile
First clone and move to the repository

    git clone https://github.com/rnakato/docker_juicer.git
    cd docker_juicer

Then type:

    docker build -t <account>/juicer .

## Contact

Ryuichiro Nakato: rnakato AT iqb.u-tokyo.ac.jp
