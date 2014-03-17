#!/usr/bin/bash
alias matlab="/home/vrgeo/matlab/bin/matlab -nodesktop -nosplash"
for i in `ls|grep temp.txt`;
do
#echo $i
matlab -r "timesatPrep('${i}');exit";
done


