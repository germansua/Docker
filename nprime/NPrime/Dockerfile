FROM gersua/openjdk8-ubuntu
RUN mkdir nPrimeService
WORKDIR nPrimeService
COPY target/nprime-service.jar .
ENTRYPOINT java -jar nprime-service.jar