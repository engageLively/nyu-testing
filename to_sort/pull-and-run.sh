#!/bin/sh

#docker pull securesystemslab/lind
#docker run --privileged --ipc=host --init --cap-add=SYS_PTRACE jupyter/julia-notebook /bin/bash -c "echo 'hello world'"
#docker run --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind /bin/bash -c "echo 'hello world'"
#docker run --privileged --ipc=host --init --cap-add=SYS_PTRACE --cap-add=CAP_SYS_PTRACE securesystemslab/lind /bin/bash -c "echo 0 | sudo tee /proc/sys/kernel/perf_event_paranoid && sudo perf stat -e cache-misses dd if=/dev/zero of=/dev/null bs=1M count=1024 2>&1"
#docker build -t local_lind -f /tmp/Dockerfile /tmp
#docker rm $(docker ps -aq)
#docker run -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "cd /home/lind/lind_project/tests/ipc_performance/total_runtime && /home/lind/lind_project/tests/ipc_performance/total_runtime/run_pipe_performance.sh 1 other"
mkdir -p /home/mhemmings/data/
[ -d "/mhemmings/data" ] && rm -rf /mhemmings/data/*


#docker run --rm -v /home/mhemmings/data:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "cd /home/lind/lind_project/tests/ipc_performance/total_runtime && /home/lind/lind_project/tests/ipc_performance/total_runtime/benchmark.sh 10"


#docker run --rm -v /home/mhemmings/data:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "cd /home/lind/lind_project/tests/ipc_performance/total_runtime && ./run_pipe_performance.sh 10 other && ./run_pipe_performance.sh 10 rawposix"


#docker run --rm -v /home/mhemmings/data/buf_allocate:/home/lind/lind_project/tests/ipc_performance/buf_allocate/data -v /home/mhemmings/data/total_runtime:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -v /home/mhemmings/data/sfi_overhead:/home/lind/lind_project/tests/ipc_performance/sfi_overhead/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "git config --global --add safe.directory /home/lind/lind_project && git pull && git checkout ipc-fix && cd /home/lind/lind_project/tests/ipc_performance/total_runtime && ./benchmark.sh 10 && cd /home/lind/lind_project/tests/ipc_performance/buf_allocate/ && ./benchmark.sh 10 && cd /home/lind/lind_project/tests/ipc_performance/sfi_overhead/ && ./benchmark.sh 10"

#docker run --rm -v /home/mhemmings/data/buf_allocate:/home/lind/lind_project/tests/ipc_performance/buf_allocate/data -v /home/mhemmings/data/total_runtime:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -v /home/mhemmings/data/sfi_overhead:/home/lind/lind_project/tests/ipc_performance/sfi_overhead/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "git pull && git checkout ipc-fix && cd /home/lind/lind_project/tests/ipc_performance/buf_allocate/ && ./benchmark.sh 10"



docker run --rm -v /home/mhemmings/data/buf_allocate:/home/lind/lind_project/tests/ipc_performance/buf_allocate/data -v /home/mhemmings/data/total_runtime:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -v /home/mhemmings/data/sfi_overhead:/home/lind/lind_project/tests/ipc_performance/sfi_overhead/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "git config --global --add safe.directory /home/lind/lind_project && git pull && git checkout ipc-fix && cd /home/lind/lind_project/tests/ipc_performance/buf_allocate/ && ./benchmark.sh 10"

docker run --rm -v /home/mhemmings/data/buf_allocate:/home/lind/lind_project/tests/ipc_performance/buf_allocate/data -v /home/mhemmings/data/total_runtime:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -v /home/mhemmings/data/sfi_overhead:/home/lind/lind_project/tests/ipc_performance/sfi_overhead/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "git config --global --add safe.directory /home/lind/lind_project && git pull && git checkout ipc-fix && cd /home/lind/lind_project/tests/ipc_performance/sfi_overhead/ && ./benchmark.sh 10"

docker run --rm -v /home/mhemmings/data/buf_allocate:/home/lind/lind_project/tests/ipc_performance/buf_allocate/data -v /home/mhemmings/data/total_runtime:/home/lind/lind_project/tests/ipc_performance/total_runtime/data -v /home/mhemmings/data/sfi_overhead:/home/lind/lind_project/tests/ipc_performance/sfi_overhead/data -u root --privileged --ipc=host --init --cap-add=SYS_PTRACE securesystemslab/lind_ubuntu:lite bash -c "git config --global --add safe.directory /home/lind/lind_project && git checkout ipc-fix && cd /home/lind/lind_project/tests/ipc_performance/total_runtime && ./benchmark.sh 10"