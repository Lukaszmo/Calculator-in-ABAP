FUNCTION zfm_dev1607_calculation.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_NUM1) TYPE  FLOAT
*"     VALUE(IM_NUM2) TYPE  FLOAT
*"     VALUE(IM_OPERATION) TYPE  C
*"  EXPORTING
*"     REFERENCE(EX_RESULT) TYPE  P
*"----------------------------------------------------------------------

  DATA: exref TYPE REF TO cx_root,
        msgtxt TYPE string.

  CASE im_operation.

    WHEN '+'.

      TRY.
          ex_result = im_num1 + im_num2.

        CATCH cx_sy_conversion_overflow INTO exref.
          msgtxt = exref->get_text( ).
          MESSAGE msgtxt TYPE 'E'.
      ENDTRY.

    WHEN '-'.

      TRY.
          ex_result = im_num1 - im_num2.

        CATCH cx_sy_conversion_overflow INTO exref.
          msgtxt = exref->get_text( ).
          MESSAGE msgtxt TYPE 'E'.
      ENDTRY.


    WHEN '*'.

      TRY.
          ex_result = im_num1 * im_num2.

        CATCH cx_sy_conversion_overflow INTO exref.
          msgtxt = exref->get_text( ).
          MESSAGE msgtxt TYPE 'E'.
      ENDTRY.

    WHEN '/'.

      TRY.
          ex_result = im_num1 / im_num2.

        CATCH cx_sy_zerodivide INTO exref.
          msgtxt = exref->get_text( ).
          MESSAGE msgtxt TYPE 'E'.
      ENDTRY.

    WHEN OTHERS.
      MESSAGE 'Unkown operation' TYPE 'E'.

  ENDCASE.


ENDFUNCTION.