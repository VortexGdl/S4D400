CLASS zcx_16_abap_no_data DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    CONSTANTS:
      BEGIN OF no_data,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'TABLE',
        attr2 TYPE scx_attrname VALUE 'FIELD',
        attr3 TYPE scx_attrname VALUE 'VALUE',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_data.

    DATA table TYPE string.
    DATA field TYPE string.
    DATA value TYPE string.

    METHODS constructor
      IMPORTING !previous LIKE previous OPTIONAL
                !table    TYPE string
                !field    TYPE string
                !value    TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_16_abap_no_data IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = no_data.
    me->table = table.
    me->field = field.
    me->value = value.
  ENDMETHOD.
ENDCLASS.
