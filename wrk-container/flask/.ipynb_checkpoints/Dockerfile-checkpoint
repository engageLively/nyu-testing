FROM securesystemslab/lind_ubuntu:lite

#RUN git fetch --all
#RUN git config --global --add safe.directory /home/lind/lind_project
#RUN git checkout lamp-all-4
#WORKDIR /home/lind/lind_project/tests/lamp_stack/profiling/
#RUN native_setup.sh

EXPOSE 80

CMD ["git fetch --all && git config --global --add safe.directory /home/lind/lind_project && git checkout lamp-all-4 && cd /home/lind/lind_project/tests/lamp_stack/profiling/ && ./native_setup.sh && ./run_lamp_native.sh"]

