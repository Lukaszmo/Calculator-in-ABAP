FUNCTION zfm_dev1607_factorial.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_NUM1) TYPE  FLOAT
*"  EXPORTING
*"     REFERENCE(EX_RESULT) TYPE  P
*"----------------------------------------------------------------------
  DATA: exref TYPE REF TO cx_root,
        msgtxt TYPE string,
        fact TYPE i.

  ex_result = 1.

  IF im_num1 < 0.
    MESSAGE 'You can calculate factorial only for positive integers' TYPE 'E'.

  ELSE.

    WHILE fact < im_num1.
      ADD 1 TO fact.

      TRY.
          ex_result = ex_result * fact.

        CATCH cx_sy_arithmetic_overflow INTO exref.
          msgtxt = exref->get_text( ).
          MESSAGE msgtxt TYPE 'E'.
      ENDTRY.

    ENDWHILE.

  ENDIF.

  CLEAR fact.


ENDFUNCTION.