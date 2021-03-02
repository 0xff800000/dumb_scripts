#!/bin/sh

echo $1 | sed -e '
s/a/ :a: /g
s/b/ :b: /g
s/o/ :o2: /g
s/p/ :parking: /g
s/i/ :information_source: /g
s/ :a:  :b: / :ab: /g
'
