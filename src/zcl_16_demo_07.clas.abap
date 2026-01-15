CLASS zcl_16_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration interner Tabellen
    DATA connections TYPE z16_connections. " Type [Tabellentyp]
    DATA connection  TYPE z16_connection.

    " Datensätze hinzufügen
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UA' airport_from_id = 'FRA' )
                           ( connection_id = '0100' airport_to_id = 'JFK' ) ).

    " 2te Operation: Anfügen von Datensätzen
    connection = VALUE #( carrier_id      = 'AZ'
                          connection_id   = '0017'
                          airport_from_id = 'BER'
                          airport_to_id   = 'ROM' ).
    " connections = value #( ( connection ) ). " als neue Zeile wird die Connection eingefügt, aber die tabelle wird wieder überschrieben
    connections = VALUE #( BASE connections
                           ( connection ) ). " hier wird nur ergänzt

    APPEND connection TO connections. " macht das gleiche ist aber die alte variante

    " Lesen von Einzel Datensätzen
    TRY.
        connection = connections[ 3 ]. " per Index zugreifen, achtung ABAP hat als ersten dei 1 und nicht 0
        connection = connections[ connection_id = '0400' ]. " Zugriff auf eine Zeile über Keys, aufruf aller Zeilen mit dieser ID
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ].
    ENDIF.

    " Lesen mehrerer Datensätze
    " Loop AT connections INTO DATA (connection2)
    LOOP AT connections INTO connection WHERE connection_id IS NOT INITIAL. " where als filter
      out->write( |{ sy-tabix } { connection-carrier_id }| ). " sy-tabix gibt den index dazu aus
    ENDLOOP.

    " Sortieren
    sort connections by carrier_id descending connection_id ascending.

    out->write( connections ).

    " Ändern von Einzel Datensätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'.
    ENDIF.

    " Ändern mehrerer Datensätze
    " per sy-tabix
    LOOP AT connections INTO connection.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    " per Datenreferenz
    DATA connection2 type ref to z16_connection.
    LOOP AT connections reference INTO connection2.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.

    " per Feldsymbol
    FIELD-SYMBOLS <connection> type z16_connection.
    LOOP AT connections assigning <connection>.
      <connection>-carrier_id = 'LH'.
    ENDLOOP.

    " Löschen
    delete connections where airport_from_id = 'FRA'.
    " clear connections. löscht alle daten

    "  Anzahl datensätze
    out->write( lines( connections ) ).

    " Ausgabe
    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
