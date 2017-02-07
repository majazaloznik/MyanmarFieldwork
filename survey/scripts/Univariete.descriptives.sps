* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.

FREQUENCIES VARIABLES=Q1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q2
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q3
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q4
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q5
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_A
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_B
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_C
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_D
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_E
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_F
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_G
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q6_H
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COMPUTE N1=Q6_A + Q6_B + Q6_C +  Q6_D + Q6_E   + Q6_F +Q6_G.
VARIABLE LABELS  N1 'Number of dificultuies reported'.
EXECUTE.

FREQUENCIES VARIABLES=N1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q7
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q7
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

RECODE Q7_5$01 Q7_5$02 Q7_5$03 Q7_5$04 Q7_5$05 Q7_5$06 Q7_5$07 Q7_5$08 Q7_5$09 Q7_5$10 Q7_5$11 Q7_5$12 Q7_5$13 Q7_5$14 Q7_5$15 (1=1) (2=0).
EXECUTE.

COMPUTE N2 = sum(Q7_5$01 , Q7_5$02 , Q7_5$03 , Q7_5$04, Q7_5$05 ,Q7_5$06 ,Q7_5$07, Q7_5$08 ,Q7_5$09 ,Q7_5$10 ,Q7_5$11, Q7_5$12 ,Q7_5$13 ,Q7_5$14 ,Q7_5$15).
VARIABLE LABELS  N2 'Number of HH members working outside village part of the year'.
EXECUTE.

FREQUENCIES VARIABLES=N2
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N3=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
    Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(1).
VARIABLE LABELS  N3 'Number of HH members working in another village in same township'.
EXECUTE.

FREQUENCIES VARIABLES=N3
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N4=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
    Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(2).
VARIABLE LABELS  N4 'Number of HH members working in another township'.
EXECUTE.

FREQUENCIES VARIABLES=N4
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N5=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
    Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(3).
VARIABLE LABELS  N5 'Number of HH members working in a city in Myanmar e.g. Yangon or Mandalay'.
EXECUTE.

FREQUENCIES VARIABLES=N5
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N6=Q7_6$01 Q7_6$02 Q7_6$03 Q7_6$04 Q7_6$05 Q7_6$06 Q7_6$07 Q7_6$08 Q7_6$09 Q7_6$10 Q7_6$11 
    Q7_6$12 Q7_6$13 Q7_6$14 Q7_6$15(4).
VARIABLE LABELS  N6 'Number of HH members working outside Myanmanr'.
EXECUTE.

FREQUENCIES VARIABLES=N6
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N7=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(1).
VARIABLE LABELS  N7 'Former HH members that have moved out that are Spouses'.
EXECUTE.

FREQUENCIES VARIABLES=N7
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N8=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(2).
VARIABLE LABELS  N8 'Former HH members that have moved out that are Children'.
EXECUTE.

FREQUENCIES VARIABLES=N8
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N9=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(3).
VARIABLE LABELS  N9 'Former HH members that have moved out that are grandchildren'.
EXECUTE.

FREQUENCIES VARIABLES=N9
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N10=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(4).
VARIABLE LABELS  N10 'Former HH members that have moved out that are Children in law'.
EXECUTE.

FREQUENCIES VARIABLES=N10
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N11=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(5).
VARIABLE LABELS  N11 'Former HH members that have moved out that are Parents'.
EXECUTE.

FREQUENCIES VARIABLES=N11
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N12=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(6).
VARIABLE LABELS  N12 'Former HH members that have moved out that are parents in law'.
EXECUTE.

FREQUENCIES VARIABLES=N12
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N13=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(7).
VARIABLE LABELS  N13 'Former HH members that have moved out that are siblings'.
EXECUTE.

FREQUENCIES VARIABLES=N13
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N14=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(8).
VARIABLE LABELS  N14 'Former HH members that have moved out that are other family'.
EXECUTE.

FREQUENCIES VARIABLES=N14
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N15=Q8_1$01 Q8_1$02 Q8_1$03 Q8_1$04 Q8_1$05 Q8_1$06 Q8_1$07 Q8_1$08 Q8_1$09 Q8_1$10 Q8_1$11 
    Q8_1$12 Q8_1$13 Q8_1$14 Q8_1$15(9).
