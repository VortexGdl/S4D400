CLASS zcl_16_abap_08 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_abap_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travels     TYPE z16_travels.
    DATA customer_id TYPE /dmo/customer_id VALUE '0000001'.

    TRY.
        travels = zcl_16_helper2=>get_travels( customer_id = customer_id ).

      CATCH zcx_abap_no_data INTO DATA(x). " TODO: variable is assigned but never used (ABAP cleaner)
    ENDTRY.

    " Löschen vergangener reisen
    DELETE travels WHERE end_date < sy-datlo.

    " Ändern (10% fee erhöhen)
    FIELD-SYMBOLS <travels> TYPE /dmo/travel.
    LOOP AT travels ASSIGNING <travels>.
      <travels>-booking_fee = <travels>-booking_fee * 11 / 10.
    ENDLOOP.

    " sortieren
    SORT travels BY description DESCENDING.

    out->write( travels ).
  ENDMETHOD.
ENDCLASS.
