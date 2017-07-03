* Encoding: UTF-8.
************************************************************************************
* Additional data request - age distribution of people in farming occupations:
************************************************************************************
* Instructions: Please replace the folder paths:
* 1. in line 11 to the data file
* 2. in line 26 to where the Excel output tabl ewill be saved
************************************************************************************

GET
FILE='C:\Users\sfos0247\Dropbox\analysis\Myanmar\MyanmarFieldwork\census\data\one percent.sav'.

USE ALL.
SELECT IF (form_type  = 1).
SELECT IF (p23_occupation = 611 or p23_occupation = 612  or p23_occupation = 613 or p23_occupation = 614 or p23_occupation = 631 or
p23_occupation = 632 or p23_occupation = 633).
EXE.

************************************************************************************
  ** OUTPUT MANAGMENT 

OMS
/SELECT TABLES
/IF COMMANDS=['Crosstabs'] SUBTYPES=['Crosstabulation']
/DESTINATION FORMAT=XLSX 
OUTFILE='C:\farmers.xlsx' VIEWER=YES
/TAG='out'.

************************************************************************************
  * CROSSTABS 

CROSSTABS
/TABLES= p05_age BY p22_activity_status 
/FORMAT=AVALUE TABLES
/CELLS=COUNT  
/COUNT ROUND CELL.

************************************************************************************
  * END EXPORT
************************************************************************************
 
OMSEND TAG=['out'].




