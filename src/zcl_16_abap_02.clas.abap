CLASS zcl_16_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA customer_id type /dmo/customer_id.
  data first_name type /dmo/first_name.
  data last_name type /dmo/last_name.
  DATA land TYPE land1.
  data city type /dmo/city.

  customer_id = '19286'.
  first_name = 'Bruce'.
  last_name = 'Wayne'.
  land = 'US'.
  city = 'Gotham City'.

  out->write( condense(  |{ customer_id ALPHA = OUT }| ) && `, ` && first_name && ` ` && last_name && `, ` && city && ` (` && land && ')' ).

  ENDMETHOD.
ENDCLASS.
