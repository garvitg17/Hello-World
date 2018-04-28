#!/usr/bin/gawk
BEGIN{max=0}
{
     if (length($0) > max){
       max = length($0)}
}
END {print max}
