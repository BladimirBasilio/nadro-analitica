view: agg_precio_promedio {
  sql_table_name: `nadro_info_plata.agg_precio_promedio`
    ;;

  dimension: anio_mes {
    type: string
    sql: ${TABLE}.ANIO_MES ;;
  }

  dimension: desc_producto {
    type: string
    sql: ${TABLE}.DESC_PRODUCTO ;;
  }

  dimension: id_producto {
    type: string
    sql: ${TABLE}.ID_PRODUCTO ;;
  }


  dimension: precio_promedio {
    type: number
    sql: ${TABLE}.PRECIO_PROMEDIO ;;
  }

  dimension: total_piezas {
    type: number
    sql: ${TABLE}.TOTAL_PIEZAS ;;
  }

  dimension: total_venta {
    type: number
    sql: ${TABLE}.TOTAL_VENTA ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: llave {
    type: string
    sql: CONCAT(${anio_mes},${id_producto}) ;;
  }

  measure: sum_piezas {
    type: sum
    sql: ${total_piezas} ;;
  }

  measure: sum_venta {
    type: sum
    value_format_name: decimal_2
    sql: ${total_venta} ;;
  }

  measure: avg_precio_promedio {
    type: average
    value_format_name: decimal_2
    sql: ${precio_promedio} ;;
  }
}
