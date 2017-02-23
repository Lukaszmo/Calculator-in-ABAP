FUNCTION zfm_dev1607_factorial.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_FACT) TYPE  I
*"     VALUE(IM_NUM1) TYPE  FLOAT
*"  EXPORTING
*"     REFERENCE(EX_RESULT) TYPE  P
*"----------------------------------------------------------------------
  DATA: exref TYPE REF TO cx_root,
        msgtxt TYPE string.

  ex_result = 1.

  WHILE im_fact < im_num1.
    ADD 1 TO im_fact.

    TRY.
        ex_result = ex_result * im_fact.

      CATCH cx_sy_arithmetic_overflow INTO exref.
        msgtxt = exref->get_text( ).
        MESSAGE msgtxt TYPE 'E'.
    ENDTRY.


  ENDWHILE.
  CLEAR im_fact.



ENDFUNCTION.