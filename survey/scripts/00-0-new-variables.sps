﻿* Encoding: UTF-8.
** MODULE 1

DATASET ACTIVATE DataSet1.
dataset name original.

delete variables q3_ot_sp. 

delete variables q4_96_ot_sp. 

COMPUTE N1=Q6_A + Q6_B + Q6_C +  Q6_D + Q6_E   + Q6_F +Q6_G.
VARIABLE LABELS  N1 'N1 - Number of dificultuies reported'.
EXECUTE.

RECODE Q7_5$01 Q7_5$02 Q7_5$03 Q7_5$04 Q7_5$05 Q7_5$06 Q7_5$07 Q7_5$08 Q7_5$09 Q7_5$10 Q7_5$11 Q7_5$12 Q7_5$13 Q7_5$14 Q7_5$15 (1=1) (2=0).
VALUE LABELS Q7_5$01 Q7_5$02 Q7_5$03 Q7_5$04 Q7_5$05 Q7_5$06 Q7_5$07 Q7_5$08 Q7_5$09 Q7_5$10 Q7_5$11 Q7_5$12 Q7_5$13 Q7_5$14 Q7_5$15 1 "Yes" 0 "No".
EXECUTE.

COMPUTE N2 = sum(Q7_5$01 , Q7_5$02 , Q7_5$03 , Q7_5$04, Q7_5$05 ,Q7_5$06 ,Q7_5$07, Q7_5$08 ,Q7_5$09 ,Q7_5$10 ,Q7_5$11, Q7_5$12 ,Q7_5$13 ,Q7_5$14 ,Q7_5$15).
VARIABLE LABELS  N2 'N2 - Number of HH members working outside village part of the year'.
EXECUTE.

COUNT N3=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(1).
VARIABLE LABELS  N3 'N3 - Number of HH members working in another village in same township'.
EXECUTE.

COUNT N4=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(2).
VARIABLE LABELS  N4 'N4 - Number of HH members working in another township'.
EXECUTE.

COUNT N5=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(3).
VARIABLE LABELS  N5 'N5 - Number of HH members working in a city in Myanmar e.g. Yangon or Mandalay'.
EXECUTE.

COUNT N6=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(4).
VARIABLE LABELS  N6 'N6 - Number of HH members working outside Myanmanr'.
EXECUTE.

COUNT N7=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(1).
VARIABLE LABELS  N7 'N7 - Former HH members that have moved out that are Spouses'.
EXECUTE.

COUNT N8=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(2).
VARIABLE LABELS  N8 'N8 - Former HH members that have moved out that are Children'.
EXECUTE.

COUNT N9=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(3).
VARIABLE LABELS  N9 'N9 - Former HH members that have moved out that are grandchildren'.
EXECUTE.

COUNT N10=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(4).
VARIABLE LABELS  N10 'N10 - Former HH members that have moved out that are Children in law'.
EXECUTE.

COUNT N11=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(5).
VARIABLE LABELS  N11 'N11 - Former HH members that have moved out that are Parents'.
EXECUTE.

COUNT N12=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(6).
VARIABLE LABELS  N12 'N12 - Former HH members that have moved out that are parents in law'.
EXECUTE.

COUNT N13=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(7).
VARIABLE LABELS  N13 'N13 - Former HH members that have moved out that are siblings'.
EXECUTE.

COUNT N14=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(8).
VARIABLE LABELS  N14 'N14 - Former HH members that have moved out that are other family'.
EXECUTE.

COUNT N15=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(9).
VARIABLE LABELS  N15 'N15 - Former HH members that have moved out that are other non family'.
EXECUTE.

COUNT N16=Q8_2$01 Q8_2$02 Q8_2$03 Q8_2$04 Q8_2$05 Q8_2$06 Q8_2$07 Q8_2$08 Q8_2$09 Q8_2$10 Q8_2$11 
Q8_2$12 Q8_2$13 Q8_2$14 Q8_2$15(1).
VARIABLE LABELS  N16 'N 16 - Number of former HH members that have moved out that are male'.
EXECUTE.

COUNT N17=Q8_2$01 Q8_2$02 Q8_2$03 Q8_2$04 Q8_2$05 Q8_2$06 Q8_2$07 Q8_2$08 Q8_2$09 Q8_2$10 Q8_2$11 
Q8_2$12 Q8_2$13 Q8_2$14 Q8_2$15(2).
VARIABLE LABELS  N17 'N17 - Number of former HH members that have moved out that are female'.
EXECUTE.

COUNT N18=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(1).
VARIABLE LABELS  N18 'N18 - Number of former HH members that have moved out for employment (search for employment)'.
EXECUTE.

COUNT N19=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(2).
VARIABLE LABELS  N19 'N19 - Number of former HH members that have moved out for educaiton'.
EXECUTE.

COUNT N20=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(3).
VARIABLE LABELS  N20 'N20 - Number of former HH members that have moved out for marriage'.
EXECUTE.

COUNT N21=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(4).
VARIABLE LABELS  N21 'N21 - Number of former HH members that have moved out because followed family'.
EXECUTE.

COUNT N22=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(5).
VARIABLE LABELS  N22 'N22 - Number of former HH members that have moved out becasue of conflict'.
EXECUTE.

COUNT N23=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(6).
VARIABLE LABELS  N23 'N23 - Number of former HH members that have moved out becasue of becoming a monk'.
EXECUTE.

COUNT N24=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(1).
VARIABLE LABELS  N24 'N24 - Number of former HH members that have moved out into separate household within same building'.
EXECUTE.

COUNT N25=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(2).
VARIABLE LABELS  N25 'N25 - Number of former HH members that have moved out into same town/village, walking distance'.
EXECUTE.

COUNT N26=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(3).
VARIABLE LABELS  N26 'N26 - Number of former HH members that have moved out into same town/village, not in walking distance'.
EXECUTE.

COUNT N27=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(4).
VARIABLE LABELS  N27 'N27 - Number of former HH members that have moved out into different town/village but close enough for regular visits'.
EXECUTE.

COUNT N28=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(5).
VARIABLE LABELS  N28 'N28 - Number of former HH members that have moved out into different town/village but too far for regular visits'.
EXECUTE.

COUNT N29=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(6).
VARIABLE LABELS  N29 'N29 - Number of former HH members that have moved out into different t country'.
EXECUTE.

recode q14 (2 = 0 ) (1 = 1). 
value labels q14 0 "No" 1 "Yes". 


COMPUTE N30 = sum(Q15_A, Q15_B, Q15_C, Q15_D, Q15_F, Q15_G, Q15_H, Q15_I, Q15_J).
VARIABLE LABELS  N30 'N30 - Number of lenders listed as sources of largest loan in last 12 months'.
EXECUTE.


recode q16 (2 = 0 ) (1 = 1). 
value labels q16 0 "No" 1 "Yes". 


COMPUTE N31=sum(Q17, -Q18).
VARIABLE LABELS  N31 'N31 - Difference between land ownership and  cultivation'.
EXECUTE.

COMPUTE N32=sum(Q17, -Q18, -Q20_A).
VARIABLE LABELS  N32 'N32 - Difference between land ownership and  cultivation + lease out = this is fallow land'.
EXECUTE.


recode q19 (2 = 0 ) (1 = 1). 
value labels q19 0 "No" 1 "Yes". 


recode q21 q25 q27 q31 (2 = 0 ) (1 = 1). 
value labels q21 q25 q27 q31 0 "No" 1 "Yes". 

COMPUTE N33=sum(Q22, -Q23).
VARIABLE LABELS  N33 'N33 - Difference between land renting and cultivating rented land (= fallow rented land)'.
EXECUTE.

if Q24_B_ID = 1 N34 = Q7_2$01.
if Q24_B_ID = 2 N34 = Q7_2$02.
if Q24_B_ID = 3 N34 = Q7_2$03.
if Q24_B_ID = 4 N34 = Q7_2$04.
if Q24_B_ID = 5 N34 = Q7_2$05.
if Q24_B_ID = 6 N34 = Q7_2$06.
if Q24_B_ID = 7 N34 = Q7_2$07.
if Q24_B_ID = 8 N34 = Q7_2$08.
if Q24_B_ID = 9 N34 = Q7_2$09.
if Q24_B_ID = 10 N34 = Q7_2$10.
if Q24_B_ID = 11 N34 = Q7_2$11.
if Q24_B_ID = 12 N34 = Q7_2$12.
if Q24_B_ID = 13 N34 = Q7_2$13.
if Q24_B_ID = 14 N34 = Q7_2$14.
if Q24_B_ID = 15 N34 = Q7_2$15.
exe.

