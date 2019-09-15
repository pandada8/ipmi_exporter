FROM library/golang:1.13-stretch
ADD . /go/src/github.com/soundcloud/ipmi_exporter
RUN ls /go/src/github.com/soundcloud/; cd /go/src/github.com/soundcloud/ipmi_exporter; go install;

FROM library/debian:9
COPY --from=0 /go/bin/ipmi_exporter /usr/local/bin/
RUN apt update; apt-get install -y freeipmi ipmitool