mkdir -p ResearchUnix/BSD/FreeBSD ResearchUnix/BSD/NextStep ResearchUnix/Commercial/Solaris;

cd ResearchUnix;

find . -type d -exec touch {}/Year \;

echo 1972 > Year

cd Commercial

echo 1984 > Year

cd Solaris

echo 1991 > Year

cd ../..

cd BSD

echo 1977 > Year

cd FreeBSD

echo 1993 > Year

cd ../NextStep

echo 1988 > Year

cd ../../..
