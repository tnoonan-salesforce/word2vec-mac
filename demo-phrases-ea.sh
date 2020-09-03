if [ ! -f $1 ]; then
	echo "$1 is not found."
	exit 1

fi
time ./word2phrase -train $1 -output ea-phrase -threshold 500 -debug 2
time ./word2vec -train ea-phrase -output vectors-phrase-ea.bin -cbow 0 -size 300 -window 1 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1
./distance vectors-phrase-ea.bin