VARIABLE LABELS N34 'N34 - Relationship of co-responsible farm manager (Based on Q24).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N34
/varinfo valllabels = merge.

if Q24_C_ID = 1 N35 = Q7_2$01.
if Q24_C_ID = 2 N35 = Q7_2$02.
if Q24_C_ID = 3 N35 = Q7_2$03.
if Q24_C_ID = 4 N35 = Q7_2$04.
if Q24_C_ID = 5 N35 = Q7_2$05.
if Q24_C_ID = 6 N35 = Q7_2$06.
if Q24_C_ID = 7 N35 = Q7_2$07.
if Q24_C_ID = 8 N35 = Q7_2$08.
if Q24_C_ID = 9 N35 = Q7_2$09.
if Q24_C_ID = 10 N35 = Q7_2$10.
if Q24_C_ID = 11 N35 = Q7_2$11.
if Q24_C_ID = 12 N35 = Q7_2$12.
if Q24_C_ID = 13 N35 = Q7_2$13.
if Q24_C_ID = 14 N35 = Q7_2$14.
if Q24_C_ID = 15 N35 = Q7_2$15.
exe.

VARIABLE LABELS N35 'N35 - Relationship of other family member that is main farm manager (Based on Q24).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N35
/varinfo valllabels = merge.

COMPUTE N36 = max(n34, n35).
* test that this is actually uniquely defined
COMPUTE N37 = min(n34, n35).
*compute test = (N36-N37).
*exe.
*FREQUENCIES VARIABLES= test
/BARCHART FREQ
/ORDER=ANALYSIS.

VARIABLE LABELS N36 'N36 - Relationship of other family member that is co- or solo farm manager (Either N34 or N35).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N36
/varinfo valllabels = merge.

COMPUTE N37 = max(Q28_A, Q28_A_OT_SP).
exe.

VARIABLE LABELS N37 'N37 - (Q28A) When no longer able to visit my land, I will continue to manage the farm jointly with one of my children/children-in-laws.}'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_A_OT_SP
/TARGET VARIABLES = N37
/varinfo valllabels = replace.

add value labels N37 0 'No'.

COMPUTE N38 = max(Q28_B, Q28_B_OT_SP).
exe.
VARIABLE LABELS N38 'N38 - (Q28B) When no longer able to visit my land, I will hand over the management of the farm to one of my children/in-law.'.
APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_B_OT_SP
/TARGET VARIABLES = N38
/varinfo valllabels = replace.

add value labels N38 0 'No'.

COMPUTE N39 = max(Q28_C, Q28_C_OT_SP).
exe.
VARIABLE LABELS N39 'N39 - (Q28C) When no longer able to visit my land,I will continue to manage the farm jointly with another member of my family.(i.e. not children or children-in-law).'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_C_OT_SP
/TARGET VARIABLES = N39
/varinfo valllabels = replace.

add value labels N39 0 'No'.

COMPUTE N40 = max(Q28_D, Q28_D_OT_SP).
exe.
VARIABLE LABELS N40 'N40 - (Q28D) When no longer able to visit my land, I will hand over the management of the farm to another member of my family.(i.e. not children or children-in-law)'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_D_OT_SP
/TARGET VARIABLES = N40
/varinfo valllabels = replace.

add value labels N40 0 'No'.

COMPUTE N41 = max(Q28_G, Q28_G_OT_SP).
exe.
VARIABLE LABELS N41 'N41 - (Q28G) When no longer able to visit my land, do something else '.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_G_OT_SP
/TARGET VARIABLES = N41
/varinfo valllabels = replace.

add value labels N41 0 'No'.

count N42= Q28_A Q28_B Q28_C Q28_D Q28_E Q28_F (1).
IF n42 = 1 n42 = 0.
IF N42 = 2 N42 =1. 
EXE.
count N43= Q28_A Q28_B Q28_C Q28_D (1).
IF n43 = 1 n43 = 0.
IF N43 = 2 N43 =1. 
EXEcute.
count N44= Q28_E Q28_F (1).
IF n44 = 1 n44= 0.
IF N44 = 2 N44 =1. 
EXE.
VARIABLE LABELS N42 'N42 - Temporary (Q28) When no longer able to visit my land, two answers'.
VARIABLE LABELS N43 'N43 - Temporary (Q28) When no longer able to visit my land, two answers, both relatives'.
VARIABLE LABELS N44 'N44 - Temporary (Q28) When no longer able to visit my land, two answers, rent and sell'.
if N42 = 1 AND N43 = 0 AND N44 =0  N45 = 1.
VARIABLE LABELS N45 'N45 - Temporary  (Q28) When no longer able to visit my land, two answers, one relative, other rent/sell'.
exe.

if n42 ~=1 AND Q28_A = 1 N46 = 1.
if n42 ~=1 AND Q28_b = 1 N46 = 2.
if n42 ~=1 AND Q28_C = 1 N46 = 3.
if n42 ~=1 AND Q28_D = 1 N46 = 4.
if n42 ~=1 AND Q28_E = 1 N46 = 5.
if n42 ~=1 AND Q28_F = 1 N46= 6.
if n42 ~=1 AND Q28_G = 1 N46 = 7.
if N43 = 1 N46 = 8. 
if N44 = 1 N46 = 9. 
if N45 = 1 N46 = 10. 
exe.
variable labels N46  'N46 - Q28 consolidated - When no longer able to visit my land:'. 
value  labels N46 1 'continue farming jointly with child(in-law)' 
2 'hand over to child(-in-law)' 3 'continue farming jointly with other relative' 
4 ' hand over to other relative' 5 'rent out land' 6 'try to sell land' 7'self manage with hired labour'
8 'two answers relatives' 9 'two answeres rent/sell' 10 'two answers one relative and one rent/sell'.

compute N47 = SUM(Q30_A, Q30_B, Q30_C).
IF N47 = 2 N47 = 1.
EXE.
variable labels N47 'N47 - Q30 consolidated - Size of farm increased in last 5 years in any way.:'. 
value  labels N47 1 'Yes' 0 'No'. 

compute N48 = SUM(Q30_A_ACRE, Q30_B_ACRE, Q30_C_ACRE).
EXE.
variable labels N48 'N48 - Q30_ACRE SUM - Total numebr of acres size of farm increased in last 5 years in any way.:'. 

count N49 = Q31_A1 Q31_A2 Q31_A3 Q31_A4 Q31_A5 (1). 
EXE.
variable labels N49  'N49 - Q31_A consolidated - Number of reasons for decrease in farm size in last five years.:'. 

compute N50 = 0.
if  Q31_A1 =1  N50 = 1.
if  Q31_A2 =1  N50 = 2.
if  Q31_A3 =1  N50 = 3.
if  Q31_A4 =1  N50 = 4.
if  Q31_A5 =1  N50 = 5.
EXE.
VALUE LABELS N50 0 'No decrease' 1 'Sold' 2 'Let' 3 'Gave away' 4 'Had confiscated' 5 'River erosion'.
variable labels N50  'N50 - Q31_A consolidated - Reason for decrease in farm size in last five years.:'. 

COMPUTE N51 = sum(Q31_B1, Q31_B2, Q31_B3, Q31_B4, Q31_B5). 
EXE.
variable labels N51 'N51 - Q31_B consolidated - Total number of acers of decrease in farm size in last five years.:'. 

*compute N52 = 0.
if  Q31_C1_1 =1  N52 = 1.
if  Q31_C1_2 =1  N52 = 2.
if  Q31_C1_3_OT_SP =1  N52 = 3.
if  Q31_C1_3_OT_SP =2  N52 = 4.
EXE.
VALUE LABELS N52 0 'No sale' 1 'Debt' 2 'Too large to manage' 3 'Emergency need for money' 4 'Did not want land anymore '.
variable labels N52  'N52 - from Q31_C1 - Reason for sale of land'. 

*count N53 = Q31_C2_1 Q31_C2_2 Q31_C2_3 (1). 
*exe.
*compute N53 = 0.

if  Q31_C2_1 =1  N53 = 1.
if  Q31_C2_2 =1  N53 = 2.
EXE.
VALUE LABELS N53 0 'No letting out' 1 'Debt' 2 'Too large to manage' 3 'Emergency need for money' 4 'Did not want land anymore '.
variable labels N53  'N53 - from Q31_C2 - Reason for letting out of land'. 

*count N54 = Q31_C3_1 Q31_C3_2 Q31_C3_3 (1). 
*exe.
*compute N54 = 0.

