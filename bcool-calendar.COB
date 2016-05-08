       IDENTIFICATION DIVISION.
       PROGRAM-ID.  calendar.
       AUTHOR.  B COOL Team
      * Uses accept and display to display what day of the year a given
      * date is.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  YYYYMMDDItem    pic 9(8) value 19921001. *> YYYYMMDD
       77  integerDate     pic 9(8) value ZEROS.
       77  julianDate      pic 9(8) value zeros.    *> YYYYDDD
       77  dayoftheyear    PIC 9(3).

       01 inputDate.
          02  yyyy       PIC 9(4).
          02  mm         PIC 9(2).
          02  dd         PIC 9(2).

      * YYMMDD
       01 CurrentDate.
          02  CurrentYear     PIC 9(4).
          02  CurrentMonth    PIC 99.
          02  CurrentDay      PIC 99.

      * YYDDD
       01 DayOfYear.
          02  FILLER          PIC 9(4).
          02  YearDay         PIC 9(3).




      * HHMMSSss   s = S/100
       01 CurrentTime.
          02  CurrentHour     PIC 99.
          02  CurrentMinute   PIC 99.
          02  FILLER          PIC 9(4).


       PROCEDURE DIVISION.
       Begin.
           DISPLAY "Enter any date in YYYYMMDD format".
           DISPLAY "---------------------------------".
           ACCEPT  YYYYMMDDItem.
           ACCEPT  CurrentDate FROM DATE YYYYMMDD.
           ACCEPT  DayOfYear FROM DAY YYYYDDD.
           ACCEPT  CurrentTime FROM TIME.

           MOVE YYYYMMDDItem to inputDate

           DISPLAY "Date is " mm SPACE dd SPACE yyyy.

           MOVE FUNCTION INTEGER-OF-DATE(YYYYMMDDItem) to integerDate
           MOVE FUNCTION DAY-OF-INTEGER(integerDate) to julianDate
           MOVE FUNCTION MOD(julianDate, 1000) to dayoftheyear

           DISPLAY "Given date day " dayoftheyear " of the year " YYYY.

           DISPLAY "Today is day " YearDay " of the year " CurrentYear.
           DISPLAY "The time is " CurrentHour ":" CurrentMinute.

           STOP RUN.
