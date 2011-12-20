#!/usr/bin/env bash 

/usr/bin/autossh -fN -i /keyfile -o StrictHostKeyChecking=no -R 4222:localhost:4222 vitor@git.vip2web.com 
