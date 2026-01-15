CLASS zcl_16_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_abap_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     DATA vorname TYPE string value 'Bruce'.
     DATA name TYPE string value 'Wayne'.

* Ausgabe
    out->write( `Hello `  && vorname && ` ` && name && ', how are you?' ).
    "Alternative viel einfacher
    out->write( |Hello { vorname } { name }, how are you?| ).

  ENDMETHOD.
ENDCLASS.
