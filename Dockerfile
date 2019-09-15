FROM library/golang:1.13-stretch
ADD ipmi_exporter /go/src/github.com/soundcloud/ipmi_exporter
RUN ls /go/src/github.com/soundcloud/; apt update; apt-get install -y freeipmi ipmitool; cd /go/src/github.com/soundcloud/ipmi_exporter; go install;

FROM library/debian:9
COPY --from=0 /go/bin/ipmi_exporter /usr/local/bin/
RUN apt update; apt-get install -y freeipmi ipmitool