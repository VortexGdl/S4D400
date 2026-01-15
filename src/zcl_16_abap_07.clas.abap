CLASS zcl_16_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA travels type z16_travels.
  DATA customer_id type /DMO/CUSTOMER_ID VALUE '0000001'.

  try.
  travels = zcl_16_helper=>get_travels( customer_id = customer_id ).
  catch zcx_abap_no_data into data(x).
  return.
endtry.
  out->write( travels ).
  ENDMETHOD.
ENDCLASS.
