for d in `ls`;
do
    ( cd $d && git pull )
done