if  Q31_C3_1 =1  N54 = 1.
if  Q31_C3_2 =1  N54 = 2.
if  Q31_C3_3_OT_SP=4  N54 = 3.
if  Q31_C3_3_OT_SP=5  N54 = 4.
EXE.
VALUE LABELS N54 0 'No giving away' 1 'Debt' 2 'Too large to manage' 3 'Contribute for canalization or public road' 4 'Heritage to younger generation'.
variable labels N54  'N54 - from Q31_C3 - Reason for giving away land'. 

*count N55 = Q31_C4_1 Q31_C4_2 Q31_C4_3 (1). 
*exe.
*compute N55 = 0.

if  Q31_C4_3_OT_SP=4  N55 = 1.
if  Q31_C4_3_OT_SP=6  N55 = 2.
if  Q31_C4_3_OT_SP=7  N55 = 3.
EXE.
VALUE LABELS N55 0 'No confiscation' 1 'Contribute for canalization or public road' 2 'Rob', 3 'Confiscated'.
variable labels N55  'N55 - from Q31_C4 - Reason for confiscation of land'. 

*count N56 = Q31_C5_1 Q31_C5_2 Q31_C5_3 (1). 
*exe.
*compute N56 = 0.

if  Q31_C5_3_OT_SP=3  N56 = 1.
EXE.
VALUE LABELS N53 0 'No other reason' 1 'River erosion'.
variable labels N56  'N56 - from Q31_C5 - Other reasons for decrease in land sizeland'. 

if  Q31_C1_1 =1  N57 = 1.
if  Q31_C1_2 =1  N57 = 2.
if  Q31_C1_3_OT_SP =1  N57 = 3.
if  Q31_C1_3_OT_SP =2  N57 = 4.
if  Q31_C2_1 =1  N57 = 5.
if  Q31_C2_2 =1  N57 = 6.
if  Q31_C3_1 =1  N57 = 7.
if  Q31_C3_3_OT_SP=4  N57 = 8.
if  Q31_C3_3_OT_SP=5  N57 = 9.
if  Q31_C4_3_OT_SP=4  N57 = 10.
if  Q31_C4_3_OT_SP=6  N57 = 11.
if  Q31_C4_3_OT_SP=7  N57 = 12.
if  Q31_C5_3_OT_SP=3  N57 = 13.
EXE.
VALUE LABELS N57  1 'Sold because of debt' 2 'Sold because too large to manage' 3 'Sold because of emergency need for money' 
4 'Sold becasue Did not want land anymore ' 5 'Rented out because of debt' 6 'Rented out because too large to manage' 
7 'Gave away becayse of debt' 8 'Gave away - contribute for canalization or public road' 9 'Gave away as heritage to younger generation' 
10 'Confiscation to contribute for canalization or public road' 11 'Confiscation - rob[ed?]', 12 'Confiscation becaus confiscated' 
13 'Lost land to river erosion'.

variable labels N57 "N57 - Reason for decrease in land size".


RECODE Q32_1_2 Q32_1_3 Q32_1_4(1=1) (2=0) (99 = 99).
value labels Q32_1_2 Q32_1_3 Q32_1_4 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

count N58 = Q32_1_2 Q32_1_3 Q32_1_4 (1). 
variable labels N58 "N58 - temporary var". 
if  N58 = 1 and Q32_1_2 = 1 N59 = 1.
if  N58 = 1 and Q32_1_3 = 1 N59 = 2.
if  N58 = 1 and Q32_1_4 = 1 N59 = 3.
if  N58 = 2 and Q32_1_4 = 2 N59 = 4.
if  N58 = 2 and Q32_1_3 = 2 N59 = 5.
if  N58 = 2 and Q32_1_2 = 2 N59 = 6.
if  N58 = 3  N59 = 7.
exe.
value labels N59 1 'for subsistence only' 2 'for animal feed only' 3 'for sale only' 4 'for subsistence and own animal feed'
5 'for subsistence and for sale' 6'for animal feed and for sale' 7 'for subsistence, animal feed and for sale'. 
variable label N59 'N59 - Production type for first crop'. 

RECODE Q32_2_2 Q32_2_3 Q32_2_4(1=1) (2=0) (99 = 99).
value labels Q32_2_2 Q32_2_3 Q32_2_4 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

count N60 = Q32_2_2 Q32_2_3 Q32_2_4 (1). 
variable labels N60 "N60 - temporary var". 
if  N60 = 1 and Q32_2_2 = 1 N61 = 1.
if  N60 = 1 and Q32_2_3 = 1 N61 = 2.
if  N60 = 1 and Q32_2_4 = 1 N61 = 3.
if  N60 = 2 and Q32_2_4 = 2 N61 = 4.
if  N60 = 2 and Q32_2_3 = 2 N61 = 5.
if  N60 = 2 and Q32_2_2 = 2 N61 = 6.
if  N60 = 3  N61 = 7.
exe.
value labels N61 1 'for subsistence only' 2 'for animal feed only' 3 'for sale only' 4 'for subsistence and own animal feed'
5 'for subsistence and for sale' 6'for animal feed and for sale' 7 'for subsistence, animal feed and for sale'. 
variable label N61 'N61 - Production type for second crop'. 


RECODE Q32_3_2 Q32_3_3 Q32_3_4(1=1) (2=0) (99 = 99).
value labels Q32_3_2 Q32_3_3 Q32_3_4 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

count N62 = Q32_3_2 Q32_3_3 Q32_3_4 (1). 
variable labels N62 "N62 - temporary var". 
if  N62 = 1 and Q32_3_2 = 1 N63 = 1.
if  N62 = 1 and Q32_3_3 = 1 N63 = 2.
if  N62 = 1 and Q32_3_4 = 1 N63 = 3.
if  N62 = 2 and Q32_3_4 = 2 N63 = 4.
if  N62 = 2 and Q32_3_3 = 2 N63 = 5.
if  N62 = 2 and Q32_3_2 = 2 N63 = 6.
if  N62 = 3  N63 = 7.
exe.
value labels N63 1 'for subsistence only' 2 'for animal feed only' 3 'for sale only' 4 'for subsistence and own animal feed'
5 'for subsistence and for sale' 6'for animal feed and for sale' 7 'for subsistence, animal feed and for sale'. 
variable label N63 'N63 - Production type for third crop'. 

RECODE Q33_a Q33_b Q33_c Q33_d Q33_e (1=1) (2=0) (99 = 99).
value labels Q33_a Q33_b Q33_c Q33_d Q33_e 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.


compute n64 = q33_a1.
if Q33_A = 1 N64 = 0.
exe.
variable label n64 'N64 - Do you personaly perform land preparation (ploughing) and if not anymore, how long ago did you stop?'.
value labels n64 99 'Never performed land preparation (ploughign)' 0 'Yes'.

compute n65 = q33_B1.
if Q33_b = 1 N65 = 0.
exe.
variable label n65 'N65 - Do you personaly perform harvesting and if not anymore, how long ago did you stop?'.
value labels n65 99 'Never performed harvesting' 0 'Yes'.

compute n66 = q33_C1.
if Q33_C = 1 N66 = 0.
exe.
variable label n66 'N66 - Do you personaly perform sowing, planting and transplanting and if not anymore, how long ago did you stop?'.
value labels n66 99 'Never performed sowing, planting and transplanting' 0 'Yes'.

compute n67 = q33_D1.
if Q33_D = 1 N67 = 0.
exe.
variable label n67 'N67 - Do you personaly perform weeding and if not anymore, how long ago did you stop?'.
value labels n67 99 'Never performed weeding' 0 'Yes'.

compute n68 = q33_E1.
if Q33_E = 1 N68 = 0.
exe.
variable label n68 'N68 - Do you personaly perform pest management and if not anymore, how long ago did you stop?'.
value labels n68 99 'Never performed pest management' 0 'Yes'.

COUNT N69 =  Q34_A1_2_ID Q34_A2_2_ID Q34_A3_2_ID Q34_A4_2_ID Q34_A5_2_ID (1 thru hi).
if sysmis(Q34_A1_2_ID)  n69 = $sysmis.
variable label n69 'N69 - Number of household members (maximum 5) that help with land preparation/ploughing '.

compute N70 = sum(Q34_A1_3_DAYS, Q34_A2_3_DAYS, Q34_A3_3_DAYS, Q34_A4_3_DAYS, Q34_A5_3_DAYS).

variable label n70 'N70 - Total number of days HH members helped with land preparation/ploughing '.

* max relationship ID is 9, so i can stop there. 

if Q34_A1_2_ID = 1 N71 = Q7_2$01.
if Q34_A1_2_ID = 2 N71 = Q7_2$02.
if Q34_A1_2_ID = 3 N71 = Q7_2$03.
if Q34_A1_2_ID = 4 N71 = Q7_2$04.
if Q34_A1_2_ID = 5 N71 = Q7_2$05.
if Q34_A1_2_ID = 6 N71 = Q7_2$06.
if Q34_A1_2_ID = 7 N71 = Q7_2$07.
if Q34_A1_2_ID = 8 N71 = Q7_2$08.
if Q34_A1_2_ID = 9 N71 = Q7_2$09.
exe.
variable label 

