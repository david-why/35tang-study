#!/bin/bash
out=true
if [ "$1" == "--quiet" ] || [ "$1" == "-q" ]; then
    out=false
    shift
fi
if $out; then
    g++ "$1" -o "$1.out" -static-libstdc++ -static-libgcc -O3 -Wall
    ret="$?"
else
    g++ "$1" -o "$1.out" -static-libstdc++ -static-libgcc -O3 -Wall >/dev/null 2>/dev/null
    ret="$?"
fi
if [ "$ret" != "0" ]; then exit $ret; fi
unset ret
x86_64-w64-mingw32-g++ "$1" -o "$1.exe" -static-libstdc++ -static-libgcc -O3 --no-warnings
$out && echo 'COMPILE OK, running'
"./$1.out"
exit $?
