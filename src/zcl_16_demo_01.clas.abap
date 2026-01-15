CLASS zcl_16_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_demo_01 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

**********************************************************************
* Hello World
**********************************************************************
    DATA text TYPE string.  "Deklaration
    text = 'Hello World'.  "Wertzuweisung
* Ausgabe
    out->write( text ).

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************

    DATA age type i. " Ganze Zahl
    DATA salary_in_euros TYPE p length 16 decimals 2. " Kommazahl
    DATA first_name type c length 40 . " Zeichenkette mit fester Länge die wir selber festlegen können
    DATA matriculation_number TYPE n length 7. " Ziffernfolge
    DATA xmas TYPE d. " Datum
    DATA time type t. " Uhrzeit
    DATA flag.

    DATA carrier_id type c length 3. " ABAP Standardtyp
    data carrier_id2 TYPE /dmo/carrier_id. " Datenelement SAP übergreifend gleich

**********************************************************************
* Wertzuweisungen
**********************************************************************

    age = 44.
    salary_in_euros = '6000.52'.
    first_name = 'Daniel'.
    matriculation_number = '0000008'.
    xmas = '20261224'. " Jahr Monat Tag
    time = '141632'.  " Stunde Minute Sekunde
    flag = 'X'. " es ist nict boolean sondern etwas ähnliches mit entweder x oder nix
    " Initialisierung (Wert auf Startwert setzen)
    flag = ''.
    clear flag. " Löscht Inhalt und setzt zu initial Wert zurück
    " Statische Vorbelegung
    DATA last_name TYPE c length 40 value 'Appenmeier'.
    " Inline deklaration
    data(size_in_cm) = 179.
    size_in_cm = '186'. " Dass funktioniert, weil wir den integer auch über einen string zuweisen können





  ENDMETHOD.

ENDCLASS.
