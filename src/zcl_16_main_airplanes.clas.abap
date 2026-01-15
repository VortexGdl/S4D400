CLASS zcl_16_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplanes TYPE TABLE OF REF TO zcl_16_airplane. " einspaltige tabelle zum dokumentieren der objekte
    DATA Airplane  TYPE REF TO zcl_16_airplane. " hier wird ein objekt initiert

    out->write( |{ zcl_16_airplane=>number_of_airplanes }| ).

    " Instanziierung
    TRY.
        airplane = NEW #( id                   = 'D-ABUK'
                          plane_type           = 'Airbus A380-800'
                          empty_weight_in_tons = '277' ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.

        airplane = NEW zcl_16_cargo_plane( id                   = 'D-AIND'
                                           plane_type           = 'Airbus A320-200'
                                           empty_weight_in_tons = '42'
                                           cargo_in_tons        = 40 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.

        airplane = NEW zcl_16_passenger_plane( id                   = 'D-AJKF'
                                               plane_type           = 'Boeing 747-400F'
                                               empty_weight_in_tons = '166'
                                               number_of_seats                = 200 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    out->write( |{ zcl_16_airplane=>number_of_airplanes }| ).

    " Ausgabe
    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->to_string(  ) }, Total weight: { airplane->get_total_weight_in_tons(  ) }t| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.



