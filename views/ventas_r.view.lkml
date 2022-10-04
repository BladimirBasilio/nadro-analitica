view: ventas_r {
  sql_table_name: `nadro_info_plata.ventas_r`
    ;;

  dimension_group: bill {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BILL_DATE ;;
  }

  dimension: cost_val_s {
    type: number
    sql: ${TABLE}.COST_VAL_S ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: movimiento {
    type: string
    sql: ${TABLE}.MOVIMIENTO ;;
  }

  dimension: net_val_s {
    type: number
    sql: ${TABLE}.NET_VAL_S ;;
  }

  dimension: piezas {
    type: number
    sql: ${TABLE}.PIEZAS ;;
  }

  dimension: plant {
    type: string
    sql: ${TABLE}.PLANT ;;
  }

  dimension: ship_to {
    type: string
    sql: ${TABLE}.SHIP_TO ;;
  }

  dimension: tot_1_s {
    type: number
    sql: ${TABLE}.TOT_1S ;;
  }

  dimension: llave_producto_pp {
    type: string
    sql: CONCAT(${bill_month},${material}) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
