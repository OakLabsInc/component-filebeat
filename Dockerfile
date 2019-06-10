FROM docker.elastic.co/beats/filebeat:7.1.1
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY COMODORSADomainValidationSecureServerCA.crt /etc/pki/tls/certs/COMODORSADomainValidationSecureServerCA.crt
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml
RUN chown root:filebeat /etc/pki/tls/certs/COMODORSADomainValidationSecureServerCA.crt
RUN mkdir -p /var/lib/filebeat/filebeat
RUN chown root:filebeat /var/lib/filebeat/filebeat
RUN chmod ug+rw /var/lib/filebeat/filebeat
USER filebeat