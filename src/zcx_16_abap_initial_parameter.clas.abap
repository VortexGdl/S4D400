CLASS zcx_16_abap_initial_parameter DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    CONSTANTS:
      BEGIN OF initial_parameter,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'PARAMETER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF initial_parameter.

    DATA parameter TYPE string.

    METHODS constructor
      IMPORTING !previous  LIKE previous OPTIONAL
                !parameter TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_16_abap_initial_parameter IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = initial_parameter.
    me->parameter = parameter.
  ENDMETHOD.
ENDCLASS.
