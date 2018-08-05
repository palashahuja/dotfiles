cd /Users/palashahuja/Documents/cp;
sed "s/FILENAME=/FILENAME=$1.cpp/g" Makefile.template > Makefile.bak
sed "s/OUTPUT_FILE=/OUTPUT_FILE=$1.out/g" Makefile.bak > Makefile
rm Makefile.bak



