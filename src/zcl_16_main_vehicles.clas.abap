CLASS zcl_16_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen

    DATA vehicle  TYPE REF TO zcl_16_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_16_vehicle.
    DATA truck    TYPE REF TO zcl_16_truck.

    DATA rental TYPE ref to zcl_16_rental.
    data carrier TYPE REF to zcl_16_carrier.
    DATA partners type table of ref to zif_16_partner.

    " Instanziierungen
    out->write( zcl_16_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_16_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_16_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_16_car( make  = 'Skoda'
                              model = 'Superb Combi'
                              seats = 5 ). " Upcast
    APPEND vehicle TO vehicles.

    rental = new #( ).
    carrier = new #( 'Lufthansa' ).

    append rental to partners. "Upcast
    append carrier to partners.

    out->write( zcl_16_vehicle=>number_of_vehicles ).

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 20 ).
          vehicle->accelerate( 100 ).
        CATCH zcx_16_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      IF vehicle IS INSTANCE OF zcl_16_truck.
        truck = CAST #( vehicle ). " Downcast
        truck->transform( ).
        out->write( |{ COND #( WHEN truck->is_transformed = 'X'
                               THEN 'Der LKW hat sich in einen Autobot transformiert        '
                               ELSE 'Der Autobot hast sich wieder in einen LKW transformiert' ) }| ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " (Dynamische) Polymorphie
    ENDLOOP.

    LOOP AT partners into data(partner).
      out->write( partner->to_string(  ) ).

      if partner is instance of zcl_16_carrier.
        carrier = cast #( partner ). " Downcast
        out->write( carrier->get_biggest_cargo_plane( ) ).
      endif.
    endloop.

  ENDMETHOD.
ENDCLASS.
