CLASS zcl_16_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA operand1 TYPE p length 4 decimals 2 VALUE '1'.
  DATA operator TYPE c VALUE '+'.
  DATA operand2 TYPE p length 4 decimals 2 VALUE '1'.
  DATA result_p type p length 8 decimals 2.

  case operator.
  when '+'.
    result_p = operand1 + operand2.
  when '-'.
    result_p = operand1 - operand2.
  when '*'.
    result_p = operand1 * operand2.
  when '/'.
    result_p = operand1 / operand2.
  when '%'.
    result_p = operand1 mod operand2.
  when others.
    out->write( 'Operator not supported' ).
    return.
  endcase.

  out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result_p NUMBER = USER }| ).


  ENDMETHOD.
ENDCLASS.
