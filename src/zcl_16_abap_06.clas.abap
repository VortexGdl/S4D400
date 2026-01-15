CLASS zcl_16_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  data travel_id type  /DMO/TRAVEL_ID VALUE '0000001'.
  try.
     data(travel_with_customer) = zcl_16_helper2=>get_travel_with_customer( travel_id = travel_id ).
  catch zcx_abap_no_data into data(x).
    out->write( x->get_text(  ) ).
  endtry.
  out->write( travel_with_customer ).
  ENDMETHOD.
ENDCLASS.
