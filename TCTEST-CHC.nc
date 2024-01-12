%
O01008
(TOOL CHANGER TEST PROGRAM)
((C) MICHAEL DILLIO FOR PRAXIS MECHATRONICS 2023)

(---------OPTIMIZED FOR HAAS CONTROL-------)
(RUNS THROUGH ALL TOOLS IN THE TOOL CHANGER, TESTING FOR)
(ORIENTATION AND PROPER FUNCTIONING OF SMTC OR UMBRELLA.)
(#1 IS THE CURRENT TOOL, #2 IS A COUNTER OF TOTAL)
(TOOL CHANGES PERFORMED. #3 STORES HOW MANY TOOLS AVAIL:)
(#3 = 10 FOR A SMALL UMBRELLA, 40 FOR BIG SMTC, ETC.)


G103 P1



#3 = 24 (TOTAL NUMBER OF TOOLS IN CAROUSEL)
#2 = 1 (SET COUNTER TO 1)
N50 (OUTER LOOP START)
#1 = 1 (SET INITIAL TOOL TO 1)
M97 P100 L99 (BEGIN INNER LOOP BY CALLING LINE 100)

GOTO200 (99 OUTER LOOPS COMPLETED)

N100 T#1 M6
S200 M3
G4 P2.
#2 = #2 + 1 (INCREMENT COUNTER)
#1 = #1 + 1 (INCREMENT TOOL #)
IF [ #1 GT #3 ] GOTO50 (TEST FOR LAST TOOL)
(IF ALL TOOLS HAVE CHANGED, RESTART OUTER LOOP AT N50)
M99 (RETURN TO M97 LINE: CHANGE TO NEXT TOOL)
N200 G103 (RESUME LOOKAHEAD)
M30


