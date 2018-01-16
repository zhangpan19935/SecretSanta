set encoding iso_8859_1
set xrange [1:338]
set yrange [0.83:1.15]
set autoscale xfix
set ter png enh interlace size 2400,840 font 'Nimbus,40'
set xlabel 'Position'
set ylabel 'Reliability           ' 
set ytics nomirror 0.7,0.1,1
set out '/app/topcons2/test/rst_milti/multiple_seqs/seq_1///Topcons/topcons.large.png'
set tmargin 1.3
set lmargin 11.5
set rmargin 6.5
set label 'TOPCONS' font 'Nimbus,42' at screen 0.022,0.775
set object 1 rect from 43.5,1.06 to 56.5,1.064875 fc rgb "red" fs noborder
set object 2 rect from 114.5,1.06 to 136.5,1.064875 fc rgb "red" fs noborder
set object 3 rect from 201.5,1.06 to 244.5,1.064875 fc rgb "red" fs noborder
set object 4 rect from 297.5,1.06 to 338.5,1.064875 fc rgb "red" fs noborder
set object 5 rect from 0.5,1.081375 to 22.5,1.08625 fc rgb "blue" fs noborder
set object 6 rect from 77.5,1.081375 to 93.5,1.08625 fc rgb "blue" fs noborder
set object 7 rect from 157.5,1.081375 to 180.5,1.08625 fc rgb "blue" fs noborder
set object 8 rect from 265.5,1.081375 to 276.5,1.08625 fc rgb "blue" fs noborder
set object 9 rect from 22.5,1.06 to 43.5,1.08625 fc rgb "white"
set object 10 rect from 56.5,1.06 to 77.5,1.08625 fc rgb "grey" fs noborder
set object 11 rect from 93.5,1.06 to 114.5,1.08625 fc rgb "white"
set object 12 rect from 136.5,1.06 to 157.5,1.08625 fc rgb "grey" fs noborder
set object 13 rect from 180.5,1.06 to 201.5,1.08625 fc rgb "white"
set object 14 rect from 244.5,1.06 to 265.5,1.08625 fc rgb "grey" fs noborder
set object 15 rect from 276.5,1.06 to 297.5,1.08625 fc rgb "white"
set object 16 rect from 22.5,1.06 to 43.5,1.08625 fc rgb "white"
set object 17 rect from 56.5,1.06 to 77.5,1.08625 fc rgb "grey" fs noborder
set object 18 rect from 93.5,1.06 to 114.5,1.08625 fc rgb "white"
set object 19 rect from 136.5,1.06 to 157.5,1.08625 fc rgb "grey" fs noborder
set object 20 rect from 180.5,1.06 to 201.5,1.08625 fc rgb "white"
set object 21 rect from 244.5,1.06 to 265.5,1.08625 fc rgb "grey" fs noborder
set object 22 rect from 276.5,1.06 to 297.5,1.08625 fc rgb "white"
plot '/app/topcons2/test/rst_milti/multiple_seqs/seq_1///Topcons/reliability.final' w l t '' lc rgb "black" lw 4
exit
