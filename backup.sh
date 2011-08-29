#!/bin/sh 
rsync -e  "ssh" -rca -av ~/Pictures ~/code /Volumes/dados/Books b335039@hanjin.dreamhost.com:~/mac-backup/ 
