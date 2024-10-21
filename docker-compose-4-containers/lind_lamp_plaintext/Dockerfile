FROM securesystemslab/lind_ubuntu:lind_lamp_base

COPY ./test_connectivity.sh /usr/local/bin/test_connectivity.sh

RUN sudo hmod +x /usr/local/bin/test_connectivity.sh

CMD ["tail", "-f", "/dev/null"]