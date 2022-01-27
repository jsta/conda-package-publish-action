FROM continuumio/miniconda3:4.7.10

LABEL "repository"="https://github.com/jsta/conda-package-publish-action"
LABEL "maintainer"="Jemma Stachelek <stachel2@msu.edu>"

RUN apt update --allow-releaseinfo-change
# C++ build tools for map2model and gl libs for lavavu
RUN apt install -y build-essential libglu1-mesa-dev freeglut3-dev mesa-common-dev

RUN conda install -y anaconda-client conda-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
