CLASS zcl_16_abap_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_abap_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operator TYPE c LENGTH 1            VALUE '2'.
    DATA result   TYPE p LENGTH 8 DECIMALS 2.
    DATA operand1 TYPE p LENGTH 8 DECIMALS 2 VALUE 5.
    DATA operand2 TYPE p LENGTH 8 DECIMALS 2 VALUE 0.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        result = operand1 / operand2.
      WHEN '%'.
        result = zcl_00_calculator=>calculate_percentage( percentage = operand1
                                                          base       = operand2 ).
      WHEN '^'.
        TRY.
            result = zcl_abap_calculator=>calculate_power( base     = operand1
                                                           exponent = CONV #( operand2 ) ).
          CATCH zcx_abap_exponent_too_high INTO DATA(x).
            out->write( x->get_text( ) ).
        ENDTRY.
      WHEN '2'.
        TRY.
            result = zcl_abap_calculator=>calculate_power( base = operand1 ).
          CATCH zcx_abap_exponent_too_high INTO x.
            out->write( x->get_text( ) ).
        ENDTRY.
      WHEN OTHERS.
    ENDCASE.

    out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).
  ENDMETHOD.
ENDCLASS.