VARIABLE LABELS N71 'N71 - Relationship of first HH menber helping with land preparation/ploughing (Based on Q34_A1_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N71
/varinfo valllabels = merge.


if Q34_A2_2_ID = 1 N72 = Q7_2$01.
if Q34_A2_2_ID = 2 N72 = Q7_2$02.
if Q34_A2_2_ID = 3 N72 = Q7_2$03.
if Q34_A2_2_ID = 4 N72 = Q7_2$04.
if Q34_A2_2_ID = 5 N72 = Q7_2$05.
if Q34_A2_2_ID = 6 N72 = Q7_2$06.
if Q34_A2_2_ID = 7 N72 = Q7_2$07.
if Q34_A2_2_ID = 8 N72 = Q7_2$08.
if Q34_A2_2_ID = 9 N72 = Q7_2$09.
exe.
variable label 

VARIABLE LABELS N72 'N72 - Relationship of second HH menber helping with land preparation/ploughing (Based on Q34_A2_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N72
/varinfo valllabels = merge.

if Q34_A3_2_ID = 1 N73 = Q7_2$01.
if Q34_A3_2_ID = 2 N73 = Q7_2$02.
if Q34_A3_2_ID = 3 N73 = Q7_2$03.
if Q34_A3_2_ID = 4 N73 = Q7_2$04.
if Q34_A3_2_ID = 5 N73 = Q7_2$05.
if Q34_A3_2_ID = 6 N73 = Q7_2$06.
if Q34_A3_2_ID = 7 N73 = Q7_2$07.
if Q34_A3_2_ID = 8 N73 = Q7_2$08.
if Q34_A3_2_ID = 9 N73 = Q7_2$09.
exe.
variable label 

VARIABLE LABELS N73 'N73 - Relationship of third HH menber helping with land preparation/ploughing (Based on Q34_A3_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N73
/varinfo valllabels = merge.


if Q34_A4_2_ID = 1 N74 = Q7_2$01.
if Q34_A4_2_ID = 2 N74 = Q7_2$02.
if Q34_A4_2_ID = 3 N74 = Q7_2$03.
if Q34_A4_2_ID = 4 N74 = Q7_2$04.
if Q34_A4_2_ID = 5 N74 = Q7_2$05.
if Q34_A4_2_ID = 6 N74 = Q7_2$06.
if Q34_A4_2_ID = 7 N74 = Q7_2$07.
if Q34_A4_2_ID = 8 N74 = Q7_2$08.
if Q34_A4_2_ID = 9 N74 = Q7_2$09.
exe.
variable label 

VARIABLE LABELS N74 'N74 - Relationship of fourth HH menber helping with land preparation/ploughing (Based on Q34_A5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N74
/varinfo valllabels = merge.

if Q34_A5_2_ID = 1 N75 = Q7_2$01.
if Q34_A5_2_ID = 2 N75 = Q7_2$02.
if Q34_A5_2_ID = 3 N75 = Q7_2$03.
if Q34_A5_2_ID = 4 N75 = Q7_2$04.
if Q34_A5_2_ID = 5 N75 = Q7_2$05.
if Q34_A5_2_ID = 6 N75 = Q7_2$06.
if Q34_A5_2_ID = 7 N75 = Q7_2$07.
if Q34_A5_2_ID = 8 N75 = Q7_2$08.
if Q34_A5_2_ID = 9 N75 = Q7_2$09.
exe.
variable label 

VARIABLE LABELS N75 'N75 - Relationship of fifth HH menber helping with land preparation/ploughing (Based on Q34_A5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N75
/varinfo valllabels = merge.

COUNT N76 =  Q34_B1_2_ID Q34_B2_2_ID Q34_B3_2_ID Q34_B4_2_ID Q34_B5_2_ID (1 thru hi).
if sysmis(Q34_B1_2_ID)  n76= $sysmis.
variable label n76 'N76 - Number of household members (maximum 5) that help with harvesting '.

compute N77 = sum(Q34_B1_3_DAYS, Q34_B2_3_DAYS, Q34_B3_3_DAYS, Q34_B4_3_DAYS, Q34_B5_3_DAYS).

variable label n77 'N77 - Total number of days HH members helped with harvesting'.

*compute test = max(Q34_B1_2_ID, Q34_B2_2_ID, Q34_B3_2_ID, Q34_B5_2_ID, Q34_B5_2_ID ).
*exe.
* max relationship ID is 10, so i can stop there. 

if Q34_B1_2_ID = 1 N78 = Q7_2$01.
if Q34_B1_2_ID = 2 N78 = Q7_2$02.
if Q34_B1_2_ID = 3 N78 = Q7_2$03.
if Q34_B1_2_ID = 4 N78 = Q7_2$04.
if Q34_B1_2_ID = 5 N78 = Q7_2$05.
if Q34_B1_2_ID = 6 N78 = Q7_2$06.
if Q34_B1_2_ID = 7 N78 = Q7_2$07.
if Q34_B1_2_ID = 8 N78 = Q7_2$08.
if Q34_B1_2_ID = 9 N78 = Q7_2$09.
if Q34_B1_2_ID = 10 N78 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N78 'N78 - Relationship of first HH menber helping with harvesting (Based on Q34_B1_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N78
/varinfo valllabels = merge.


if Q34_B2_2_ID = 1 N79 = Q7_2$01.
if Q34_B2_2_ID = 2 N79 = Q7_2$02.
if Q34_B2_2_ID = 3 N79 = Q7_2$03.
if Q34_B2_2_ID = 4 N79 = Q7_2$04.
if Q34_B2_2_ID = 5 N79 = Q7_2$05.
if Q34_B2_2_ID = 6 N79 = Q7_2$06.
if Q34_B2_2_ID = 7 N79 = Q7_2$07.
if Q34_B2_2_ID = 8 N79 = Q7_2$08.
if Q34_B2_2_ID = 9 N79 = Q7_2$09.
if Q34_B2_2_ID = 10 N79 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N79 'N79 - Relationship of second HH menber helping with harvesting (Based on Q34_B2_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N79
/varinfo valllabels = merge.

if Q34_B3_2_ID = 1 N80 = Q7_2$01.
if Q34_B3_2_ID = 2 N80 = Q7_2$02.
if Q34_B3_2_ID = 3 N80 = Q7_2$03.
if Q34_B3_2_ID = 4 N80 = Q7_2$04.
if Q34_B3_2_ID = 5 N80 = Q7_2$05.
if Q34_B3_2_ID = 6 N80 = Q7_2$06.
if Q34_B3_2_ID = 7 N80 = Q7_2$07.
if Q34_B3_2_ID = 8 N80 = Q7_2$08.
if Q34_B3_2_ID = 9 N80 = Q7_2$09.
if Q34_B3_2_ID = 10 N80 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N80 'N80 - Relationship of third HH menber helping with harvesting (Based on Q34_B3_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N80
/varinfo valllabels = merge.

if Q34_B4_2_ID = 1 N81 = Q7_2$01.
if Q34_B4_2_ID = 2 N81 = Q7_2$02.
if Q34_B4_2_ID = 3 N81 = Q7_2$03.
if Q34_B4_2_ID = 4 N81 = Q7_2$04.
if Q34_B4_2_ID = 5 N81 = Q7_2$05.
if Q34_B4_2_ID = 6 N81 = Q7_2$06.
if Q34_B4_2_ID = 7 N81 = Q7_2$07.
if Q34_B4_2_ID = 8 N81 = Q7_2$08.
if Q34_B4_2_ID = 9 N81 = Q7_2$09.
if Q34_B4_2_ID = 10 N81 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N81 'N81 - Relationship of fourth HH menber helping with harvesting (Based on Q34_B5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N81
/varinfo valllabels = merge.

if Q34_B5_2_ID = 1 N82 = Q7_2$01.
if Q34_B5_2_ID = 2 N82 = Q7_2$02.
if Q34_B5_2_ID = 3 N82 = Q7_2$03.
if Q34_B5_2_ID = 4 N82 = Q7_2$04.
if Q34_B5_2_ID = 5 N82 = Q7_2$05.
if Q34_B5_2_ID = 6 N82 = Q7_2$06.
if Q34_B5_2_ID = 7 N82 = Q7_2$07.
if Q34_B5_2_ID = 8 N82 = Q7_2$08.
if Q34_B5_2_ID = 9 N82 = Q7_2$09.
if Q34_B5_2_ID = 10 N82 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N82 'N82 - Relationship of fifth HH menber helping with harvesting (Based on Q34_B5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N82
/varinfo valllabels = merge.

