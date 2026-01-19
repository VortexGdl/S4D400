CLASS zcl_16_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

  interfaces zif_16_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_16_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_16_vehicle.
ENDCLASS.


CLASS zcl_16_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  method zif_16_partner~to_string.
    string = 'Ich bin die Autovermietung'.
  endmethod.
ENDCLASS.
