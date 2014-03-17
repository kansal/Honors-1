#!/usr/bin/bash
alias matlab="/home/vrgeo/matlab/bin/matlab -nodesktop -nosplash"
for i in `ls|grep Result`;
do
matlab -r "createArr('${i}');exit";
done
