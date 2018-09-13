FROM rocker/rstudio 

LABEL maintainer="mail@gdietz.de"


RUN apt-get update \
  && apt-get install -y vim ed libxml2-dev libz-dev libcairo2-dev default-jre \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && install2.r --error lubridate sparklyr corrplot gplots e1071 kernlab lars sensitivity zoo ggplot2 reshape gridExtra gtable scales \
    rsm viridis effects vcd randomForest XML waveslim pracma smoother signal hash plotrix AlgDesign lme4 car scatterplot3d igraph data.table svglite \
    RANN xgboost DT pROC \
  && Rscript -e 'update.packages(ask=FALSE); source("https://bioconductor.org/biocLite.R"); biocLite(c("GenomicRanges", "gRbase"))'

