FROM hyperledger/fabric-baseimage:x86_64-0.4.6

# setup juds, prerequisite for hlf bftsmart
RUN apt-get update && apt-get install -y libc6-dev-i386 autoconf
COPY juds.tar.gz /
RUN tar -xzvf juds.tar.gz
RUN cd juds && ./autoconf.sh && ./configure && ./make && ./make install
RUN rm -rf juds

# setup hlf bftsmart
COPY hyperledger-bftsmart.tar.gz /
RUN tar -xzvf hyperledger-bftsmart.tar.gz
