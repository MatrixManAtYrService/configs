# print a path to a directory for today's work
todaydir()
{
    DAYDIR=~/$(date +%F | sed 's#-#/#g')/
    mkdir -p $DAYDIR
    echo $DAYDIR
}

# go there
today()
{
    echo "    type \`popd\` to go back to $(pwd)"
    pushd $(todaydir)
}