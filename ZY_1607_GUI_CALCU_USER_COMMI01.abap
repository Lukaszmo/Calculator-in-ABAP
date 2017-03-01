*----------------------------------------------------------------------*
***INCLUDE ZY_1607_GUI_CALCU_USER_COMMI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  DATA:    lv_okcode TYPE syucomm,
           lv_num1 TYPE float,
           lv_num2 TYPE float,
           lv_operation TYPE c.

  MOVE ok_code TO lv_okcode.
  CLEAR ok_code.


  CASE lv_okcode.
    WHEN 'BACK' OR 'CANCEL' OR 'EXIT'.
      LEAVE TO SCREEN 0.

    WHEN 'CLEAR'.
      CLEAR input1.
      input1 = 0.
      CLEAR input2.


    WHEN 'FUNCTB1'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '1' INTO input1.

    WHEN 'FUNCTB2'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '2' INTO input1.

    WHEN 'FUNCTB3'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '3' INTO input1.

    WHEN 'FUNCTB4'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '4' INTO input1.

    WHEN 'FUNCTB5'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '5' INTO input1.

    WHEN 'FUNCTB6'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '6' INTO input1.

    WHEN 'FUNCTB7'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '7' INTO input1.

    WHEN 'FUNCTB8'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '8' INTO input1.

    WHEN 'FUNCTB9'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '9' INTO input1.

    WHEN 'FUNCTB0'.
      IF input1 EQ 0.
        CLEAR input1.
      ENDIF.
      CONCATENATE input1 '0' INTO input1.

    WHEN 'FUNCT_ADDITION'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num1.


      lv_operation = '+'.
      CONCATENATE  input1 lv_operation INTO input2.
      CLEAR input1.


    WHEN 'FUNCT_SUBTRACTION'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num1.

      lv_operation = '-'.
      CONCATENATE input1 lv_operation INTO input2.
      CLEAR input1.

    WHEN 'FUNCT_MULTIP'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num1.

      lv_operation = '*'.
      CONCATENATE input1 lv_operation INTO input2.
      CLEAR input1.

    WHEN 'FUNCT_DIVISION'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num1.

      lv_operation = '/'.
      CONCATENATE input1 lv_operation INTO input2.
      CLEAR input1.

    WHEN 'FUNCT_FACTORIAL'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num1.

      CONCATENATE 'FACT (' input1 ')' INTO input2.

      CALL FUNCTION 'ZFM_DEV1607_FACTORIAL'
        EXPORTING
          im_num1   = lv_num1
        IMPORTING
          ex_result = result.

      char = result.

      CALL FUNCTION 'FTR_CORR_SWIFT_DELETE_ENDZERO'  "this function module delete decimal values zero
        CHANGING
          c_value = char.

      input1 = char.

    WHEN 'FUNCT_SQRT'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num1.

      CONCATENATE 'SQRT (' input1 ')' INTO input2.

      CALL FUNCTION 'ZFM_DEV1607_SQRT'
        EXPORTING
          im_num    = lv_num1
        IMPORTING
          ex_result = result.

      char = result.

      CALL FUNCTION 'FTR_CORR_SWIFT_DELETE_ENDZERO'  "this function module delete decimal values zero
        CHANGING
          c_value = char.

      input1 = char.


    WHEN 'FUNCT_RESULT' OR 'CONT'.

      CALL FUNCTION 'ZFM_DEV1607_CONVERT_IN'
        EXPORTING
          im_input = input1
        IMPORTING
          ex_num   = lv_num2.

      CALL FUNCTION 'ZFM_DEV1607_CALCULATION'
        EXPORTING
          im_num1      = lv_num1
          im_num2      = lv_num2
          im_operation = lv_operation
        IMPORTING
          ex_result    = result.

      CLEAR input2.

      char = result.

      PERFORM convert_char CHANGING char. "this subroutine move minus sign on the left side of result

      CALL FUNCTION 'FTR_CORR_SWIFT_DELETE_ENDZERO'
        CHANGING
          c_value = char.

      input1 = char.


    WHEN OTHERS.

  ENDCASE.



ENDMODULE.                 " USER_COMMAND_0100  INPUT