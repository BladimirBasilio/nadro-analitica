view: cat_cliente_ciudades {
  sql_table_name: `nadro_info_plata.cat_cliente_ciudades`
    ;;

  dimension: ciudad {
    type: string
    sql: ${TABLE}.CIUDAD ;;
  }

  dimension: ciudad_sucursal {
    type: string
    sql: ${TABLE}.CIUDAD_SUCURSAL ;;
  }

  dimension: cp {
    type: number
    sql: ${TABLE}.CP ;;
  }

  dimension: desc_canal_dist {
    type: string
    sql: ${TABLE}.DESC_CANAL_DIST ;;
  }

  dimension: distancia_suc_clie {
    type: number
    sql: ${TABLE}.DISTANCIA_SUC_CLIE ;;
  }

  dimension: id_canal_dist {
    type: string
    sql: ${TABLE}.ID_CANAL_DIST ;;
  }

  dimension: id_ciudad_sucursal {
    type: number
    sql: ${TABLE}.ID_CIUDAD_SUCURSAL ;;
  }

  dimension: id_cliente {
    type: string
    sql: ${TABLE}.ID_CLIENTE ;;
  }

  dimension: id_sucursal {
    type: number
    sql: ${TABLE}.ID_SUCURSAL ;;
  }

  dimension: latitud {
    type: string
    sql: ${TABLE}.LATITUD ;;
  }

  dimension: longitud {
    type: string
    sql: ${TABLE}.LONGITUD ;;
  }

  dimension: nombre_cliente {
    type: string
    sql: ${TABLE}.NOMBRE_CLIENTE ;;
  }

  dimension: nombre_sucursal {
    type: string
    sql: ${TABLE}.NOMBRE_SUCURSAL ;;
  }

  dimension: punto_geografico_cliente {
    type: string
    sql: ${TABLE}.PUNTO_GEOGRAFICO_CLIENTE ;;
  }

  dimension: punto_geografico_sucursal {
    type: string
    sql: ${TABLE}.PUNTO_GEOGRAFICO_SUCURSAL ;;
  }

  dimension: subnombre {
    type: string
    sql: ${TABLE}.SUBNOMBRE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
