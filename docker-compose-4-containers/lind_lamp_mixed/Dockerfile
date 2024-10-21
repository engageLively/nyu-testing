FROM securesystemslab/lind_ubuntu:lind_lamp_app2

COPY ./test_connectivity.sh /usr/local/bin/test_connectivity.sh

RUN chmod +x /usr/local/bin/test_connectivity.sh

CMD ["tail", "-f", "/dev/null"]