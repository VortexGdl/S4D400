CLASS zcl_16_abap_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_abap_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(info) = zcl_abap_helper=>get_customer( 000083 ).
         out->write( info ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
