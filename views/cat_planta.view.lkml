view: cat_planta {
  sql_table_name: `nadro_info_plata.cat_planta`
    ;;

  dimension: ciudad {
    type: string
    sql: ${TABLE}.CIUDAD ;;
  }

  dimension: cp {
    type: number
    sql: ${TABLE}.CP ;;
  }

  dimension: direccion {
    type: string
    sql: ${TABLE}.DIRECCION ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.ESTADO ;;
  }

  dimension: id_ciudad {
    type: number
    sql: ${TABLE}.ID_CIUDAD ;;
  }

  dimension: id_sucursal {
    type: string
    sql: CAST(${TABLE}.ID_SUCURSAL AS STRING) ;;
  }

  dimension: latitud {
    type: number
    sql: ${TABLE}.LATITUD ;;
  }

  dimension: longitud {
    type: number
    sql: ${TABLE}.LONGITUD ;;
  }

  dimension: nombre_2 {
    type: string
    sql: ${TABLE}.NOMBRE_2 ;;
  }

  dimension: nombre_sucursal {
    type: string
    sql: ${TABLE}.NOMBRE_SUCURSAL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