VARIABLE LABELS  N15 'Former HH members that have moved out that are other non family'.
EXECUTE.

FREQUENCIES VARIABLES=N15
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N16=Q8_2$01 Q8_2$02 Q8_2$03 Q8_2$04 Q8_2$05 Q8_2$06 Q8_2$07 Q8_2$08 Q8_2$09 Q8_2$10 Q8_2$11 
    Q8_2$12 Q8_2$13 Q8_2$14 Q8_2$15(1).
VARIABLE LABELS  N16 'Number of former HH members that have moved out that are male'.
EXECUTE.

FREQUENCIES VARIABLES=N16
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N17=Q8_2$01 Q8_2$02 Q8_2$03 Q8_2$04 Q8_2$05 Q8_2$06 Q8_2$07 Q8_2$08 Q8_2$09 Q8_2$10 Q8_2$11 
    Q8_2$12 Q8_2$13 Q8_2$14 Q8_2$15(2).
VARIABLE LABELS  N17 'Number of former HH members that have moved out that are female'.
EXECUTE.

FREQUENCIES VARIABLES=N18
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N18=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
    Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(1).
VARIABLE LABELS  N18 'Number of former HH members that have moved out for employment (search for employment)'.
EXECUTE.

FREQUENCIES VARIABLES=N18
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N19=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
    Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(2).
VARIABLE LABELS  N19 'Number of former HH members that have moved out for educaiton'.
EXECUTE.

FREQUENCIES VARIABLES=N19
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N20=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
    Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(3).
VARIABLE LABELS  N20 'Number of former HH members that have moved out for marriage'.
EXECUTE.

FREQUENCIES VARIABLES=N20
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N21=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
    Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(4).
VARIABLE LABELS  N21 'Number of former HH members that have moved out because followed family'.
EXECUTE.

FREQUENCIES VARIABLES=N21
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N22=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
    Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(5).
VARIABLE LABELS  N22 'Number of former HH members that have moved out becasue of conflict'.
EXECUTE.

FREQUENCIES VARIABLES=N22
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N23=Q8_4$01 Q8_4$02 Q8_4$03 Q8_4$04 Q8_4$05 Q8_4$06 Q8_4$07 Q8_4$08 Q8_4$09 Q8_4$10 Q8_4$11 
    Q8_4$12 Q8_4$13 Q8_4$14 Q8_4$15(6).
VARIABLE LABELS  N23 'Number of former HH members that have moved out becasue of becoming a monk'.
EXECUTE.

FREQUENCIES VARIABLES=N23
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N24=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
    Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(1).
VARIABLE LABELS  N24 'Number of former HH members that have moved out into separate household within same building'.
EXECUTE.

FREQUENCIES VARIABLES=N24
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N25=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
    Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(2).
VARIABLE LABELS  N25 'Number of former HH members that have moved out into same town/village, walking distance'.
EXECUTE.

FREQUENCIES VARIABLES=N25
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N26=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
    Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(3).
VARIABLE LABELS  N26 'Number of former HH members that have moved out into same town/village, not in walking distance'.
EXECUTE.

FREQUENCIES VARIABLES=N26
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N27=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
    Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(4).
VARIABLE LABELS  N27 'Number of former HH members that have moved out into different town/village but close enough for regular visits'.
EXECUTE.

FREQUENCIES VARIABLES=N27
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COUNT N28=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
    Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(5).
VARIABLE LABELS  N28 'Number of former HH members that have moved out into different town/village but too far for regular visits'.
EXECUTE.

FREQUENCIES VARIABLES=N28
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COUNT N29=Q8_5$01 Q8_5$02 Q8_5$03 Q8_5$04 Q8_5$05 Q8_5$06 Q8_5$07 Q8_5$08 Q8_5$09 Q8_5$10 Q8_5$11 
    Q8_5$12 Q8_5$13 Q8_5$14 Q8_5$15(6).
VARIABLE LABELS  N29 'Number of former HH members that have moved out into different t country'.
EXECUTE.

