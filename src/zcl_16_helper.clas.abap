CLASS zcl_16_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

  CLASS-METHODS get_travel_with_customer
    IMPORTING travel_id type  /DMO/TRAVEL_ID
    Returning Value(travel_with_customer) type ZABAP_TRAVEL_WITH_CUSTOMER.

  CLASS-methods get_travels
  importing customer_id type /DMO/CUSTOMER_ID
  RETURNING VALUE(travels) type z16_travels.

  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_16_helper IMPLEMENTATION.

method get_travel_with_customer.

      TRY.
            data(travel) = zcl_abap_helper=>get_travel( travel_id = travel_id ).
            data(customer) = zcl_abap_helper=>get_customer( customer_id = travel-customer_id ).
            travel_with_customer = corresponding #( travel ).
            travel_with_customer = corresponding #( BASE ( travel_with_customer ) customer ).
       catch zcx_abap_no_data into data(x).
        RETURN.
        ENDTRY.

endmethod.

method get_travels.
try.
  travels = zcl_abap_helper=>get_travels( customer_id = customer_id ).
  catch zcx_abap_no_data into data(x).
  return.
endtry.
endmethod.

  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.

ENDCLASS.



