FROM rocker/rstudio 

LABEL maintainer="mail@gdietz.de"

ADD . /init.d/

RUN apt-get update \
  && apt-get install -y vim ed libxml2-dev libz-dev libcairo2-dev default-jre \
  && install2.r --error lubridate sparklyr corrplot gplots e1071 kernlab lars sensitivity zoo ggplot2 reshape gridExtra gtable scales \
    rsm viridis effects vcd randomForest XML waveslim pracma smoother signal hash plotrix AlgDesign lme4 car scatterplot3d igraph data.table svglite

RUN Rscript /init.d/install-packages.R

