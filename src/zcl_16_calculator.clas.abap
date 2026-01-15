CLASS zcl_16_calculator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING operand1      TYPE z00_decimal
                operand2      TYPE z00_decimal
      RETURNING VALUE(result) TYPE z00_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS calculate_percentage
      IMPORTING !percentage             TYPE z00_decimal
                !base                   TYPE z00_decimal
      RETURNING VALUE(percentage_value) TYPE z00_Decimal.
ENDCLASS.


CLASS zcl_16_calculator IMPLEMENTATION.
  METHOD divide.
    " Eingabeprüfung
    IF operand2 IS INITIAL. " IF operand2 = 0.
      RAISE EXCEPTION NEW cx_sy_zerodivide( ).
    ENDIF.

    result = operand1 / operand2.
  ENDMETHOD.

  METHOD calculate_percentage.
    percentage_value = percentage * base / 100.
  ENDMETHOD.
ENDCLASS.
