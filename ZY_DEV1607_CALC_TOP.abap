*&---------------------------------------------------------------------*
*&  Include           ZY_DEV1607_CALC_TOP
*&---------------------------------------------------------------------*

DATA ok_code TYPE syucomm.

DATA: input1(33) VALUE 0,
      input2(33). "view for actual operation.

DATA result TYPE p DECIMALS 5.

DATA char(33).

*&---------------------------------------------------------------------*
*&      Form  CONVERT_CHAR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_CHAR  text
*----------------------------------------------------------------------*
FORM convert_char  CHANGING p_char.

  IF result < 0.
    result = result * -1.
    char = result.
    CONCATENATE '-' char INTO char.

  ENDIF.

ENDFORM.                    "
