FROM nfcore/base
MAINTAINER Olga Botvinnik <olga.botvinnik@czbiohub.org>
LABEL authors="olga.botvinnik@czbiohub.org" \
    description="Docker image containing all requirements for the czbiohub/rnaseq pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/czbiohub-rnaseq-1.2/bin:$PATH
