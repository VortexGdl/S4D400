CLASS zcl_16_demo_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.

        DATA(result) = zcl_16_calculator=>divide( operand1 = 10
                                                  operand2 = 0 ).

        out->write( result ).

      CATCH cx_sy_zerodivide INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
