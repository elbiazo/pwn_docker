glibc() {
    docker run -it --rm --privileged -v $PWD:/src -v /home/dmo/libc-database:/root/libc-database \
            -v /home/dmo/work/ctf/utils:/home/dmo/ctf/utils -w="/src" libc:$1
}
