CLASS zcl_16_carrier DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor             IMPORTING !name                      TYPE string.

    METHODS add_airplane            IMPORTING airplane                   TYPE REF TO zcl_16_airplane.

    METHODS get_biggest_cargo_plane RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_16_cargo_plane.

    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z16_airplanes READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_16_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_weight TYPE p LENGTH 8 DECIMALS 2 VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF     airplane IS INSTANCE OF zcl_16_cargo_plane
         AND airplane->get_total_weight_in_tons( )  > max_weight.
        biggest_cargo_plane = CAST #( airplane ).
        max_weight = biggest_cargo_plane->get_total_weight_in_tons( ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
