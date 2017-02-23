FUNCTION zfm_dev1607_sqrt.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_NUM) TYPE  FLOAT
*"  EXPORTING
*"     REFERENCE(EX_RESULT) TYPE  P
*"----------------------------------------------------------------------
  DATA: exref TYPE REF TO cx_root,
        msgtxt TYPE string.

  TRY.
      ex_result = sqrt( im_num ).

    CATCH cx_sy_conversion_overflow INTO exref.
      msgtxt = exref->get_text( ).
      MESSAGE msgtxt TYPE 'E'.
  ENDTRY.



ENDFUNCTION.