FREQUENCIES VARIABLES=N29
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q9
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q10
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q11
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q12
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q13
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q14
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COMPUTE N30 = sum(Q15_A, Q15_B, Q15_C, Q15_D, Q15_F, Q15_G, Q15_H, Q15_I, Q15_J).
VARIABLE LABELS  N30 'Number of lenders listed as sources of largest loan in last 12 months'.
EXECUTE.

FREQUENCIES VARIABLES=N30
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_A
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_B
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_C
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_D
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_F
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_G
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_H
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_I
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_J
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_J_96_OT_SP_1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_J_96_OT_SP_2
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q15_J_96_OT_SP_3
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q16
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q17
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q18
  /HISTOGRAM
  /ORDER=ANALYSIS.

COMPUTE N31=sum(Q17, -Q18).
VARIABLE LABELS  N31 'Difference between land ownership and  cultivation'.
EXECUTE.

FREQUENCIES VARIABLES=N31
  /HISTOGRAM
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=Q19
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q20_A
  /HISTOGRAM
  /ORDER=ANALYSIS.


COMPUTE N32=sum(Q17, -Q18, -Q20_A).
VARIABLE LABELS  N32 'Difference between land ownership and  cultivation + lease out = this is fallow land'.
EXECUTE.

FREQUENCIES VARIABLES=N32
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q21
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q22
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q23
  /HISTOGRAM
  /ORDER=ANALYSIS.

COMPUTE N33=sum(Q22, -Q23).
VARIABLE LABELS  N33 'Difference between land renting and cultivating rented land (= fallow rented land)'.
EXECUTE.

FREQUENCIES VARIABLES=N33
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q24
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

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

FREQUENCIES VARIABLES=N34
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


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

FREQUENCIES VARIABLES=N35
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COMPUTE N36 = max(n34, n35).
* test that this is actually uniquely defined
COMPUTE N37 = min(n34, n35).
*compute test = (N36-N37).
*exe.
*FREQUENCIES VARIABLES= test
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

VARIABLE LABELS N36 'N36 - Relationship of other family member that is co- or solo farm manager (Based on Q24).' .
exe.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q7_2$01
  /TARGET VARIABLES = N36
/varinfo valllabels = merge.

FREQUENCIES VARIABLES=N36
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q25
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q26
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q27
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

*TEMPORARY. 
*RECODE Q24 Q27 (SYSMIS=-99).
*CROSSTABS Q24 BY Q27.

FREQUENCIES VARIABLES=Q28_A
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

TEMPORARY. 
RECODE Q28_A Q28_A_OT_SP (SYSMIS=-99).
CROSSTABS Q28_A BY Q28_A_OT_SP.

COMPUTE N37 = max(Q28_A, Q28_A_OT_SP).
exe.

VARIABLE LABELS N37 'N37 - (Q28A) When no longer able to visit my land, I will continue to manage the farm jointly with one of my children/children-in-laws.}'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_A_OT_SP
  /TARGET VARIABLES = N37
  /varinfo valllabels = replace.

add value labels N37 0 'No'.

FREQUENCIES VARIABLES=N37
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COMPUTE N38 = max(Q28_B, Q28_B_OT_SP).
exe.
VARIABLE LABELS N38 'N38 - (Q28B) When no longer able to visit my land, I will hand over the management of the farm to one of my children/in-law.'.
APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_B_OT_SP
  /TARGET VARIABLES = N38
  /varinfo valllabels = replace.

add value labels N38 0 'No'.

FREQUENCIES VARIABLES=N38
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

COMPUTE N39 = max(Q28_C, Q28_C_OT_SP).
exe.
VARIABLE LABELS N39 'N39 - (Q28C) When no longer able to visit my land,I will continue to manage the farm jointly with another member of my family.(i.e. not children or children-in-law).'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_C_OT_SP
  /TARGET VARIABLES = N39
  /varinfo valllabels = replace.

add value labels N39 0 'No'.

FREQUENCIES VARIABLES=N39
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COMPUTE N40 = max(Q28_D, Q28_D_OT_SP).
exe.
VARIABLE LABELS N40 'N40 - (Q28D) When no longer able to visit my land, I will hand over the management of the farm to another member of my family.(i.e. not children or children-in-law)'.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_D_OT_SP
  /TARGET VARIABLES = N40
  /varinfo valllabels = replace.

