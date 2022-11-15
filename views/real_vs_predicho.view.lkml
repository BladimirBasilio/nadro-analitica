view: real_vs_predicho {
  sql_table_name: `trend-it-nadro-data-lake.nadro_info_oro.real_vs_predicho`
    ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.ANIO ;;
  }

  dimension: anio_mes {
    type: number
    sql: ${TABLE}.ANIO_MES ;;
  }

  dimension: desc_sucursal {
    type: string
    sql: ${TABLE}.DESC_SUCURSAL ;;
  }

  dimension: mes_nombre {
    type: string
    sql: ${TABLE}.MES_NOMBRE ;;
  }

  dimension: mes_numero {
    type: number
    sql: ${TABLE}.MES_NUMERO ;;
  }

  dimension: predicho {
    type: number
    sql: ${TABLE}.PREDICHO ;;
  }

  dimension: real {
    type: number
    sql: ${TABLE}.REAL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_real {
    type:  sum
    sql: ${real} ;;
  }

  measure: sum_predicho {
    type:  sum
    sql: ${predicho} ;;
  }

  measure: per_real_predicho {
    type: number
    value_format_name: percent_2
    sql: (${sum_real})/${sum_predicho} ;;
  }

  measure: per_predicho_real {
    type: number
    value_format_name: percent_2
    sql: (${sum_predicho})/${sum_real} ;;
  }
}
