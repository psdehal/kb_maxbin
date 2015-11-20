FROM kbase/sdkbase:latest
MAINTAINER KBase Developer
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

# RUN apt-get update


RUN curl http://downloads.jbei.org/data/microbial_communities/MaxBin/getfile.php?MaxBin-2.1.1.tar.gz -o MaxBin-2.1.1.tar.gz && \
	tar -xvf MaxBin-2.1.1.tar.gz && \
	cd MaxBin-2.1.1/src && \
	make && \
	cd .. && \
	./autobuild_auxiliary



# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work

WORKDIR /kb/module

RUN make

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
