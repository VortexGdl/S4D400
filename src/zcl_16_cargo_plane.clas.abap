CLASS zcl_16_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_16_airplane
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING !id                  TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE string
                                  cargo_in_tons type i
                        RAISING   zcx_abap_initial_parameter.


    DATA cargo_in_tons TYPE i READ-ONLY.

    methods get_total_weight_in_tons REDEFINITION.

    METHODS to_string REDEFINITION.


    PROTECTED SECTION.
    PRIVATE SECTION.

ENDCLASS.


CLASS zcl_16_cargo_plane IMPLEMENTATION.
  METHOD constructor.

    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ).

    IF cargo_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = conv #( cargo_in_tons ) ).
    ENDIF.

    me->cargo_in_tons = cargo_in_tons.

    number_of_airplanes += 1.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * 11 / 10 + cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = |{ id }, { plane_type }, { empty_weight_in_tons }t, Maximale Last: { cargo_in_tons }t|.
  ENDMETHOD.

ENDCLASS.




