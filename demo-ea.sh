if [ ! -f $1 ]; then
	echo "$1 is not found."
	exit 1
fi
time ./word2vec -train ea_corpus.txt -output ea_vectors.bin -cbow 0 -size 300 -window 1 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1
./distance ea_vectors.bin
