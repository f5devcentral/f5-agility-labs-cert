exec docker run --rm -it -v /home/f5student/Dropbox/github/f5certlabs:/home/f5student/Dropbox/github/f5certlabs --workdir /home/f5student/Dropbox/github/f5certlabs -e LOCAL_USER_ID=1002 0xhiteshpatel/containthedocs:2.3 make -C docs html

sudo su f5student

cd /home/f5student/Dropbox/github/f5certlabs

exec docker run --rm -it -v /home/f5student/Dropbox/github/f5certlabs:/home/f5student/Dropbox/github/f5certlabs --workdir /home/f5student/Dropbox/github/f5certlabs -e LOCAL_USER_ID=1002 0xhiteshpatel/containthedocs:2.3 make -C docs html &
