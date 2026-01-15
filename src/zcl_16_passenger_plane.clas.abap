CLASS zcl_16_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_16_airplane
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING !id                  TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE string
                                  number_of_seats type i
                        RAISING   zcx_abap_initial_parameter.

    DATA number_of_seats TYPE i READ-ONLY.

    methods get_total_weight_in_tons redefinition.

    METHODS to_string REDEFINITION.


    PROTECTED SECTION.
    PRIVATE SECTION.

ENDCLASS.


CLASS zcl_16_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ).

    IF number_of_seats IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = conv #( number_of_seats ) ).
    ENDIF.

    me->number_of_seats = number_of_seats.

  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * 11 / 10 + number_of_seats * 8 / 100.
  ENDMETHOD.

  METHOD to_string.
    string = |{ id }, { plane_type }, { empty_weight_in_tons }t, { number_of_seats } Sitzplätze|.
  ENDMETHOD.

ENDCLASS.




