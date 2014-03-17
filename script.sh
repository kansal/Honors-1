#!/usr/bin/bash
alias matlab="/home/vrgeo/matlab/bin/matlab -nodesktop -nosplash"
for i in `ls | grep h25v06`;
do
#echo $i
matlab -r "readData('${i}',1727,1960); exit"; 
done