**sowing planting transplanting

COUNT N83 =  Q34_C1_2_ID Q34_C2_2_ID Q34_C3_2_ID Q34_C4_2_ID Q34_C5_2_ID (1 thru hi).
if sysmis(Q34_C1_2_ID)  n83= $sysmis.
variable label n83 'N83 - Number of household members (maximum 5) that help with sowing, planting transplanting'.

compute N84 = sum(Q34_C1_3_DAYS, Q34_C2_3_DAYS, Q34_C3_3_DAYS, Q34_C4_3_DAYS, Q34_C5_3_DAYS).

variable label n84 'N84 - Total number of days HH members helped with sowing, planting transplanting'.

*compute test = max(Q34_C1_2_ID, Q34_C2_2_ID, Q34_C3_2_ID, Q34_C5_2_ID, Q34_C5_2_ID ).
*exe.
* max relationship ID is 10, so i can stop there. 

if Q34_C1_2_ID = 1 N85 = Q7_2$01.
if Q34_C1_2_ID = 2 N85 = Q7_2$02.
if Q34_C1_2_ID = 3 N85 = Q7_2$03.
if Q34_C1_2_ID = 4 N85 = Q7_2$04.
if Q34_C1_2_ID = 5 N85 = Q7_2$05.
if Q34_C1_2_ID = 6 N85 = Q7_2$06.
if Q34_C1_2_ID = 7 N85 = Q7_2$07.
if Q34_C1_2_ID = 8 N85 = Q7_2$08.
if Q34_C1_2_ID = 9 N85 = Q7_2$09.
if Q34_C1_2_ID = 10 N85 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N85 'N85 - Relationship of first HH menber helping with  sowing, planting, transplanting (Based on Q34_C1_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N85
/varinfo valllabels = merge.

if Q34_C2_2_ID = 1 N86 = Q7_2$01.
if Q34_C2_2_ID = 2 N86 = Q7_2$02.
if Q34_C2_2_ID = 3 N86 = Q7_2$03.
if Q34_C2_2_ID = 4 N86 = Q7_2$04.
if Q34_C2_2_ID = 5 N86 = Q7_2$05.
if Q34_C2_2_ID = 6 N86 = Q7_2$06.
if Q34_C2_2_ID = 7 N86 = Q7_2$07.
if Q34_C2_2_ID = 8 N86 = Q7_2$08.
if Q34_C2_2_ID = 9 N86 = Q7_2$09.
if Q34_C2_2_ID = 10 N86 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N86 'N86 - Relationship of second HH menber helping with sowing, planting, transplanting  (Based on Q34_C2_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N86
/varinfo valllabels = merge.

if Q34_C3_2_ID = 1 N87 = Q7_2$01.
if Q34_C3_2_ID = 2 N87 = Q7_2$02.
if Q34_C3_2_ID = 3 N87 = Q7_2$03.
if Q34_C3_2_ID = 4 N87 = Q7_2$04.
if Q34_C3_2_ID = 5 N87 = Q7_2$05.
if Q34_C3_2_ID = 6 N87 = Q7_2$06.
if Q34_C3_2_ID = 7 N87 = Q7_2$07.
if Q34_C3_2_ID = 8 N87 = Q7_2$08.
if Q34_C3_2_ID = 9 N87 = Q7_2$09.
if Q34_C3_2_ID = 10 N87 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N87 'N87 - Relationship of third HH menber helping with  sowing, planting, transplanting  (Based on Q34_C3_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N87
/varinfo valllabels = merge.

if Q34_C4_2_ID = 1 N88 = Q7_2$01.
if Q34_C4_2_ID = 2 N88 = Q7_2$02.
if Q34_C4_2_ID = 3 N88 = Q7_2$03.
if Q34_C4_2_ID = 4 N88 = Q7_2$04.
if Q34_C4_2_ID = 5 N88 = Q7_2$05.
if Q34_C4_2_ID = 6 N88 = Q7_2$06.
if Q34_C4_2_ID = 7 N88 = Q7_2$07.
if Q34_C4_2_ID = 8 N88 = Q7_2$08.
if Q34_C4_2_ID = 9 N88 = Q7_2$09.
if Q34_C4_2_ID = 10 N88 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N88 'N88 - Relationship of fourth HH menber helping with  sowing, planting, transplanting  (Based on Q34_C5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N88
/varinfo valllabels = merge.

if Q34_C5_2_ID = 1 N89 = Q7_2$01.
if Q34_C5_2_ID = 2 N89 = Q7_2$02.
if Q34_C5_2_ID = 3 N89 = Q7_2$03.
if Q34_C5_2_ID = 4 N89 = Q7_2$04.
if Q34_C5_2_ID = 5 N89 = Q7_2$05.
if Q34_C5_2_ID = 6 N89 = Q7_2$06.
if Q34_C5_2_ID = 7 N89 = Q7_2$07.
if Q34_C5_2_ID = 8 N89 = Q7_2$08.
if Q34_C5_2_ID = 9 N89 = Q7_2$09.
if Q34_C5_2_ID = 10 N89 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N89 'N89 - Relationship of fifth HH menber helping with sowing, planting, transplanting  (Based on Q34_C5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N89
/varinfo valllabels = merge.

**weeding

COUNT N90 =  Q34_D1_2_ID Q34_D2_2_ID Q34_D3_2_ID Q34_D4_2_ID Q34_D5_2_ID (1 thru hi).
if sysmis(Q34_D1_2_ID)  n90= $sysmis.
variable label n90 'N90 - Number of household members (maximum 5) that help with weeding'.


compute N91 = sum(Q34_D1_3_DAYS, Q34_D2_3_DAYS, Q34_D3_3_DAYS, Q34_D4_3_DAYS, Q34_D5_3_DAYS).

variable label n91 'N91 - Total number of days HH members helped with weeding'.

*compute test = max(Q34_D1_2_ID, Q34_D2_2_ID, Q34_D3_2_ID, Q34_D5_2_ID, Q34_D5_2_ID ).
*exe.
* max relationship ID is 10, so i can stop there. 

if Q34_D1_2_ID = 1 N92 = Q7_2$01.
if Q34_D1_2_ID = 2 N92 = Q7_2$02.
if Q34_D1_2_ID = 3 N92 = Q7_2$03.
if Q34_D1_2_ID = 4 N92 = Q7_2$04.
if Q34_D1_2_ID = 5 N92 = Q7_2$05.
if Q34_D1_2_ID = 6 N92 = Q7_2$06.
if Q34_D1_2_ID = 7 N92 = Q7_2$07.
if Q34_D1_2_ID = 8 N92 = Q7_2$08.
if Q34_D1_2_ID = 9 N92 = Q7_2$09.
if Q34_D1_2_ID = 10 N92 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N92 'N92 - Relationship of first HH menber helping with weeding (Based on Q34_D1_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N92
/varinfo valllabels = merge.

if Q34_D2_2_ID = 1 N93 = Q7_2$01.
if Q34_D2_2_ID = 2 N93 = Q7_2$02.
if Q34_D2_2_ID = 3 N93 = Q7_2$03.
if Q34_D2_2_ID = 4 N93 = Q7_2$04.
if Q34_D2_2_ID = 5 N93 = Q7_2$05.
if Q34_D2_2_ID = 6 N93 = Q7_2$06.
if Q34_D2_2_ID = 7 N93 = Q7_2$07.
if Q34_D2_2_ID = 8 N93 = Q7_2$08.
if Q34_D2_2_ID = 9 N93 = Q7_2$09.
if Q34_D2_2_ID = 10 N93 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N93 'N93 - Relationship of second HH menber helping with weeding  (Based on Q34_D2_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N93
/varinfo valllabels = merge.

if Q34_D3_2_ID = 1 N94 = Q7_2$01.
if Q34_D3_2_ID = 2 N94 = Q7_2$02.
if Q34_D3_2_ID = 3 N94 = Q7_2$03.
if Q34_D3_2_ID = 4 N94 = Q7_2$04.
if Q34_D3_2_ID = 5 N94 = Q7_2$05.
if Q34_D3_2_ID = 6 N94 = Q7_2$06.
if Q34_D3_2_ID = 7 N94 = Q7_2$07.
if Q34_D3_2_ID = 8 N94 = Q7_2$08.
if Q34_D3_2_ID = 9 N94 = Q7_2$09.
if Q34_D3_2_ID = 10 N94 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N94 'N94 - Relationship of third HH member helping with weeding (Based on Q34_D3_2_ID).'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N94
/varinfo valllabels = merge.

