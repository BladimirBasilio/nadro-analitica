view: tf_forecast {
  sql_table_name: `trend-it-nadro-data-lake.nadro_info_oro.tf_forecast_2`
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

  dimension: dia {
    type: number
    sql: EXTRACT(DAYOFYEAR FROM ${fecha_date}) ;;
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
    sql: CASE WHEN ${TABLE}.MOVIMIENTO = 'VENTAS' THEN 'VENTA' ELSE ${TABLE}.MOVIMIENTO END ;;
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

  dimension: total_general {
    type: number
    sql: ${TABLE}.VENTA_UNIDADES + ${TABLE}.FORECAST ;;
  }

  dimension: origen {
    type: number
    sql: ${TABLE}.ORIGEN ;;
  }


  # METRICAS

  measure: count {
    type: count
    drill_fields: []
  }

  measure: temperatura_promedio {
    group_label: "Modelo"
    type: average
     value_format_name: decimal_1
    sql:CASE WHEN ${origen} = "MODELO" THEN ${temperatura_media} END ;;
  }

  measure: total_unidades_real {
    group_label: "Modelo"
    label: "Unidades Venta Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'VENTA' THEN ${venta_unidades} ELSE NULL END ;;
  }

  measure: dias_distinto_real {
    group_label: "Modelo"
    type: count_distinct
    sql: CASE WHEN ${origen} = "MODELO" AND ${venta_unidades} IS NOT NULL THEN ${fecha_date} END ;;
  }

  measure: unidades_promedio_real {
    group_label: "Modelo"
    label: "Promedio Venta Real"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_unidades_real}/${dias_distinto_real} ;;
  }

  # measure: promedio_venta {
  #   group_label: "Modelo"
  #   label: "Promedio Venta Real ALT"
  #   type: average
  #   value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
  #   sql: CASE WHEN ${movimiento} = 'VENTA' THEN ${venta_unidades} END ;;
  # }

  measure: unidades_promedio_mensual_real {
    group_label: "Modelo"
    label: "Prommedio Venta Mensual Real"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: 30*(${total_unidades_real}/${dias_distinto_real}) ;;
  }

  measure: distancia_promedio {
    group_label: "Modelo"
    type: average
    value_format_name: decimal_0
    sql: CASE WHEN ${origen} = "MODELO" THEN ${distancia_cdis_sucursal} END ;;#
  }

  #FORECAST

  measure: total_predicho {
    group_label: "Modelo"
    label: "Unidades Venta Predicho"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'VENTA' THEN ${forecast} ELSE NULL END ;;
  }

  measure: dias_distinto_predicho {
    group_label: "Modelo"
    type: count_distinct
    sql: CASE WHEN ${origen} = "MODELO" AND ${forecast} IS NOT NULL THEN ${fecha_date} END ;;
  }

  measure: unidades_promedio_predicho {
    group_label: "Modelo"
    label: "Promedio Venta Predicho"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_predicho}/${dias_distinto_predicho} ;;
  }

  measure: unidades_promedio_mensual_predicho {
    group_label: "Modelo"
    label: "Promedio Mensual Venta Predicho"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: 30*(${total_predicho}/${dias_distinto_predicho}) ;;
  }

  measure: total_lower_bound {
    group_label: "Modelo"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: CASE WHEN ${origen} = "MODELO" THEN ${lower_bound} END ;;
  }

  #PENDIENTES
  measure: total_upper_bound {
    group_label: "Modelo"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: CASE WHEN ${origen} = "MODELO" THEN ${upper_bound} END;;
  }

  measure: sucursales {
    group_label: "Modelo"
    type: count_distinct
    sql:CASE WHEN ${origen} = "MODELO" THEN ${id_sucursal} END ;;
  }

  # METRICAS POR TIPO DE MOVIMIENTO

  measure: total_general_real {
    group_label: "Modelo"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: CASE WHEN ${origen} = "MODELO" THEN ${venta_unidades} END;;
  }

  measure: total_general_real_predicho {
    group_label: "Modelo"
    label: "Total General Real+Predicho"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: CASE WHEN ${origen} = "MODELO" THEN IFNULL(${venta_unidades},0)+IFNULL(${forecast},0) END ;;
  }

  measure: porc_venta {
    group_label: "Modelo"
    label: "Porcentaje Ventas"
    type: number
    value_format_name: percent_1
    sql: ${total_unidades_real}/${total_general_real} ;;
  }

  measure: total_descuento_real {
    group_label: "Modelo"
    label: "Unidades Descuento Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'DESCUENTO' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_descuento {
    group_label: "Modelo"
    label: "Porcentaje Descuento"
    type: number
    value_format_name: percent_1
    sql: ${total_descuento_real}/${total_general_real} ;;
  }

  measure: total_faltante_real {
    group_label: "Modelo"
    label: "Unidades Faltante Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'FALTANTES' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_faltante {
    group_label: "Modelo"
    label: "Porcentaje Faltante"
    type: number
    value_format_name: percent_1
    sql: ${total_faltante_real}/${total_general_real} ;;
  }

  measure: total_devolucion_real {
    group_label: "Modelo"
    label: "Unidades Devolucion Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'DEVOLUCION' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_devolucion {
    group_label: "Modelo"
    label: "Porcentaje Devolucion"
    type: number
    value_format_name: percent_1
    sql: ${total_devolucion_real}/${total_general_real} ;;
  }

  measure: total_cancelacion_real {
    group_label: "Modelo"
    label: "Unidades Cancelación Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'CANCELACION' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_cancelacion {
    group_label: "Modelo"
    label: "Porcentaje Cancelación"
    type: number
    value_format_name: percent_1
    sql: ${total_cancelacion_real}/${total_general_real} ;;
  }

  measure: total_rechazo_real {
    group_label: "Modelo"
    label: "Unidades Rechazo Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'RECHAZO' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_rechazo {
    group_label: "Modelo"
    label: "Porcentaje Rechazo"
    type: number
    value_format_name: percent_1
    sql: ${total_rechazo_real}/${total_general_real} ;;
  }


  #ESTATICA PARA SERIE DE TIEMPO
  measure: total_devoluciones_rp {
    group_label: "Modelo"
    label: "Devoluciones Real+Predict"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'DEVOLUCION' THEN IFNULL(${venta_unidades},0)+IFNULL(${forecast},0) END ;;
  }

  # measure: total_predicho_dev {
  #   label: "Unidades Dev Predicho"
  #   type: sum
  #   value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
  #   sql:CASE WHEN ${movimiento} = 'DEVOLUCION' THEN ${forecast} ELSE NULL END ;;
  # }

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
    allowed_value: { value: "VENTA" }
    allowed_value: { value: "DESCUENTO" }
    allowed_value: { value: "FALTANTES" }
    allowed_value: { value: "DEVOLUCION" }
    allowed_value: { value: "CANCELACION" }
    allowed_value: { value: "RECHAZO" }
  }

  ########################################## Metricas con parámetro (MODELO)

  measure: total_dinamico_real {
    group_label: "Modelo"
    label: "Unidades Dinamico Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = {% parameter selector_movimiento %} THEN IFNULL(${venta_unidades},0)+IFNULL(${forecast},0) END;;
  } #ELSE END

  measure: dias_distinto_real_dinamico {
    group_label: "Modelo"
    type: count_distinct
    sql: CASE WHEN ${origen} = "MODELO" AND  ${movimiento} = {% parameter selector_movimiento %} THEN ${fecha_date} END ;;
  }
  #CASE ${venta_unidades} IS NOT NULL AND

  measure: promedio_dinamico {
    group_label: "Modelo"
    label: "Promedio Dinamico Real "
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_dinamico_real}/NULLIF(${dias_distinto_real_dinamico},0) ;;
  }

  measure: promedio_dinamico_mensual {
    group_label: "Modelo"
    label: "Promedio mensual Dinamico Real "
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${promedio_dinamico}*30 ;;
  }

  ########################################################### INTEGRACIÓN DE HISTORICO

  measure: total_dinamico_historico {
    group_label: "Historico"
    label: "Unidades Dinamico Historico"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "HISTORICO" AND ${movimiento} = {% parameter selector_movimiento %} THEN IFNULL(${venta_unidades},0) END;;
  } #ELSE END

  measure: dias_distinto_historico_dinamico {
    group_label: "Historico"
    type: count_distinct
    sql: CASE WHEN ${origen} = "HISTORICO" AND  ${movimiento} = {% parameter selector_movimiento %} THEN ${fecha_date} END ;;
  }
  #CASE ${venta_unidades} IS NOT NULL AND

  measure: promedio_dinamico_historico {
    group_label: "Historico"
    label: "Promedio Dinamico Historico "
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_dinamico_historico}/NULLIF(${dias_distinto_historico_dinamico},0) ;;
  }

  measure: h_promedio_dinamico_mensual {
    label: "Promedio mensual Dinamico Historico "
    group_label: "Historico"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${promedio_dinamico_historico}*30 ;;
  }
}
