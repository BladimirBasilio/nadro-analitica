view: tf_forecast {
  sql_table_name: `trend-it-nadro-data-lake.nadro_info_oro.tf_forecast`
    ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.ANIO ;;
  }

  dimension: dia_semana {
    type: string
    sql: ${TABLE}.DIA_SEMANA ;;
  }

  dimension: ciudad_sucursal {
    type: string
    sql: ${TABLE}.CIUDAD_SUCURSAL ;;
  }

  dimension: desc_laboratorio {
    type: string
    sql: ${TABLE}.DESC_LABORATORIO ;;
  }

  dimension: desc_producto {
    type: string
    sql: ${TABLE}.DESC_PRODUCTO ;;
  }

  dimension: desc_sucursal {
    type: string
    sql: ${TABLE}.DESC_SUCURSAL ;;
  }

  dimension: distancia_cdis_sucursal {
    type: number
    sql: ${TABLE}.DISTANCIA_CDIS_SUCURSAL ;;
  }

  dimension: estado_sucursal {
    type: string
    sql: ${TABLE}.ESTADO_SUCURSAL ;;
  }

  dimension: estrategia_producto {
    type: string
    sql: ${TABLE}.ESTRATEGIA_PRODUCTO ;;
  }

  dimension: factor_distancia {
    type: number
    sql: ${TABLE}.FACTOR_DISTANCIA ;;
  }

  dimension: factor_temperatura {
    type: number
    sql: ${TABLE}.FACTOR_TEMPERATURA ;;
  }

  dimension_group: fecha {
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
    sql: ${TABLE}.FECHA ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}.FORECAST ;;
  }

  dimension: grupo_producto {
    type: string
    sql: ${TABLE}.GRUPO_PRODUCTO ;;
  }

  dimension: id_laboratorio {
    type: string
    sql: ${TABLE}.ID_LABORATORIO ;;
  }

  dimension: id_producto {
    type: string
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: id_sucursal {
    type: string
    sql: ${TABLE}.ID_SUCURSAL ;;
  }

  dimension: id_sucursal_inqvia {
    type: string
    sql: ${TABLE}.ID_SUCURSAL_INQVIA ;;
  }

  dimension: id_sucursatl_knobloch {
    type: string
    sql: ${TABLE}.ID_SUCURSATL_KNOBLOCH ;;
  }

  dimension: jerarquia_producto {
    type: string
    sql: ${TABLE}.JERARQUIA_PRODUCTO ;;
  }

  dimension: lower_bound {
    type: number
    sql: ${TABLE}.LOWER_BOUND ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.MES ;;
  }

  dimension: mes_nombre {
    type: string
    sql: CASE WHEN ${mes} = 1 THEN 'ENERO'
              WHEN ${mes} = 2 THEN 'FEBRERO'
              WHEN ${mes} = 3 THEN 'MARZO'
              WHEN ${mes} = 4 THEN 'ABRIL'
              WHEN ${mes} = 5 THEN 'MAYO'
              WHEN ${mes} = 6 THEN 'JUNIO'
              WHEN ${mes} = 7 THEN 'JULIO'
              WHEN ${mes} = 8 THEN 'AGOSTO'
              WHEN ${mes} = 9 THEN 'SEPTIEMBRE'
              WHEN ${mes} = 10 THEN 'OCTUBRE'
              WHEN ${mes} = 11 THEN 'NOVIEMBRE'
              WHEN ${mes} = 12 THEN 'DICIEMBRE' END;;
  }

  dimension: precio_promedio {
    type: number
    sql: ${TABLE}.PRECIO_PROMEDIO ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: temperatura_media {
    type: number
    sql: ${TABLE}.TEMPERATURA_MEDIA ;;
  }

  dimension: upper_bound {
    type: number
    sql: ${TABLE}.UPPER_BOUND ;;
  }

  dimension: venta_unidades {
    type: number
    sql: ${TABLE}.VENTA_UNIDADES ;;
  }

  dimension: volumen_ccm {
    type: number
    sql: ${TABLE}.VOLUMEN_CCM ;;
  }

  dimension: movimiento {
    type: string
    sql: ${TABLE}.MOVIMIENTO ;;
  }

  # DIMENSIONES AGREGADAS DE CLIENTES

  dimension: id_cliente {
    type: string
    sql: ${TABLE}.ID_CLIENTE ;;
  }

  dimension: nombre_cliente {
    type: string
    sql: ${TABLE}.NOMBRE_CLIENTE ;;
  }

  dimension: subnombre_cliente {
    type: string
    sql: ${TABLE}.SUBNOMBRE ;;
  }

  dimension: id_canal_dist {
    type: string
    sql: ${TABLE}.ID_CANAL_DIST ;;
  }
  dimension: desc_canal_dist {
    type: string
    sql: ${TABLE}.DESC_CANAL_DIST ;;
  }
  dimension: ciudad_cliente {
    type: string
    sql: ${TABLE}.CIUDAD_CLIENTE ;;
  }



  # METRICAS

  measure: count {
    type: count
    drill_fields: []
  }

  measure: temperatura_promedio {
    type: average
     value_format: "0.00 \"°C\""
    sql: ${temperatura_media} ;;
  }

  measure: total_unidades_real {
    label: "Unidades Venta Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'VENTAS' THEN ${venta_unidades} ELSE NULL END ;;
  }

  measure: dias_distinto_real {
    type: count_distinct
    sql: CASE WHEN ${venta_unidades} IS NOT NULL THEN ${fecha_date} END ;;
  }

  measure: unidades_promedio_real {
    label: "Promedio Venta Real"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_unidades_real}/${dias_distinto_real} ;;
  }

  measure: promedio_venta {
    label: "Promedio Venta Real ALT"
    type: average
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: CASE WHEN ${movimiento} = 'VENTAS' THEN ${venta_unidades} END ;;
  }

  measure: unidades_promedio_mensual_real {
    label: "Prommedio Venta Mensual Real"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: 30*(${total_unidades_real}/${dias_distinto_real}) ;;
  }

  measure: distancia_promedio {
    type: average
    value_format: "0.00 \"Km\""
    sql: ${distancia_cdis_sucursal} ;;
  }

  #FORECAST

  measure: total_predicho {
    label: "Unidades Venta Predicho"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'VENTAS' THEN ${forecast} ELSE NULL END ;;
  }

  measure: dias_distinto_predicho {
    type: count_distinct
    sql: CASE WHEN ${forecast} IS NOT NULL THEN ${fecha_date} END ;;
  }

  measure: unidades_promedio_predicho {
    label: "Promedio Venta Predicho"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_predicho}/${dias_distinto_predicho} ;;
  }

  measure: unidades_promedio_mensual_predicho {
    label: "Promedio Mensual Venta Predicho"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: 30*(${total_predicho}/${dias_distinto_predicho}) ;;
  }

  measure: total_lower_bound {
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${lower_bound} ;;
  }

  #PENDIENTES
  measure: total_upper_bound {
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${upper_bound} ;;
  }

  measure: sucursales {
    type: count_distinct
    sql: ${id_sucursal} ;;
  }

  # METRICAS POR TIPO DE MOVIMIENTO

  measure: total_general_real {
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${venta_unidades} ;;
  }

  measure: total_general_real_predicho {
    label: "Total General Real+Predicho"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: IFNULL(${venta_unidades},0)+IFNULL(${forecast},0) ;;
  }

  measure: porc_venta {
    label: "Porcentaje Ventas"
    type: number
    value_format_name: percent_2
    sql: ${total_unidades_real}/${total_general_real} ;;
  }

  measure: total_descuento_real {
    label: "Unidades Descuento Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'DESCUENTO' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_descuento {
    label: "Porcentaje Descuento"
    type: number
    value_format_name: percent_4
    sql: ${total_descuento_real}/${total_general_real} ;;
  }

  measure: total_faltante_real {
    label: "Unidades Faltante Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'FALTANTES' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_faltante {
    label: "Porcentaje Faltante"
    type: number
    value_format_name: percent_4
    sql: ${total_faltante_real}/${total_general_real} ;;
  }

  measure: total_devolucion_real {
    label: "Unidades Devolucion Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'DEVOLUCION' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_devolucion {
    label: "Porcentaje Devolucion"
    type: number
    value_format_name: percent_4
    sql: ${total_devolucion_real}/${total_general_real} ;;
  }

  measure: total_cancelacion_real {
    label: "Unidades Cancelación Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'CANCELACION' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_cancelacion {
    label: "Porcentaje Cancelación"
    type: number
    value_format_name: percent_4
    sql: ${total_cancelacion_real}/${total_general_real} ;;
  }

  measure: total_rechazo_real {
    label: "Unidades Rechazo Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = 'RECHAZO' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_rechazo {
    label: "Porcentaje Rechazo"
    type: number
    value_format_name: percent_4
    sql: ${total_rechazo_real}/${total_general_real} ;;
  }



  # measure: promedio_descuento {
  #   label: "Promedio Descuento Real ALT"
  #   type: average
  #   value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
  #   sql: CASE WHEN ${movimiento} = 'DESCUENTO' THEN ${venta_unidades} END ;;
  # }

  # measure: promedio_faltante {
  #   label: "Promedio Faltantes Real ALT"
  #   type: average
  #   value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
  #   sql: CASE WHEN ${movimiento} = 'FALTANTES' THEN ${venta_unidades} END ;;
  # }


  # PARAMTERO

  parameter: selector_movimiento {
    type: string
    allowed_value: { value: "VENTAS" }
    allowed_value: { value: "DESCUENTO" }
    allowed_value: { value: "FALTANTES" }
    allowed_value: { value: "DEVOLUCION" }
    allowed_value: { value: "CANCELACION" }
    allowed_value: { value: "RECHAZO" }
  }

  # Metricas con parámetro
  measure: total_dinamico_real {
    label: "Unidades Dinamico Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${movimiento} = {% parameter selector_movimiento %} THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: dias_distinto_real_dinamico {
    type: count_distinct
    sql: CASE WHEN ${venta_unidades} IS NOT NULL
        AND ${movimiento} = {% parameter selector_movimiento %} THEN ${fecha_date} END ;;
  }

  measure: promedio_dinamico {
    label: "Promedio Dinamico Real "
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_dinamico_real}/NULLIF(${dias_distinto_real_dinamico},0) ;;
  }

  measure: promedio_dinamico_mensual {
    label: "Promedio mensual Dinamico Real "
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${promedio_dinamico}*30 ;;
  }
}