if Q34_D4_2_ID = 1 N95 = Q7_2$01.
if Q34_D4_2_ID = 2 N95 = Q7_2$02.
if Q34_D4_2_ID = 3 N95 = Q7_2$03.
if Q34_D4_2_ID = 4 N95 = Q7_2$04.
if Q34_D4_2_ID = 5 N95 = Q7_2$05.
if Q34_D4_2_ID = 6 N95 = Q7_2$06.
if Q34_D4_2_ID = 7 N95 = Q7_2$07.
if Q34_D4_2_ID = 8 N95 = Q7_2$08.
if Q34_D4_2_ID = 9 N95 = Q7_2$09.
if Q34_D4_2_ID = 10 N95 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N95 'N95 - Relationship of fourth HH menber helping with  weeding  (Based on Q34_D4_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N95
/varinfo valllabels = merge.

if Q34_D5_2_ID = 1 N96 = Q7_2$01.
if Q34_D5_2_ID = 2 N96 = Q7_2$02.
if Q34_D5_2_ID = 3 N96 = Q7_2$03.
if Q34_D5_2_ID = 4 N96 = Q7_2$04.
if Q34_D5_2_ID = 5 N96 = Q7_2$05.
if Q34_D5_2_ID = 6 N96 = Q7_2$06.
if Q34_D5_2_ID = 7 N96 = Q7_2$07.
if Q34_D5_2_ID = 8 N96 = Q7_2$08.
if Q34_D5_2_ID = 9 N96 = Q7_2$09.
if Q34_D5_2_ID = 10 N96 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N96 'N96 - Relationship of fifth HH menber helping with weeding (Based on Q34_D5_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N96
/varinfo valllabels = merge.

** managing pests 

COUNT N97 =  Q34_E1_2_ID Q34_E2_2_ID Q34_E3_2_ID Q34_E4_2_ID Q34_E5_2_ID (1 thru hi).
if sysmis(Q34_E1_2_ID)  n97= $sysmis.
variable label n97 'N97 - Number of household members (maximum 5) that help with managing pests'.

compute N98 = sum(Q34_E1_3_DAYS, Q34_E2_3_DAYS, Q34_E3_3_DAYS, Q34_E4_3_DAYS, Q34_E5_3_DAYS).

variable label n98 'N98 - Total number of days HH members helped with managing pests'.

*compute test = max(Q34_E1_2_ID, Q34_E2_2_ID, Q34_E3_2_ID, Q34_E5_2_ID, Q34_E5_2_ID ).
*exe.
* max relationship ID is 10, so i can stop there. 

if Q34_E1_2_ID = 1 N99 = Q7_2$01.
if Q34_E1_2_ID = 2 N99 = Q7_2$02.
if Q34_E1_2_ID = 3 N99 = Q7_2$03.
if Q34_E1_2_ID = 4 N99 = Q7_2$04.
if Q34_E1_2_ID = 5 N99 = Q7_2$05.
if Q34_E1_2_ID = 6 N99 = Q7_2$06.
if Q34_E1_2_ID = 7 N99 = Q7_2$07.
if Q34_E1_2_ID = 8 N99 = Q7_2$08.
if Q34_E1_2_ID = 9 N99 = Q7_2$09.
if Q34_E1_2_ID = 10 N99 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N99 'N99 - Relationship of first HH menber helping with managing pests (Based on Q34_E1_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N99
/varinfo valllabels = merge.

if Q34_E2_2_ID = 1 N100 = Q7_2$01.
if Q34_E2_2_ID = 2 N100 = Q7_2$02.
if Q34_E2_2_ID = 3 N100 = Q7_2$03.
if Q34_E2_2_ID = 4 N100 = Q7_2$04.
if Q34_E2_2_ID = 5 N100 = Q7_2$05.
if Q34_E2_2_ID = 6 N100 = Q7_2$06.
if Q34_E2_2_ID = 7 N100 = Q7_2$07.
if Q34_E2_2_ID = 8 N100 = Q7_2$08.
if Q34_E2_2_ID = 9 N100 = Q7_2$09.
if Q34_E2_2_ID = 10 N100 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N100 'N100 - Relationship of second HH menber helping with managing pests  (Based on Q34_E2_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N100
/varinfo valllabels = merge.

if Q34_E3_2_ID = 1 N101 = Q7_2$01.
if Q34_E3_2_ID = 2 N101 = Q7_2$02.
if Q34_E3_2_ID = 3 N101 = Q7_2$03.
if Q34_E3_2_ID = 4 N101 = Q7_2$04.
if Q34_E3_2_ID = 5 N101 = Q7_2$05.
if Q34_E3_2_ID = 6 N101 = Q7_2$06.
if Q34_E3_2_ID = 7 N101 = Q7_2$07.
if Q34_E3_2_ID = 8 N101 = Q7_2$08.
if Q34_E3_2_ID = 9 N101 = Q7_2$09.
if Q34_E3_2_ID = 10 N101 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N101 'N101 - Relationship of third HH menber helping with managing pests (Based on Q34_E3_2_ID).'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N101
/varinfo valllabels = merge.

if Q34_E4_2_ID = 1 N102 = Q7_2$01.
if Q34_E4_2_ID = 2 N102 = Q7_2$02.
if Q34_E4_2_ID = 3 N102 = Q7_2$03.
if Q34_E4_2_ID = 4 N102 = Q7_2$04.
if Q34_E4_2_ID = 5 N102 = Q7_2$05.
if Q34_E4_2_ID = 6 N102 = Q7_2$06.
if Q34_E4_2_ID = 7 N102 = Q7_2$07.
if Q34_E4_2_ID = 8 N102 = Q7_2$08.
if Q34_E4_2_ID = 9 N102 = Q7_2$09.
if Q34_E4_2_ID = 10 N102 = Q7_2$10.
exe.
variable label 

VARIABLE LABELS N102 'N102 - Relationship of fourth HH menber helping with  managing pests  (Based on Q34_E4_2_ID).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
/TARGET VARIABLES = N102
/varinfo valllabels = merge.

compute N103 = sum(N70, N77, N84, N91, N98).

variable label n103 'N103 - Total number of days HH members helped with all 5 types of farm activities'.

IF Q35_A_1 = 2 N104 = 0.
IF Q35_A_1 = 1 N104 = Q35_A_2.
EXECUTE.

VALUE LABELS N104 0 'No, did not hire' 1 'Yes, from same village' 2 'Yes, not from same village' .
VARIABLE LABELS N104  'N104 - Q35.A.1., & 2 In the last 12 months did you hire labour to help with' +
  'any of following the farming tasks? {Land preparation/Ploughing}'.

IF Q35_B_1 = 2 N105 = 0.
IF Q35_B_1 = 1 N105 = Q35_B_2.
EXECUTE.

VALUE LABELS N105 0 'No, did not hire' 1 'Yes, from same village' 2 'Yes, not from same village' .
VARIABLE LABELS N105  'N105 - Q35.B.1., & 2 In the last 12 months did you hire labour to help with' +
  'any of following the farming tasks? {Harvesting}'.

IF Q35_C_1 = 2 N106 = 0.
IF Q35_C_1 = 1 N106 = Q35_C_2.
EXECUTE.

VALUE LABELS N106 0 'No, did not hire' 1 'Yes, from same village' 2 'Yes, not from same village' .
VARIABLE LABELS N106  'N106 - Q35.C.1., & 2 In the last 12 months did you hire labour to help with' +
  'any of following the farming tasks? {Sowing, planting, transplanting}'.

IF Q35_D_1 = 2 N107 = 0.
IF Q35_D_1 = 1 N107 = Q35_D_2.
EXECUTE.

VALUE LABELS N107 0 'No, did not hire' 1 'Yes, from same village' 2 'Yes, not from same village' .
VARIABLE LABELS N107  'N107 - Q35.D.1., & 2 In the last 12 months did you hire labour to help with' +
  'any of following the farming tasks? {Weeding}'.

IF Q35_E_1 = 2 N108 = 0.
IF Q35_E_1 = 1 N108 = Q35_E_2.
EXECUTE.

VALUE LABELS N108 0 'No, did not hire' 1 'Yes, from same village' 2 'Yes, not from same village' .
VARIABLE LABELS N108  'N108 - Q35.E.1., & 2 In the last 12 months did you hire labour to help with' +
  'any of following the farming tasks? {Pest management}'.

if Q36_A1 > 0  n109 = Q36_A1. 
exe.
variable labels n109 'N109 - Q36.A1 What were the total number of person-days employed in the last 12 months for each of the following tasks:From local village Days {Land preparation/Ploughing}'.

