
%
O01009
(ELLIPSE MACRO CHC)

(---------OPTIMIZED FOR HAAS CLASSIC CONTROL-----------)

(THIS PROGRAM TAKES THREE INPUT VARIABLES AND RUNS A)
(SUBROUTINE THAT TRACES OUT AN ELLIPSE WITH THE DIMENSIONS)
(OUTLINED IN VARIABLES #10001 AND #10002. )
(TO ADJUST THE SIZE OF THE ELLIPSE, ADJUST THOSE VARS)
(#10003 IS THE "RESOLUTION" VARIABLE.)
(THE PROGRAM STEPS THROUGH VALUES FOR X AT #10003 INTERVALS)
(AND SOLVES FOR Y WITH EVERY INTERVAL)
 
#1= 7.0 (MAJOR RADIUS 'A') 
#2= 1. (MINOR RADIUS 'B') 
#3= 0.01 (SEGMENT SIZE IN X) 

(CALCULATE CENTER OFFSETS FOR F1 AND F2, KNOWN AS 'C') 
#4= SQRT[ [ #1 * #1 ] - [ #2 * #2 ] ] (C) 
#5= 0 - #4 (F1) 
#6= 0 + #4 (F2) 

(MOVE TO FAR RIGHT:) 
G54 G00 X0 Y0 (CENTER OF ELLIPSE) 
G00 X#1 (FURTHEST RIGHT POINT, Y STAYS AT 0) 
G01 F100. 

#10= #1 
N100 
(RUN FUNCTION ITERATING PER #3 SIZE) 
#7= #2 / #1 (B/A) 
#8= #10 (X-H) 
#9= SQRT[ [ #1 * #1 ] - [ #8 * #8 ] ] 
#11= #7 * #9 
G01 X#10 Y#11 
#10= #10 - #3 
IF [ #10 GE [ 0 - #1 + #3 ] ] GOTO100 

N200
(BACK THE OTHER WAY) 
#7= #2 / #1 (B/A) 
#8= #10 (X-H) 
#9= SQRT[ [ #1 * #1 ] - [ #8 * #8 ] ] 
#11= #7 * #9 
G01 X#10 Y[0 - #11] 
#10= #10 + #3 
IF [ #10 LE [ #1 - #3 ] ] GOTO200 


(#10 = CURRENT X) 
(#11 = CURRENT Y) 
%
