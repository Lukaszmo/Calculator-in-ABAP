FUNCTION zfm_dev1607_convert_in.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_INPUT) TYPE  C
*"  EXPORTING
*"     REFERENCE(EX_NUM) TYPE  FLOAT
*"----------------------------------------------------------------------
  DATA: exref TYPE REF TO cx_root,
        msgtxt TYPE string.

  IF im_input < 0.
    SHIFT im_input LEFT DELETING LEADING '- '.
    CONCATENATE im_input '-' INTO im_input.
  ENDIF.

  TRY.

      ex_num = im_input.

    CATCH cx_sy_conversion_no_number INTO exref.
      msgtxt = exref->get_text( ).
      MESSAGE msgtxt TYPE 'E'.

  ENDTRY.

ENDFUNCTION.