#! /bin/bash
[ -d build ] || mkdir build
cd build
for src in ../*.cu; do
    echo ".........................................."
    echo "starting compiling $src :"
    prg=${src%.*}
    prg=${prg#*/}
    cmd="nvcc $src -o $prg"
    echo $cmd
    $cmd
    [ "$?" -ne "0" ] && echo "ERROR with exit code $?" && exit $?hu
    ./$prg
    echo "-------------------------------------------"
    printf "\n"
done
