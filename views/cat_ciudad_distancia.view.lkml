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
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