if Q36_A2 > 0  n110 = Q36_A2. 
exe.
variable labels n110 'N110 - Q36.A2 What were the total number of person-days employed in the last 12 months for each of the following tasks: NOT From local village Days {Land preparation/Ploughing}'.

if Q36_B1 > 0  n111 = Q36_B1. 
exe.
variable labels n111 'N111 - Q36_B1 What were the total number of person-days employed in the last 12 months for each of the following tasks:From local village Days {Harvesting}'.

if Q36_B2 > 0  n112 = Q36_B2. 
exe.
variable labels n112 'N112 - Q36_B2 What were the total number of person-days employed in the last 12 months for each of the following tasks: NOT From local village Days {Harvesting}'.

if Q36_C1 > 0  n113 = Q36_C1. 
exe.
variable labels n113 'N113 - Q36_C1 What were the total number of person-days employed in the last 12 months for each of the following tasks:From local village Days {Sowing, planting, transplanting}'.


if Q36_C2 > 0  n114 = Q36_C2. 
exe.
variable labels n114 'N114 - Q36_C2 What were the total number of person-days employed in the last 12 months for each of the following tasks: NOT From local village Days {Sowing, planting, transplanting}'.

if Q36_D1 > 0  n115 = Q36_D1. 
exe.
variable labels n115 'N115 - Q36_D1 What were the total number of person-days employed in the last 12 months for each of the following tasks:From local village Days {Weeding}'.

if Q36_D2 > 0  n116 = Q36_D2. 
exe.
variable labels n116 'N116 - Q36_D2 What were the total number of person-days employed in the last 12 months for each of the following tasks: NOT From local village Days {Weeding}'.

if Q36_E1 > 0  n117 = Q36_E1. 
exe.
variable labels n117 'N117 - Q36_E1 What were the total number of person-days employed in the last 12 months for each of the following tasks:From local village Days {Pest management}'.

if Q36_E2 > 0  n118 = Q36_E2. 
exe.
variable labels n118 'N118 - Q36_E2 What were the total number of person-days employed in the last 12 months for each of the following tasks: NOT From local village Days {Pest management}'.


compute n119 = sum(n109, n111, n113, n115, n117).
exe.
variable labels n119 'N119 - Q36 What were the total number of person-days employed in the last 12 months for all five tasks from local village.'.

compute n120 = sum(n110, n112, n114, n116, n118).
exe.
variable labels n120 'N120 - Q36 What were the total number of person-days employed in the last 12 months for all five tasks NOT from local village.'.


compute n121 = sum(n119, n120).
exe.
variable labels n121 'N121 - Q36 What were the total number of person-days employed in the last 12 months for all five tasks from anywhere.'.


RECODE Q37_A (1=1) (2=0) (99 = 99).
value labels Q37_A 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_B (1=1) (2=0)(99 = 99).
value labels Q37_B 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_C (1=1) (2=0)(99 = 99).
value labels Q37_C 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_D (1=1) (2=0)(99 = 99).
value labels Q37_D 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_E (1=1) (2=0)(99 = 99).
value labels Q37_E 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_F (1=1) (2=0)(99 = 99).
value labels Q37_F 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_G (1=1) (2=0)(99 = 99).
value labels Q37_G 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_H (1=1) (2=0)(99 = 99).
value labels Q37_H 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_I (1=1) (2=0)(99 = 99).
value labels Q37_I 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

RECODE Q37_J (1=1) (2=0)(99 = 99).
value labels Q37_J 0 'No' 1 'Yes' 99 "Don't know".
EXECUTE.

compute N122  = 0.
if sysmis(Q37_A) N122 = $sysmis.
if Q37_A ~= 99 N122 = N122 + q37_a.
if Q37_B ~= 99 N122 = N122 + q37_B.
if Q37_C ~= 99 N122 = N122 + q37_C.
if Q37_D ~= 99 N122 = N122 + q37_D.
if Q37_E ~= 99 N122 = N122 + q37_E.
if Q37_F ~= 99 N122 = N122 + q37_F.
if Q37_G ~= 99 N122 = N122 + q37_G.
if Q37_H ~= 99 N122 = N122 + q37_H.
if Q37_I  ~= 99 N122 = N122 + q37_I.
if Q37_J ~= 99 N122 = N122 + q37_J.
exe.

variable labels n122 "N122 - Q37 Total number of 'novel' farming methods used in the last two years out of 10 possible".

compute N123 = Q39_A1.
if q39_A1 = 1 n123 = q39_A1 + q39_A2.
variable labels n123 'N123 - Did you ever receive advice from the Agricultural serices on planting new corps and if yes, did you act on it?'.
value labels N123 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.


compute N124 = Q39_B1.
if Q39_B1 = 1 n124 = Q39_B1 + Q39_B2.
variable labels n124 'N124 - Did you ever receive advice from the Agricultural serices on information on new seeds and if yes, did you act on it?'.
value labels N124 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.


compute N125 = Q39_C1.
if Q39_C1 = 1 n125 = Q39_C1 + Q39_C2.
variable labels n125 'N125 - Did you ever receive advice from the Agricultural serices on information on intercropping or mixed cropping and if yes, did you act on it?'.
value labels N125 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N126 = Q39_D1.
if Q39_D1 = 1 n126 = Q39_D1 + Q39_D2.
variable labels n126 'N126 - Did you ever receive advice from the Agricultural serices on information on double cropping on the same plot and if yes, did you act on it?'.
value labels N126 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N127 = Q39_E1.
if Q39_E1 = 1 n127 = Q39_E1 + Q39_E2.
variable labels n127 'N127 - Did you ever receive advice from the Agricultural serices on information on plant spacing and if yes, did you act on it?'.
value labels N127 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N128 = Q39_F1.
if Q39_F1 = 1 n128 = Q39_F1 + Q39_F2.
variable labels n128 'N128 - Did you ever receive advice from the Agricultural serices on managing pests and/or use of pesticides and if yes, did you act on it?'.
value labels N128 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N129 = Q39_G1.
if Q39_G1 = 1 n129 = Q39_G1 + Q39_G2.
variable labels n129 'N129 - Did you ever receive advice from the Agricultural serices on fertilisers and if yes, did you act on it?'.
value labels N129 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N130 = Q39_H1.
if Q39_H1 = 1 n130 = Q39_H1 + Q39_H2.
variable labels n130 'N130 - Did you ever receive advice from the Agricultural serices on the use of farm machinery and if yes, did you act on it?'.
value labels N130 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N131 = Q39_I1.
if Q39_I1 = 1 n131 = Q39_I1 + Q39_I2.
variable labels n131 'N131 - Did you ever receive advice from the Agricultural serices on waterr management and if yes, did you act on it?'.
value labels N131 0 "Didn't receive advice" 1 "Did receive advice, but didn't act on it" 2 "Did receive advice and acted on it".
exe.

compute N132 = q40_I.
if N132 = 1 N132 = N132 + Q40_I_OT_SP.
exe.
variable labels n132 'N132 - fQ40.I. Tell me which of those sources of your knowledge for faming are? {Others}'.
value labels N132 0 "None" 2 "self experience in farm work" 3 "Agricultural literature, information, Education and comunication materials".
exe.


compute N133 = q40_1.
if q40_1_OT_SP = 1 N133 = 9.
if q40_1_OT_SP = 2 N133 = 10.
exe.
variable labels N133 "N133 - Which one is the most important source of your knowledge for farming?".
value labels N133  9 "self experience in farm work" 10 "Agricultural literature, information, Education and comunication materials".
APPLY DICTIONARY from *
  /SOURCE VARIABLES = q40_1
/TARGET VARIABLES = N133
/varinfo valllabels = merge.

compute N134 = q40_2.
if q40_2_OT_SP = 1 N134 = 9.
if q40_2_OT_SP = 2 N134 = 10.
exe.
variable labels N134 "N134 - Which one is the second most important source of your knowledge for farming?".
value labels N134  9 "self experience in farm work" 10 "Agricultural literature, information, Education and comunication materials".
APPLY DICTIONARY from *
  /SOURCE VARIABLES = q40_2
/TARGET VARIABLES = N134
/varinfo valllabels = merge.

compute N135 = q40_3.
if q40_3_OT_SP = 1 N135 = 9.
if q40_3_OT_SP = 2 N135 = 10.
exe.
variable labels N135 "N135 - Which one is the third most important source of your knowledge for farming?".
value labels N135  9 "self experience in farm work" 10 "Agricultural literature, information, Education and comunication materials".
APPLY DICTIONARY from *
  /SOURCE VARIABLES = q40_3
/TARGET VARIABLES = N135
/varinfo valllabels = merge.


