* Encoding: UTF-8.
************************************************************************************
************************************************************************************
* GET DATA - CHANGE FILE PATH!!!
* also replace all C:\Users\Dell\Documents\IBM\SPSS\Statistics\census\output\ with new output path
************************************************************************************

GET
  FILE='D:\one percent.sav'.
DATASET NAME MainFile WINDOW=FRONT.

DATASET ACTIVATE MainFile.

* REMOVE INSTITUTIONS - formtype = 2

USE ALL.
SELECT IF (form_type  = 1).
exe.
DATASET ACTIVATE MainFile.


recode  p21_highest_grade (missing = copy) (0 thru 4 = 0) (5 thru 8 = 1) (9 thru 10 = 2) (11 = 3)
 (12 thru 15 = 4) (16 thru 18 = 5) (19 = 6)  (else = sysmis) into p21_highest_grade_c7.
variable labels p21_highest_grade_c7 'Highest level of education completed (7 categories)'.
formats p21_highest_grade_c7 (F2.0).
value labels p21_highest_grade_c7 0 'None completed' 1 'Elementary completed' 
2 'Middleschool completed' 3 'Highschool completed' 4 'undergraduate' 5 'postgraduate' 6 'other'.
exe.

compute p25_children_born = p25a_children_born_male + p25b_children_born_female.
recode  p25_children_born (missing = copy) (lo through 10 = copy) (11 thru hi = 11) (else = sysmis) into p25_children_born_bound.
variable labels p25_children_born_bound  'Children ever born (bounded)'.
formats p25_children_born_bound (F2.0).
value labels p25_children_born_bound 11 'more than 10'.
exe.

recode p25_children_born (missing = copy) (0 = 0) (else = 9)  into birth_last_year.
if (p29b_last_live_birth_year > 2010 or (p29b_last_live_birth_year  = 2009 and p29a_last_live_birth_month > 3 )) birth_last_year = 5.
if (p29b_last_live_birth_year = 2011 or (p29b_last_live_birth_year  = 2010 and p29a_last_live_birth_month > 3 )) birth_last_year = 4.
if (p29b_last_live_birth_year = 2012 or (p29b_last_live_birth_year  = 2011 and p29a_last_live_birth_month > 3 )) birth_last_year = 3.
if (p29b_last_live_birth_year = 2013 or (p29b_last_live_birth_year  = 2012 and p29a_last_live_birth_month > 3 )) birth_last_year = 2.
if (p29b_last_live_birth_year = 2014 or (p29b_last_live_birth_year  = 2013 and p29a_last_live_birth_month > 3 )) birth_last_year = 1.
exe.
value labels  birth_last_year 0 'no kids' 1 'in last year' 2 'in last 2 years' 3 'in last 3 years' 4 'in last 4 years' 5 'in last 5 years' 9 'over 5 years ago'. 

************************************************************************************
** OUTPUT MANAGMENT 

OMS
  /SELECT TABLES
  /IF COMMANDS=['Crosstabs'] SUBTYPES=['Crosstabulation']
  /DESTINATION FORMAT=SAV NUMBERED=TableNumber_
   OUTFILE='C:\Users\Dell\Documents\IBM\SPSS\Statistics\census\output\MEL01.sav' VIEWER=YES
  /TAG='MEL01.SAV'.

OMS
  /SELECT TABLES
  /IF COMMANDS=['Crosstabs'] SUBTYPES=['Crosstabulation']
  /DESTINATION FORMAT=XLSX
   OUTFILE='C:\Users\Dell\Documents\IBM\SPSS\Statistics\census\output\MEL01.xlsx' VIEWER=YES
  /TAG='MEL01.XLSX'.


CROSSTABS
  /TABLES=birth_last_year BY p30_last_live_birth_sex BY batch_urban_rural
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=birth_last_year BY p30_last_live_birth_sex BY p21_highest_grade_c7
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=birth_last_year BY p30_last_live_birth_sex BY batch_state_region
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=birth_last_year BY p30_last_live_birth_sex BY p25_children_born_bound
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


OMSEND TAG=['MEL01.SAV'].
OMSEND TAG=['MEL01.XLSX'].
