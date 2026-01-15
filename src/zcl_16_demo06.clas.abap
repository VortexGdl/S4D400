CLASS zcl_16_demo06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_demo06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connection      TYPE z16_connection.
    DATA flight          TYPE z16_flight.
    DATA flight_extended TYPE z16_flight_extended.

    connection-carrier_id      = 'LH'.
    connection-connection_id   = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id   = 'JFK'.

    flight-carrier_id    = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date   = '20260113'.

    flight_extended = CORRESPONDING #( flight ). " überträgt daten entsprechen spalten gleicher namen
    flight_extended = CORRESPONDING #( BASE ( flight_extended ) connection ). " hiermit werden beide vereint, es gelten die neuen haben vorrang aber die alten werden ohne neue nicht überschrieben
* # ersetzt hier flight_extended -> der compiler kann von allein herausfinden worauf wir uns beziehen durch die linke Seite
    out->write( flight_extended ).

  ENDMETHOD.
ENDCLASS.
