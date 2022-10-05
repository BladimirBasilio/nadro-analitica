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

  measure: sum_piezas {
    type: sum
    sql: ${piezas} ;;
  }

  measure: sum_net_val {
    type: sum
    value_format_name: usd
    sql: ${net_val_s} ;;
  }

  measure: sum_tot_1s {
    type: sum
    sql: ${tot_1_s} ;;
  }

  measure: sum_piezas_venta{ #
    type: sum
    sql: CASE WHEN ${movimiento} = 'VENTA' THEN ${piezas} END ;;
  }

  measure: sum_piezas_devolucion{ #
    type: sum
    sql: CASE WHEN ${movimiento} = 'DEVOLUCION' THEN ${piezas} END ;;
  }

  measure: sum_piezas_cancelacion{ #
    type: sum
    sql: CASE WHEN ${movimiento} = 'CANCELACION' THEN ${piezas} END ;;
  }

  measure: sum_piezas_rechazo{ #
    type: sum
    sql: CASE WHEN ${movimiento} = 'RECHAZO' THEN ${piezas} END ;;
  }

  measure: sum_piezas_descuento{ #
    type: sum
    sql: CASE WHEN ${movimiento} = 'DESCUENTO' THEN ${piezas} END ;;
  }

  measure: sum_piezas_faltantes{ #
    type: sum
    sql: CASE WHEN ${movimiento} = 'FALTANTES' THEN ${piezas} END ;;
  }

  measure: por_venta { #
    type: number
    value_format_name: percent_2
    sql: ${sum_piezas_venta}/${sum_piezas} ;;
  }

  measure: por_devolucion { #
    type: number
    value_format_name: percent_2
    sql: ${sum_piezas_devolucion}/${sum_piezas} ;;
  }

  measure: por_cancelacion { #
    type: number
    value_format_name: percent_2
    sql: ${sum_piezas_cancelacion}/${sum_piezas} ;;
  }

  measure: por_rechazo { #
    type: number
    value_format_name: percent_2
    sql: ${sum_piezas_rechazo}/${sum_piezas} ;;
  }

  measure: por_descuento { #
    type: number
    value_format_name: percent_2
    sql: ${sum_piezas_descuento}/${sum_piezas} ;;
  }

  measure: por_faltantes { #
    type: number
    value_format_name: percent_4
    sql: ${sum_piezas_descuento}/${sum_piezas} ;;
  }

  measure: vp_piezas {
    type: average
    value_format_name: decimal_2
    sql: ${piezas};;
  }

  measure: vp_monto {
    type: average
    value_format_name: decimal_2
    sql: ${net_val_s}  ;;
  }

  measure: sucursales_d {
    type: count_distinct
    sql: ${plant} ;;
  }
}
