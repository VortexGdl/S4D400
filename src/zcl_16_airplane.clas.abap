CLASS zcl_16_airplane DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING !id                   TYPE string
                                  !plane_type            TYPE string
                                  !empty_weight_in_tons TYPE string
                        raising zcx_abap_initial_parameter.

   methods get_total_weight_in_tons
           returning value(total_weight_in_tons) type i.

    DATA id                    TYPE string READ-ONLY.
    DATA plane_type            TYPE string READ-ONLY. " Getter/Setter mit cmd + 1 generieren lassen
    DATA empty_weight_in_tons TYPE i      READ-ONLY. " das read only erlaubt attribute trotz public nur von der klasse bearbeiten zu lassen

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

ENDCLASS.


CLASS zcl_16_airplane IMPLEMENTATION.
  METHOD constructor.

  if id is INITIAL.
    raise exception new zcx_abap_initial_parameter( parameter = id ).
  endif.

  if plane_type is initial.
    raise exception new zcx_abap_initial_parameter( parameter = plane_type ).
  endif.

  if empty_weight_in_tons is initial.
    raise exception new zcx_abap_initial_parameter( parameter = empty_weight_in_tons ).
  endif.

    me->id                    = id.
    me->plane_type            = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.

    number_of_airplanes += 1.
  ENDMETHOD.

  method get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * 11 / 10.
  endmethod.
ENDCLASS.




