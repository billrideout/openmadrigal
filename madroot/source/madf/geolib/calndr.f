C     $Id: calndr.f 3304 2011-01-17 15:25:59Z brideout $
C
      SUBROUTINE CALNDR(YEAR,DAYNO,DAY,MONTH,IER)
C
C     CALNDR returns DAY, MONTH and IER. THE FOLLOWING VARIABLES APPEAR
C     IN THE CALLING SEQUENCE (all INTEGERS).
C
C          YEAR - YEAR (1977)
C         DAYNO - DAY OF THE YEAR (60)
C           DAY - DAY OF THE MONTH (1)
C         MONTH - MONTH NUMBER (3)
C           IER - ERROR INDICATOR. IER IS RETURNED BY ALL ROUTINES IN
C                 THE PACKAGE. IER=0 IF NO ERRORS ARE DETECTED. IER=1
C                 IF AN ERROR IS DETECTED.
C
C     .. Scalar Arguments ..
      INTEGER DAY,DAYNO,IER,MONTH,YEAR
C     ..
C     .. Local Scalars ..
      INTEGER T
C     ..
      IER = 0
      IF (YEAR.LT.0 .OR. DAYNO.LT.0 .OR. DAYNO.GT.366) GO TO 10
      T = 0
      IF (YEAR/4*4.EQ.YEAR .AND. (YEAR/400*400.EQ.YEAR.OR.
     *    YEAR/100*100.NE.YEAR)) T = 1
      DAY = DAYNO
      IF (DAYNO.GT.(59+T)) DAY = DAYNO + 2 - T
      MONTH = (DAY+91)*100/3055
      DAY = DAY + 91 - (MONTH*3055/100)
      MONTH = MONTH - 2
      RETURN
   10 IER = 1
      RETURN
C
      END
