CLASS zcl_16_demo_08 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_demo_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA carrier_id    TYPE /dmo/carrier_id    VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.

    " SELECT [Spalten] FROM [Datenbankquelle] WHERE [Bedingung]

    " Lesen von Einzelsätzen
    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection).  " @ zeigt, dass es sich um eine variable handelt

    out->write( connection ).

    " Select mehrerer Datensätze

    DATA connections TYPE TABLE OF /dmo/connection.

    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

    out->write( connections ).

    " Lesen mehrerer Datensätze per Array Fetch
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection.
      APPEND connection TO connections.
    ENDSELECT.

    " definition der Zielvariablen Option 1: inline deklaration
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection2).

    out->write( connection2 ).

    " option 2: angabe passender felder
    DATA connection3 TYPE z16_connection.

    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection3.

    out->write( connection3 ).

    " option 3: kopieren namensgleicher felder
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection ).

    " Definition von Tabellen Joins
    SELECT
      FROM /dmo/connection AS con
             INNER JOIN
               /dmo/carrier AS car ON con~carrier_id = car~carrier_id
      FIELDS con~connection_id,
             car~name,
             con~carrier_id
      INTO TABLE @DATA(connections2).

    out->write( connections2 ).
  ENDMETHOD.
ENDCLASS.






