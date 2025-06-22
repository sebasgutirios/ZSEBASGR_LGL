CLASS zcl_carga_sgr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_carga_sgr IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

       DATA: lt_header_data TYPE TABLE OF zheader2_4355.

    " Datos de ejemplo a insertar
    lt_header_data = VALUE #(
        ( id_header    = 'ORD0000001'
          email        = 'user1@example.com'
          first_name   = 'John'
          last_name    = 'Doe'
          country      = 'US'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 10
          order_status = 'A'
          image_url    = 'https://img.lovepik.com/element/40172/7089.png_860.png' )

        ( id_header    = 'ORD0000002'
          email        = 'user2@example.com'
          first_name   = 'Jane'
          last_name    = 'Smith'
          country      = 'UK'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 15
          order_status = 'A'
          image_url    = 'https://png.pngtree.com/png-vector/20211030/ourlarge/pngtree-company-logo-design-png-image_4016509.png' )

        ( id_header    = 'ORD0000003'
          email        = 'user3@example.com'
          first_name   = 'Robert'
          last_name    = 'Johnson'
          country      = 'CA'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 7
          order_status = 'O'
          image_url    = 'https://i.pinimg.com/236x/b1/10/09/b11009583e00250e5ed3294bae1b27b0.jpg' )

        " Continuar con los demás registros hasta 10...
        ( id_header    = 'ORD0000004'
          email        = 'user4@example.com'
          first_name   = 'Maria'
          last_name    = 'Garcia'
          country      = 'ES'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 12
          order_status = 'X'
          image_url    = 'https://marketplace.canva.com/EAGDSD62frQ/1/0/1600w/canva-logo-tecnolog%C3%ADa-geek-ilustrado-verde-y-azul-H0YfwNHVq6I.jpg' )

        ( id_header    = 'ORD0000005'
          email        = 'user5@example.com'
          first_name   = 'Chen'
          last_name    = 'Wei'
          country      = 'CN'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 20
          order_status = 'X'
          image_url    = 'https://static.rfstat.com/renderforest/images/v2/landing-pics/logo_landing/Tech/tech_logo_4.png' )

        ( id_header    = 'ORD0000006'
          email        = 'user6@example.com'
          first_name   = 'Anna'
          last_name    = 'Müller'
          country      = 'DE'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 5
          order_status = 'X'
          image_url    = 'https://img.freepik.com/vector-premium/plantilla-logotipo-empresa-tecnologia-tecnologia-letra-h_505433-2170.jpg' )

        ( id_header    = 'ORD0000007'
          email        = 'user7@example.com'
          first_name   = 'Jean'
          last_name    = 'Dupont'
          country      = 'FR'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 8
          order_status = 'O'
          image_url    = 'https://marketplace.canva.com/EAFGIMHuF0k/2/0/800w/canva-logotipo-azul-ilustrado-para-ag%C3%AAncias-de-marketing-digital-RXzt_cCqzZY.jpg' )

        ( id_header    = 'ORD0000008'
          email        = 'user8@example.com'
          first_name   = 'Paolo'
          last_name    = 'Rossi'
          country      = 'IT'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 14
          order_status = 'O'
          image_url    = 'https://i.pinimg.com/474x/fa/6b/92/fa6b92851c602000f54c92ae5ad8dfe9.jpg' )

        ( id_header    = 'ORD0000009'
          email        = 'user9@example.com'
          first_name   = 'Yuki'
          last_name    = 'Tanaka'
          country      = 'JP'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 9
          order_status = 'O'
          image_url    = 'https://www.shutterstock.com/image-vector/robot-abstract-logo-modern-style-260nw-2475457627.jpg' )

        ( id_header    = 'ORD0000010'
          email        = 'user10@example.com'
          first_name   = 'Olga'
          last_name    = 'Ivanova'
          country      = 'RU'
          createon     = cl_abap_context_info=>get_system_date( )
          delivery_date = cl_abap_context_info=>get_system_date( ) + 11
          order_status = 'O'
          image_url    = 'https://marketplace.canva.com/EAF-jaJWSTo/2/0/1600w/canva-logo-empresa-tecnol%C3%B3gica-de-letra-b-azul-claro-y-fondo-blanco-8R9ogOe6MfU.jpg' )
    ).

    " Insertar datos en la tabla de base de datos
    INSERT zheader2_4355 FROM TABLE @lt_header_data ACCEPTING DUPLICATE KEYS.

    " Manejo de errores y salida de resultados
    IF sy-subrc = 0.
      out->write( 'Datos insertados correctamente:' ).
      out->write( lt_header_data ).
    ELSE.
      out->write( 'Error al insertar datos. Código de error: ' && sy-subrc ).
    ENDIF.


    DATA: lt_item_data TYPE TABLE OF zitem2_4355.

    " Datos de ejemplo a insertar
    lt_item_data = VALUE #(
        ( id_item         = 'ITEM000001'
          id_header       = 'ORD0000001'
          name            = 'Laptop Elite'
          description     = 'Laptop de última generación'
          release_date    = cl_abap_context_info=>get_system_date( ) - 30
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '1250.99'
          height          = '2.5'
          width           = '35.8'
          depth           = '24.5'
          quantity        = 50
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000002'
          id_header       = 'ORD0000001'
          name            = 'Mouse Inalámbrico'
          description     = 'Mouse ergonómico inalámbrico'
          release_date    = cl_abap_context_info=>get_system_date( ) - 10
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '49.99'
          height          = '5.0'
          width           = '8.0'
          depth           = '12.0'
          quantity        = 100
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000003'
          id_header       = 'ORD0000002'
          name            = 'Teclado Mecánico'
          description     = 'Teclado mecánico RGB'
          release_date    = cl_abap_context_info=>get_system_date( ) - 15
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '89.50'
          height          = '3.2'
          width           = '44.5'
          depth           = '13.5'
          quantity        = 75
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000004'
          id_header       = 'ORD0000002'
          name            = 'Monitor 27"'
          description     = 'Monitor 4K HDR'
          release_date    = cl_abap_context_info=>get_system_date( ) - 30
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '350.00'
          height          = '45.7'
          width           = '62.3'
          depth           = '5.8'
          quantity        = 30
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000005'
          id_header       = 'ORD0000003'
          name            = 'Disco SSD 1TB'
          description     = 'Disco sólido de alta velocidad'
          release_date    = cl_abap_context_info=>get_system_date( ) - 20
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '120.75'
          height          = '0.7'
          width           = '10.0'
          depth           = '7.0'
          quantity        = 200
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000006'
          id_header       = 'ORD0000003'
          name            = 'Auriculares Bluetooth'
          description     = 'Auriculares con cancelación de ruido'
          release_date    = cl_abap_context_info=>get_system_date( ) - 30
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '159.99'
          height          = '18.5'
          width           = '16.8'
          depth           = '7.2'
          quantity        = 60
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000007'
          id_header       = 'ORD0000008'
          name            = 'Webcam HD'
          description     = 'Cámara web con micrófono integrado'
          release_date    = cl_abap_context_info=>get_system_date( ) - 5
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '65.25'
          height          = '4.5'
          width           = '12.0'
          depth           = '3.0'
          quantity        = 120
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000009'
          id_header       = 'ORD0000004'
          name            = 'Altavoz Portátil'
          description     = 'Altavoz resistente al agua'
          release_date    = cl_abap_context_info=>get_system_date( ) - 30
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '79.50'
          height          = '18.0'
          width           = '6.5'
          depth           = '6.5'
          quantity        = 85
          unitofmeasure   = 'CM' )

        ( id_item         = 'ITEM000010'
          id_header       = 'ORD0000005'
          name            = 'Tablet 10"'
          description     = 'Tablet con lápiz digital'
          release_date    = cl_abap_context_info=>get_system_date( ) - 30
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '299.00'
          height          = '24.2'
          width           = '16.5'
          depth           = '0.8'
          quantity        = 40
          unitofmeasure   = 'CM' )

        (
          id_item         = 'ITEM00008'
          id_header       = 'ORD0000005'
          name            = 'Cargador Rápido'
          description     = 'Cargador USB-C 65W'
          release_date    = cl_abap_context_info=>get_system_date( ) - 30
          discontinued_date = cl_abap_context_info=>get_system_date( ) + 180
          price           = '35.99'
          height          = '5.5'
          width           = '5.5'
          depth           = '2.8'
          quantity        = 150
          unitofmeasure   = 'CM' )
    ).

    " Insertar datos directamente
    INSERT zitem2_4355 FROM TABLE @lt_item_data ACCEPTING DUPLICATE KEYS.

    " Mostrar resultado
    IF sy-subrc = 0.
      out->write( 'Registros insertados exitosamente:' ).
      out->write( lt_item_data ).
    ELSE.
      out->write( 'Se insertaron registros con posibles duplicados. Código: ' && sy-subrc ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
