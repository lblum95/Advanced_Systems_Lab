#!/bin/bash


files=( "stb" "cop" "reo")
compilers=( "g" "i" )
flags=( "-O2" )
seeds=( 36 )
differenObservables=( 8 16 32 64 128 256 512 1024 )
hiddenStates=( 8 64 128 )
Ts=( 64 256 512 )
now=`date +%m-%d.%H:%M:%S`
for file in "${files[@]}"
do
    for compiler in "${compilers[@]}"
    do
        for flag in "${flags[@]}"
        do
	        "$compiler"cc $flag -o time "bw-$file.c" io.c bw-tested.c util.c -lm
            for seed in "${seeds[@]}"
            do
                arraylength=${#hiddenStates[@]}
                for ((place=0; place<${arraylength}; place++));
                do
                    T=${Ts[place]}
                    hiddenState=${hiddenStates[place]}
                    for differentObservable in "${differenObservables[@]}"
                    do
                        echo "DAS SEI UESI PARAMETER" "FLAG" $compiler$flag "SEED" $seed "HIDDENSTATE" $hiddenState "DIFFERENTOBSERVABLES" $differentObservable "T" $T >> "../output_measures_comp2/$file-do-$now-time.txt"
                        ./time $seed $hiddenState $differentObservable $T >> "../output_measures_comp2/$file-do-$now-time.txt"
                        echo `date +%m-%d.%H:%M:%S`
                        echo "$file $compiler$flag $seed $differentObservable $hiddenState $T"
                    done
                done
            done
        done
    done
done
rm -f time
files=( "vec")
compilers=( "g" "i" )
flags=( "-O2 -mfma" )
seeds=( 36 )
differenObservables=( 8 16 32 64 128 256 512 1024 )
hiddenStates=( 8 64 128 )
Ts=( 64 256 512 )
now=`date +%m-%d.%H:%M:%S`
for file in "${files[@]}"
do
    for compiler in "${compilers[@]}"
    do
        for flag in "${flags[@]}"
        do
	        "$compiler"cc $flag -o time "bw-$file.c" io.c bw-tested.c util.c -lm
            for seed in "${seeds[@]}"
            do
                arraylength=${#hiddenStates[@]}
                for ((place=0; place<${arraylength}; place++));
                do
                    T=${Ts[place]}
                    hiddenState=${hiddenStates[place]}
                    for differentObservable in "${differenObservables[@]}"
                    do
                        echo "DAS SEI UESI PARAMETER" "FLAG" $compiler$flag "SEED" $seed "HIDDENSTATE" $hiddenState "DIFFERENTOBSERVABLES" $differentObservable "T" $T >> "../output_measures_comp2/$file-do-$now-time.txt"
                        ./time $seed $hiddenState $differentObservable $T >> "../output_measures_comp2/$file-do-$now-time.txt"
                        echo `date +%m-%d.%H:%M:%S`
                        echo "$file $compiler$flag $seed $differentObservable $hiddenState $T"
                    done
                done
            done
        done
    done
done
rm -f time
