CLASS zcl_16_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA result_i TYPE i.
  data result_p type p length 8 decimals 3.

  " Mathematische Operatoren

  result_i = 5 + 3.
  out->write( result_i ).

  result_i = 5 - 3.
  out->write( result_i ).

  result_i = 5 * 3.
  out->write( result_i ).

  result_p = 5 / 3.
  out->write( result_p ).

  result_i = 5 div 3.
  out->write( result_i ).

  result_i = 5 mod 3.
  out->write( result_i ).

  result_i = 5 ** 3.
  out->write( result_i ).

  result_i = result_i + 1.
  result_i += 1.

  out->write( result_i ).

  result_i = sqrt( 81 ).
  out->write( result_i ).

  out->write( round( val = '47.862' dec = 2 ) ).



  ENDMETHOD.
ENDCLASS.















