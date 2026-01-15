CLASS zcl_16_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_demo_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Einfache Verzwigung
    DATA age        TYPE i           VALUE 19.
    DATA gender     TYPE c LENGTH 1  VALUE 'M'.
    DATA first_name TYPE c LENGTH 40 VALUE 'Hans'.
    DATA last_name  TYPE c LENGTH 40 VALUE 'Maier'.

    " Vergleichsoperatoren: <, <=, >, >=, , =, <> (ungleich)
    " logische Operatoren:  AND, OR, NOT
    " + IS (NOT) INITIAL (überprüfung auf initialwert)
    IF age < 18.

      out->write( |Hallo { first_name }| ).

    ELSEIF gender = 'm' OR gender = 'M'. " hier wird ein einfaches = verwendet weil Kontextabhängig interpretiert wird

      out->write( |Hallo Herr { last_name }| ).

    ELSEIF gender = 'w' OR gender = 'W'.

      out->write( |Hallo Frau { last_name }| ).

    ELSE.

      out->write( |Hallo { last_name }| ).

    ENDIF.

    out->write( |Hallo { COND #( WHEN age < 18                     THEN first_name
                                 WHEN gender = 'm' OR gender = 'M' THEN |Herr { last_name }|
                                 WHEN gender = 'w' OR gender = 'W' THEN |Frau { last_name }|
                                 ELSE                                   last_name ) }| ).

    IF age IS INITIAL. " äquivalent zu if age = 0
      out->write( 'Kein Alter angegeben' ).
    ENDIF.

    " Fallunterscheidungen
    CASE gender.
      WHEN 'm' OR 'M'.
        out->write( |Hallo Herr { last_name }| ).
      WHEN 'w' OR 'W'.
        out->write( |Hallo Frau { last_name }| ).
      WHEN OTHERS.
        out->write( |Hallo { last_name }| ).
    ENDCASE.

    out->write( |Hallo { SWITCH #( gender
                                   WHEN 'm' OR 'M' THEN |Herr { last_name }|
                                   WHEN 'w' OR 'W' THEN |Frau { last_name }|
                                   ELSE                 last_name ) }| ).
  ENDMETHOD.
ENDCLASS.