add value labels N40 0 'No'.

FREQUENCIES VARIABLES=N40
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=Q28_E
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q28_F
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


COMPUTE N41 = max(Q28_G, Q28_G_OT_SP).
exe.
VARIABLE LABELS N41 'N41 - (Q28G) When no longer able to visit my land, do something else '.

APPLY DICTIONARY from *
  /SOURCE VARIABLES = Q28_G_OT_SP
  /TARGET VARIABLES = N41
  /varinfo valllabels = replace.

add value labels N41 0 'No'.

FREQUENCIES VARIABLES=N41
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

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
VARIABLE LABELS N42 'N42 - (Q28) When no longer able to visit my land, two answers'.
VARIABLE LABELS N43 'N43 - (Q28) When no longer able to visit my land, two answers, both relatives'.
VARIABLE LABELS N44 'N44 - (Q28) When no longer able to visit my land, two answers, rent and sell'.exe.
 if N42 = 1 AND N43 = 0 AND N44 =0  N45 = 1.
VARIABLE LABELS N45 'N45 - (Q28) When no longer able to visit my land, two answers, one relative, other rent/sell'.
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
variable labels N46 - 'N46 Q28 consolidated - When no longer able to visit my land:'. 
value  labels N46 1 'continue farming jointly with child(in-law)' 
2 'hand over to child(-in-law)' 3 'continue farming jointly with other relative' 
4 ' hand over to other relative' 5 'rent out land' 6 'try to sell land' 7'self manage with hired labour'
8 'two answers relatives' 9 'two answeres rent/sell' 10 'two answers one relative and one rent/sell'.

FREQUENCIES VARIABLES=N46
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=Q29a
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q29B
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q30_A
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q30_B
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q30_C
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

compute N47 = SUM(Q30_A, Q30_B, Q30_C).
IF N47 = 2 N47 = 1.
EXE.
variable labels N47 - 'N47 Q30 consolidated - Size of farm increased in last 5 years in any way.:'. 
value  labels N47 1 'Yes' 0 ' No'. 

FREQUENCIES VARIABLES=N47
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=Q30_A_ACRE
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q30_b_ACRE
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q30_c_ACRE
  /HISTOGRAM
  /ORDER=ANALYSIS.


compute N48 = SUM(Q30_A_ACRE, Q30_B_ACRE, Q30_C_ACRE).
EXE.
variable labels N48 - 'N48 Q30_ACRE SUM - Total numebr of acres size of farm increased in last 5 years in any way.:'. 

FREQUENCIES VARIABLES=N48
  /HISTOGRAM
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=Q31
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_A1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_A2
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_A3
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_A4
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_A5
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

count N49 = Q31_A1 Q31_A2 Q31_A3 Q31_A4 Q31_A5 (1). 
EXE.
variable labels N49  'N49 Q31_A consolidated - Number of reasons for decrease in farm size in last five years.:'. 

FREQUENCIES VARIABLES=N49
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


compute N50 = 0.
if  Q31_A1 =1  N50 = 1.
if  Q31_A2 =1  N50 = 2.
if  Q31_A3 =1  N50 = 3.
if  Q31_A4 =1  N50 = 4.
if  Q31_A5 =1  N50 = 5.
EXE.
VALUE LABELS N50 0 'No decrease' 1 'Sold' 2 'Let' 3 'Gave away' 4 'Had confiscated' 5 'River erosion'.
variable labels N50  'N50 - Q31_A consolidated - Reason for decrease in farm size in last five years.:'. 

FREQUENCIES VARIABLES=N50
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_B1
  /HISTOGRAM PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_B2
  /HISTOGRAM PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_B3
  /HISTOGRAM PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_B4
  /HISTOGRAM PERCENT
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Q31_B5
  /HISTOGRAM PERCENT
  /ORDER=ANALYSIS.

COMPUTE N51 = sum(Q31_B1, Q31_B2, Q31_B3, Q31_B4, Q31_B5). 
EXE.
variable labels N51 - 'N51 Q31_B consolidated - Total number of acers of decrease in farm size in last five years.:'. 

FREQUENCIES VARIABLES=N51
  /HISTOGRAM PERCENT
  /ORDER=ANALYSIS.