compute N136 = q43_1.
if q43_1 = 96 N136 = q43_1_OT_SP + 5.
exe.
variable labels N136 "N136 - Which one is the most important reason your corp yields are increasing?".
value labels N136  6 "Use more soil fertilizer" 7 "Better soil quality" 8 "Better weather" 9 "Change soil fertiliser"
10  "Better land preparation" 11 "Planting in fallow land" 12 "Change planting method due to soil condition"  13"Using plant fertilizer".

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q43_1
/TARGET VARIABLES = N136
/varinfo valllabels = merge.

compute N137 = q43_2.
if q43_2 = 96 N137 = q43_2_OT_SP + 5.
exe.
variable labels N137 "N137 - Which one is the second most important reason your corp yields are increasing?".
value labels N137  6 "Use more soil fertilizer" 7 "Better soil quality" 8 "Better weather" 9 "Change soil fertiliser"
10  "Better land preparation" 11 "Planting in fallow land" 12 "Change planting method due to soil condition"  13"Using plant fertilizer".

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q43_2
/TARGET VARIABLES = N137
/varinfo valllabels = merge.


compute N138 = q44_1.
if q44_1 = 96 N138 = q44_1_OT_SP + 6.
exe.
variable labels N138 "N138 - Which one is the most important reason your corp yields are decreasing?".
value labels N138  7 "Pest destroy" 8 "Flood" 9 "Labour hiring charges"
10  "Confiscate" 11 "Improper water nmanagement" 12 "Earthquake" .

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q44_1
/TARGET VARIABLES = N138
/varinfo valllabels = merge.

compute N139 = q44_2.
if q44_2 = 96 N139 = q44_2_OT_SP + 6.
exe.
variable labels N139 "N139 - Which one is the second most important reason your corp yields are decreasing?".
value labels N139  7 "Pest destroy" 8 "Flood" 9 "Labour hiring charges"
10  "Confiscate" 11 "Improper water nmanagement" 12 "Earthquake" .

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q44_2
/TARGET VARIABLES = N139
/varinfo valllabels = merge.


compute N140 = q45_1.
if q45_1 = 96 N140 = q45_1_OT_SP + 12.
exe.
variable labels N140 "N140 - Which one is the most important main challenge you face with farming on your land?".
value labels N140  13 "High incidence of insect bites" 17 "machinery malfunctioning".

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q45_1
/TARGET VARIABLES = N140
/varinfo valllabels = merge.



compute N141 = q45_2.
if q45_2 = 96 N141 = q45_2_OT_SP + 12.
exe.
variable labels N141 "N141 - Which one is the second most important main challenge you face with farming on your land?".
value labels N141   17 "machinery malfunctioning".

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q45_2
/TARGET VARIABLES = N141
/varinfo valllabels = merge.

compute N142 = q46_1.
if q46_1 = 96 N142 = q46_1_OT_SP + 10.
exe.
variable labels N142 "N142 - Which one is the most important main challenge to farming faced by the community as a whole?".
value labels N142  12 "High incidence of insect destroying" 13 "Flood" 14 "Imporper way of managing water"
19 "Late time line of farm work". 

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q46_1
/TARGET VARIABLES = N142
/varinfo valllabels = merge.


compute N143 = q46_2.
if q46_2 = 96 N143 = q46_2_OT_SP + 10.
exe.
variable labels N143 "N143 - Which one is the second most important main challenge to farming faced by the community as a whole?".
value labels N143  11 "Expensive cost for soil fertilizer" 12 "High incidence of insect destroying" 13 "Flood" 14 "Imporper way of managing water"
15 "Financial difficultu expensive labour and fertilizer chargers/exploit" 16 "Uncontrollable weed" 18 "Confiscate" 19 "Late time line of farm work". 

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q46_2
/TARGET VARIABLES = N143
/varinfo valllabels = merge.


compute N144 = q46_3.
if q46_3 = 96 N144 = q46_3_OT_SP + 10.
exe.
variable labels N144 "N144 - Which one is the third most important main challenge to farming faced by the community as a whole?".
value labels N144  11 "Expensive cost for soil fertilizer" 12 "High incidence of insect destroying" 13 "Flood" 14 "Imporper way of managing water"
15 "Financial difficultu expensive labour and fertilizer chargers/exploit" 16 "Uncontrollable weed" 17 "Imporper transportation"18 "Confiscate" 19 "Late time line of farm work". 

APPLY DICTIONARY from *
  /SOURCE VARIABLES = q46_3
/TARGET VARIABLES = N144
/varinfo valllabels = merge.

compute N145 =  Q52_A1.
if  Q52_A1 = 1 N145 = Q52_A.
exe.
value labels N145 0 'No'.
APPLY DICTIONARY from *
  /SOURCE VARIABLES = q52_A
/TARGET VARIABLES = N145
/varinfo valllabels = merge.
variable labels N145 "N145 - (Q52.A1) We want to know if you have any plans for your land after your death. {Leave all my land to one person.  Who?}".


count N146 = Q52_B1_1 Q52_B1_2 Q52_B1_3 Q52_B1_4 Q52_B1_5 Q52_B1_6 Q52_B1_7 Q52_B1_8 Q52_B1_9 (1).
exe.
variable labels N146 "N146 temporary var". 

compute N147 = 12.
if Q52_B1 = 0 N147 = 0.
if N146 = 1 AND Q52_B1_1 = 1 N147 = 1.
if N146 = 1 AND Q52_B1_2 = 1 N147 = 2.
if N146 = 1 AND Q52_B1_3 = 1 N147 = 3.
if N146 = 1 AND Q52_B1_4 = 1 N147 = 4.
if N146 = 1 AND Q52_B1_7 = 1 N147 = 7.
if N146 = 1 AND Q52_B1_8 = 1 N147 = 8.
if N146 = 1 AND Q52_B1_9 = 1 N147 = 9.
if N146 = 2 AND  Q52_B1_2 = 1 AND  Q52_B1_3 = 1 N147 = 10.
if N146 = 2 AND  Q52_B1_2 = 1 AND  Q52_B1_4 = 1 N147 = 11.

value labels N147 0 'No' 1 'Spouse' 2 'Children' 3 'grandchildren' 4 'children-in-law' 7 'siblings' 8 'other family' 9'other non family'
10 'Child(ren) and grandchild(ren)' 11 'Child(ren) and child(ren)-in-law' 12 'other'.
variable labels N147 "N147 - Q52.B1.1-9 We want to know if you have any plans for your land after your death. {Divide my land between more than one person. Who?}".


compute N148 = Q52_E1.
value labels N148 0 "No" 1 "Leasing". 
variable labels N148 "N148 - (Q52.E1.) We want to know if you have any plans for your land after your death. {Other Specify}".


compute N149 = sum(Q54_A_1, Q54_A_2, Q54_B_1, Q54_B_2, Q54_C_1, Q54_C_2, Q54_D_1, Q54_D_2, Q54_E_1, Q54_E_2, Q54_F_1, Q54_F_2, Q54_G_1, Q54_G_2).
exe.
variable labels N149 "N149 - Total number of agricultural machines owned or rented".


compute N150 = Q56_E.
if Q56_E =1 N150 = Q56_E_OT_SP. 
exe.
value labels N150 0 'No'.
APPLY DICTIONARY from *
  /SOURCE VARIABLES = q56_E_OT_SP
/TARGET VARIABLES = N150
/varinfo valllabels = merge.
variable labels N150 "N150 - Q56.E. If yes, where did you hear about the agricultural machinery? {Other Specify}".



RECODE Q63_2_1_Crop_1 (32=16).
RECODE Q63_2_2_Crop_1 (32=16).
RECODE Q63_2_3_Crop_1 (32=16).
RECODE Q63_2_1_Crop_2 (32=16).
RECODE Q63_2_2_Crop_2 (32=16).
RECODE Q63_2_3_Crop_2 (32=16).
RECODE Q63_2_1_Crop_3 (32=16).
RECODE Q63_2_2_Crop_3 (32=16).
RECODE Q63_2_3_Crop_3 (32=16).
RECODE Q63_2_1_Crop_4 (32=16).
RECODE Q63_2_2_Crop_4 (32=16).
RECODE Q63_2_3_Crop_4 (32=16).
EXECUTE.

Compute N151 = 0.
if q2 < 60 N151 = 1.
variable labels n151 "N151 Over or under 60".
value lables n151 1 "Under 60" 0 "60 or over".

compute N152 = 0.
if id1 = 14 N152 = 1.
variable labels N152 "N152 Agricultural zone".
value labels N152 0 "Dry zone" 1 "Delta". 

variable level n151 n152 (nominal).

