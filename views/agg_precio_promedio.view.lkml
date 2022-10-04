view: agg_precio_promedio {
  sql_table_name: `nadro_info_plata.agg_precio_promedio`
    ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.ANIO ;;
  }

  dimension: desc_producto {
    type: string
    sql: ${TABLE}.DESC_PRODUCTO ;;
  }

  dimension: id_producto {
    type: string
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.MES ;;
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
}
