#!/bin/bash

make_links() 
{
    echo '### make_links' $1 $2

    targetDir=$1
    destDir=$2
    destname=`basename $destDir`
    if [[ $destname != 'node_modules' ]]; then
        echo 'destination dir must be node_modules!'
        exit 0
    fi    

    for file in `ls $1`
    do
        target=$targetDir"/"$file
        dest=$destDir"/"$file

        echo ln -s $target $dest
        ln -s $target $dest
    done
}

move_modules() 
{
    echo '### move_modules' $1 $2
    targetDir=$1
    destDir=$2
    targetname=`basename $targetDir`
    if [[ $targetname != 'node_modules' ]]; then
        echo 'target dir must be node_modules!'
        exit 0
    fi

    for file in `ls $1`
    do
        target=$targetDir"/"$file
        dot_git=$target"/.git"
        if [[ -d $dot_git ]]; then
          echo mv $target $destDir
          mv $target $destDir

          ln_target=$destDir'/'$file
          echo ln -s $ln_target $targetDir
          ln -s $ln_target $targetDir
        fi
    done
}


if [ "$1" = "ln" ];then
    make_links $2 $3
elif [[ "$1" = "mv" ]]; then
    move_modules $2 $3
elif [[ "$1" = "nodebb" ]]; then
    nodebbDir=$2
    nodeModules=$nodebbDir"/node_modules"
    if [[ ! -d $nodeModules ]]; then
        echo 'There is no node_modules in your nodebb dir:' $nodebbDir
        exit 0
    fi
    destDir=$nodebbDir"/local_node_modules"

    echo mkdir -p $destDir
    mkdir -p $destDir
    move_modules "$nodeModules" "$destDir"
fi