*compute N52 = 0.
if  Q31_C1_1 =1  N52 = 1.
if  Q31_C1_2 =1  N52 = 2.
if  Q31_C1_3_OT_SP =1  N52 = 3.
if  Q31_C1_3_OT_SP =2  N52 = 4.
EXE.
VALUE LABELS N52 0 'No sale' 1 'Debt' 2 'Too large to manage' 3 'Emergency need for money' 4 'Did not want land anymore '.
variable labels N52  'N52 - from Q31_C1 - Reason for sale of land'. 

FREQUENCIES VARIABLES=N52
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


*count N53 = Q31_C2_1 Q31_C2_2 Q31_C2_3 (1). 
*exe.
*compute N53 = 0.

if  Q31_C2_1 =1  N53 = 1.
if  Q31_C2_2 =1  N53 = 2.
EXE.
VALUE LABELS N53 0 'No letting out' 1 'Debt' 2 'Too large to manage' 3 'Emergency need for money' 4 'Did not want land anymore '.
variable labels N53  'N53 - from Q31_C2 - Reason for letting out of land'. 

FREQUENCIES VARIABLES=N53
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


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

FREQUENCIES VARIABLES=N54
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


*count N55 = Q31_C4_1 Q31_C4_2 Q31_C4_3 (1). 
*exe.
*compute N55 = 0.

if  Q31_C4_3_OT_SP=4  N55 = 1.
if  Q31_C4_3_OT_SP=6  N55 = 2.
if  Q31_C4_3_OT_SP=7  N55 = 3.
EXE.
VALUE LABELS N55 0 'No confiscation' 1 'Contribute for canalization or public road' 2 'Rob', 3 'Confiscated'.
variable labels N55  'N55 - from Q31_C4 - Reason for confiscation of land'. 

FREQUENCIES VARIABLES=N55
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


*count N56 = Q31_C5_1 Q31_C5_2 Q31_C5_3 (1). 
*exe.
*compute N56 = 0.

if  Q31_C5_3_OT_SP=3  N56 = 1.
EXE.
VALUE LABELS N53 0 'No other reason' 1 'River erosion'.
variable labels N56  'N56 - from Q31_C5 - Other reasons for decrease in land sizeland'. 

FREQUENCIES VARIABLES=N56
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


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

FREQUENCIES VARIABLES=N57
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=Q32_1_1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

count N58 = Q32_1_2 Q32_1_3 Q32_1_4 (1). 

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
variable label N59 'Production type for first crop'. 
FREQUENCIES VARIABLES=N59
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=Q32_1_1 BY N59
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL
  /barchart.


FREQUENCIES VARIABLES=Q32_2_1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

count N60 = Q32_2_2 Q32_2_3 Q32_2_4 (1). 

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
variable label N61 'Production type for second crop'. 
FREQUENCIES VARIABLES=N61
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=Q32_2_1 BY N61
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL
  /barchart.

FREQUENCIES VARIABLES=Q32_3_1
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

count N62 = Q32_3_2 Q32_3_3 Q32_3_4 (1). 

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
variable label N63 'Production type for third crop'. 
FREQUENCIES VARIABLES=N63
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=Q32_3_1 BY N63
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL
  /barchart.

compute n64 = q33_a1.
if Q33_A = 1 N64 = 0.
exe.
variable label n64 'Do you personaly perform land preparation (ploughing) and if not anymore, how long ago did you stop?'.
value labels n64 99 'Never performed land preparation (ploughign)' 0 'Yes'.
FREQUENCIES VARIABLES=n64
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

compute n65 = q33_B1.
if Q33_b = 1 N65 = 0.
exe.
variable label n65 'Do you personaly perform harvesting and if not anymore, how long ago did you stop?'.
value labels n65 99 'Never performed harvesting' 0 'Yes'.
FREQUENCIES VARIABLES=n65
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

compute n66 = q33_C1.
if Q33_C = 1 N66 = 0.
exe.
variable label n66 'Do you personaly perform sowing, planting and transplanting and if not anymore, how long ago did you stop?'.
value labels n66 99 'Never performed sowing, planting and transplanting' 0 'Yes'.
FREQUENCIES VARIABLES=n64
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


