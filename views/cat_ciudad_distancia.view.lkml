view: cat_ciudad_distancia {
  sql_table_name: `nadro_info_plata.cat_ciudad_distancia`
    ;;

  dimension: ciudad {
    type: string
    sql: ${TABLE}.CIUDAD ;;
  }

  dimension: distancia_km {
    type: number
    sql: ${TABLE}.DISTANCIA_KM ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.ESTADO ;;
  }

  dimension: id_ciudad {
    type: number
    sql: ${TABLE}.ID_CIUDAD ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: distancia_promedio {
    type: average
    value_format_name: decimal_2
    sql: ${distancia_km} ;;
  }
}
