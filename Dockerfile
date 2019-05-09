FROM rocker/rstudio

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
	libgdal-dev \
	libudunits2-dev \
	libcairo2-dev \
	libv8-dev \
	libprotobuf-dev \
	software-properties-common \
	libjq-dev \
	protobuf-compiler

RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('cowplot')"
RUN Rscript -e "install.packages('svglite')"
RUN Rscript -e 'install.packages("clipr")'
RUN Rscript -e 'install.packages("data.table")'
RUN Rscript -e 'install.packages("devtools")'
RUN Rscript -e 'install.packages("extrafont")'
RUN Rscript -e 'install.packages("geojson")'
RUN Rscript -e 'install.packages("geojsonio")'
RUN Rscript -e 'install.packages("hutils")'
RUN Rscript -e 'install.packages("knitr")'
RUN Rscript -e 'install.packages("protolite")'
RUN Rscript -e 'install.packages("pscl")'
RUN Rscript -e 'install.packages("RColorBrewer")'
RUN Rscript -e 'install.packages("rmapshaper")'
RUN Rscript -e 'install.packages("roxygen2")'
RUN Rscript -e 'install.packages("rstan")'
RUN Rscript -e 'install.packages("rvest")'
RUN Rscript -e 'install.packages("scales")'
RUN Rscript -e 'install.packages("snakecase")'
RUN Rscript -e 'install.packages("svglite")'
RUN Rscript -e 'install.packages("testthat")'
RUN Rscript -e "devtools::install_github('r-spatial/sf')"
RUN Rscript -e 'devtools::install_github("ellisp/frs-r-package/pkg")'

# Install ozfedelect from local
COPY pkg /root/pkg
RUN R CMD INSTALL --no-multiarch --with-keep.source /root/pkg

COPY Census2016.DataPack /root/Census2016.DataPack
RUN R CMD INSTALL --no-multiarch --with-keep.source /root/Census2016.DataPack
