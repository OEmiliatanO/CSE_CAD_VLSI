#!/bin/bash
FILE="DFG1.txt"
for i in {1..2}; do
    for j in {1..2}; do
        echo $FILE $i $j
        cat $FILE | ./scheduling.elf $i $j 2 1 > DFG1_${i}_${j}.log
    done
done

FILE="DFG2.txt"
for i in {1..3}; do
    for j in {1..3}; do
        echo $FILE $i $j
        cat $FILE | ./scheduling.elf $i $j 1 1 > DFG2_${i}_${j}.log
    done
done

FILE="RGB.txt"
for i in {1..3}; do
    for j in {1..3}; do
        echo $FILE $i $j
        cat $FILE | ./scheduling.elf $i $j 1 1 > RGB_${i}_${j}.log
    done
done
