#!/bin/sh

currdate=`date -u +"%Y-%m-%d %H:%M:%S"`
iddate=`date -u +"%Y-%m-%dt%H-%M-%Sz"`

touch $iddate.md

cat <<EOF > ./$iddate.md 
---
date: $currdate
title: TITLE 
id: $iddate
---

Write
EOF


nvim '+call cursor(3,8)' ./$iddate.md 
