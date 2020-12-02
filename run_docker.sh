glibc() {
    docker run -it --rm --privileged -v $PWD:/src -w="/src" libc:$1
}
