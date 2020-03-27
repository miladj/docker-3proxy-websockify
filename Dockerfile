FROM alpine as build
ADD 3proxy /app
WORKDIR /app
RUN apk update && \
    apk add make && \
    apk add g++ && \
    apk add linux-headers && \
    ln -s Makefile.Linux Makefile && \
    make

FROM alpine
RUN apk update && \
    apk add python3 py3-numpy

ADD websockify /app
WORKDIR /app
COPY --from=build /app/bin ./3proxy/
COPY runboth.sh ./
RUN chmod +x runboth.sh
EXPOSE 2080
CMD [ "./runboth.sh" ]