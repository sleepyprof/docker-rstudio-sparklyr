FROM rocker/rstudio 

LABEL maintainer="mail@gdietz.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    vim \
    ed \
    libxml2-dev \
    libz-dev \
    libcairo2-dev \
    default-jre && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN install2.r --error \
    lubridate \
    sparklyr \
    corrplot \
    gplots \
    e1071 \
    kernlab \
    lars \
    sensitivity \
    zoo \
    ggplot2 \
    reshape \
    gridExtra \
    gtable \
    scales \
    rsm \
    viridis \
    effects \
    vcd \
    randomForest \
    XML \
    waveslim \
    pracma \
    smoother \
    signal \
    hash \
    plotrix \
    AlgDesign \
    lme4 \
    car \
    scatterplot3d \
    igraph \
    data.table \
    svglite \
    RANN \
    xgboost \
    DT \
    pROC \
    tensorflow \
    parsedate \
    plotly \
    h2o \
    BiocManager \
    shinythemes \
    shinyjs \
    shinycssloaders \
    rjson

RUN Rscript -e 'update.packages(ask=FALSE, repos="https://cran.r-project.org")'

RUN Rscript -e 'BiocManager::install(c("GenomicRanges", "gRbase"), ask = FALSE)'

