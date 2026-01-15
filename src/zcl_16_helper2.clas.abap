CLASS zcl_16_helper2 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE  /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z16_travels
      RAISING   zcx_abap_no_data.

    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_helper2 IMPLEMENTATION.
  METHOD get_travel_with_customer.

    SELECT
      FROM /dmo/travel AS t
             INNER JOIN
               /dmo/customer AS c ON t~customer_id = c~customer_id
      FIELDS t~travel_id,
             t~begin_date,
             t~end_date,
             t~description,
             t~customer_id,
             c~first_name,
             c~last_name,
             c~city,
             c~country_code
      WHERE t~travel_id = @travel_id and  t~customer_id = c~customer_id
      INTO @travel_with_customer.
      IF sy-subrc <> 0.
        RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                              field = 'travel_ID'
                                              value = CONV #( 'travel_id' ) ).
      ENDIF.

endselect.

  ENDMETHOD.

  METHOD get_travels.
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( customer_id ) ).
    ENDIF.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
ENDCLASS.



