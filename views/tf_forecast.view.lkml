view: tf_forecast {
  sql_table_name: `trend-it-nadro-data-lake.nadro_info_oro.tf_forecast_7` ;;


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

  dimension: dia_semana_numero {
    type: number
    sql:
    CASE WHEN ${dia_semana} = 'LUNES' THEN 2
         WHEN ${dia_semana} = 'MARTES' THEN 3
        WHEN ${dia_semana} = 'MI??RCOLES' THEN 4
        WHEN ${dia_semana} = 'JUEVES' THEN 5
        WHEN ${dia_semana} = 'VIERNES' THEN 6
        WHEN ${dia_semana} = 'S??BADO' THEN 7
        WHEN ${dia_semana} = 'DOMINGO' THEN 1
    END
    ;;
  }

  dimension: numero_dia {
    type: number
    sql: EXTRACT(DAYOFYEAR FROM ${fecha_date}) ;;
  }

  dimension: numero_semana {
    type: number
    sql: EXTRACT(WEEK FROM ${fecha_date}) ;;
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
    type: string
    sql: ${TABLE}.ORIGEN ;;
  }

  dimension: clasificacion_farma {
    type: string
    sql: CASE
          WHEN ${grupo_producto} = 'FARMA PSICOTROP II' THEN 'FARMA'
          WHEN ${grupo_producto} = 'FARMA ESTUPEFACIENTE' THEN 'FARMA'
          WHEN ${grupo_producto} = 'FARMA PSICOTROP III' THEN 'FARMA'
          WHEN ${grupo_producto} = 'SERVICIOS CLIENTE' THEN 'NO FARMA'
          WHEN ${grupo_producto} = 'FARMA SIN CLASIFICAR' THEN 'FARMA'
          WHEN ${grupo_producto} = 'FARMA ETICOS' THEN 'FARMA'
          WHEN ${grupo_producto} = 'NO FARMA SIN CLASIF.' THEN 'NO FARMA'
          WHEN ${grupo_producto} = 'FARMA OTC-LIBRE VTA' THEN 'FARMA'
          WHEN ${grupo_producto} = 'FARMA OTC-VENTA FCIA' THEN 'FARMA' END;;
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

  parameter: periodo_promedio {
    type: number
    allowed_value: { value: "30" }

    allowed_value: { value: "60" }

    allowed_value: { value: "90" }

    allowed_value: { value: "120" }

    allowed_value: { value: "180" }

    allowed_value: { value: "365" }

    allowed_value: { value: "730" }
  }

  measure: total_unidades_real {
    group_label: "Modelo"
    label: "Unidades Venta Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'VENTA' THEN ${venta_unidades} ELSE NULL END ;;
  }

  measure: total_unidades_real_alt {
    group_label: "Modelo"
    label: "Unidades Venta Real_ALT"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'VENTA' AND ${fecha_date} <= ('2022-08-31' - {% parameter periodo_promedio %}) THEN ${venta_unidades} ELSE NULL END ;;
  }

  measure: dias_distinto_real {
    group_label: "Modelo"
    type: count_distinct
    sql: CASE WHEN ${origen} = "MODELO" AND ${venta_unidades} IS NOT NULL AND ${fecha_date} <= ('2022-08-31' - {% parameter periodo_promedio %}) THEN ${fecha_date} END ;;
  }

  measure: unidades_promedio_real {
    group_label: "Modelo"
    label: "Promedio Venta Real"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${total_unidades_real_alt}/${dias_distinto_real} ;;
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
    sql: 30*(${total_unidades_real_alt}/${dias_distinto_real}) ;;
  }

  measure: distancia_promedio {
    group_label: "Modelo"
    type: average
    value_format_name: decimal_0
    sql: CASE WHEN ${origen} = "MODELO" THEN ${distancia_cdis_sucursal} END ;;#
  }

  measure: fact_tem_prom {
    group_label: "Modelo"
    type: average
    value_format_name: decimal_2
    sql: CASE WHEN ${origen} = "MODELO" AND ${factor_temperatura} IS NOT NULL THEN ${factor_temperatura} END ;;
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
    sql: ${total_predicho}/NULLIF(${dias_distinto_predicho},0) ;;
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
    link: {
      label: "Detalle Devoluciones"
            url: "https://trendit.cloud.looker.com/dashboards/56?Jerarquia+Producto={{_filters['tf_forecast.jerarquia_producto']}}&Desc+Producto={{_filters['tf_forecast.desc_producto']}}&Desc+Sucursal={{_filters['tf_forecast.desc_sucursal']}}&Fecha+Date={{_filters['tf_forecast.fecha_date']}}&Selector+Movimiento=DEVOLUCION&Estrategia+Producto={{_filters['tf_forecast.estrategia_producto']}}&Desc+Laboratorio={{_filters['tf_forecast.desc_laboratorio']}}&Grupo+Producto={{_filters['tf_forecast.grupo_producto']}}&Nombre+Cliente={{_filters['tf_forecast.nombre_cliente']}}"
            }
  }

  measure: total_cancelacion_real {
    group_label: "Modelo"
    label: "Unidades Cancelaci??n Real"
    type: sum
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql:CASE WHEN ${origen} = "MODELO" AND ${movimiento} = 'CANCELACION' THEN ${venta_unidades} ELSE 0 END ;;
  }

  measure: porc_cancelacion {
    group_label: "Modelo"
    label: "Porcentaje Cancelaci??n"
    type: number
    value_format_name: percent_1
    sql: ${total_cancelacion_real}/${total_general_real} ;;
    link: {
      label: "Detalle Cancelaci??n"
      url: "https://trendit.cloud.looker.com/dashboards/56?Jerarquia+Producto={{_filters['tf_forecast.jerarquia_producto']}}&Desc+Producto={{_filters['tf_forecast.desc_producto']}}&Desc+Sucursal={{_filters['tf_forecast.desc_sucursal']}}&Fecha+Date={{_filters['tf_forecast.fecha_date']}}&Selector+Movimiento=CANCELACION&Estrategia+Producto={{_filters['tf_forecast.estrategia_producto']}}&Desc+Laboratorio={{_filters['tf_forecast.desc_laboratorio']}}&Grupo+Producto={{_filters['tf_forecast.grupo_producto']}}&Nombre+Cliente={{_filters['tf_forecast.nombre_cliente']}}"
    }

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
    link: {
      label: "Detalle Rechazo"
      url:  "https://trendit.cloud.looker.com/dashboards/56?Jerarquia+Producto={{_filters['tf_forecast.jerarquia_producto']}}&Desc+Producto={{_filters['tf_forecast.desc_producto']}}&Desc+Sucursal={{_filters['tf_forecast.desc_sucursal']}}&Fecha+Date={{_filters['tf_forecast.fecha_date']}}&Selector+Movimiento=RECHAZO&Estrategia+Producto={{_filters['tf_forecast.estrategia_producto']}}&Desc+Laboratorio={{_filters['tf_forecast.desc_laboratorio']}}&Grupo+Producto={{_filters['tf_forecast.grupo_producto']}}&Nombre+Cliente={{_filters['tf_forecast.nombre_cliente']}}"
    }
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

  ########################################## Metricas con par??metro (MODELO)

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

  ########################################################### INTEGRACI??N DE HISTORICO

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

  measure: h_promedio_dinamico_semanal {
    label: "Promedio semanal Dinamico Historico "
    group_label: "Historico"
    type: number
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]#,##0.0,\" K\";#,##0.0"
    sql: ${promedio_dinamico_historico}*7 ;;
  }

  ##### PARAMETRO DE DIMENSI??N DE FEHCA

  parameter: selector_dimension_fecha {
    type: unquoted
    allowed_value: {
      label: "D??a"
      value: "day"
    }
    allowed_value: {
      label: "Mes"
      value: "month"
    }
    allowed_value: {
      label: "Semana"
      value: "week"
    }
  }

  dimension: dimension_fecha {
    sql:
    {% if selector_dimension_fecha._parameter_value == 'day' %}
      ${fecha_date}
    {% elsif selector_dimension_fecha._parameter_value == 'month' %}
      ${fecha_month}
    {% elsif selector_dimension_fecha._parameter_value == 'week' %}
      ${fecha_week}
    {% endif %};;
  }

  #INFORMACI??N DE MARKET SHARE

  dimension: ms_nadro {
    type: number
    sql: ${TABLE}.MS_NADRO ;;
  }

  dimension: ms_mercado {
    type: number
    sql: ${TABLE}.MS_MERCADO ;;
  }

  dimension: ms_participacion {
    type: number
    sql: ${TABLE}.MS_PARTICIPACION ;;
  }

  measure: ms_nadro_avg {
    label: "Nadro avg"
    group_label: "Market Share"
    value_format_name: decimal_0
    type: average
    sql: CASE WHEN ${origen} = 'HISTORICO' AND ${ms_nadro} IS NOT NULL THEN ${ms_nadro} END ;;
  }

  measure: ms_mercado_avg {
    label: "Mercado avg"
    group_label: "Market Share"
    value_format_name: decimal_0
    type: average
    sql: CASE WHEN ${origen} = 'HISTORICO' AND ${ms_mercado} IS NOT NULL THEN ${ms_mercado} END ;;
  }

  measure: ms_participacion_avg {
    label: "Participaci??n avg"
    group_label: "Market Share"
    value_format: " 00.0 \"%\" "
    type: average
    sql: CASE WHEN ${origen} = 'HISTORICO' AND ${ms_participacion} IS NOT NULL THEN ${ms_participacion} END ;;
  }

  measure: ms_participacion_calculada {
    label: "Participaci??n calculada"
    group_label: "Market Share"
    value_format_name: percent_1
    type: number
    sql: ${ms_nadro_avg}/NULLIF(${ms_mercado_avg},0) ;;
    link: {
      label: "Market Share"
      url: "https://trendit.cloud.looker.com/dashboards/57?Fecha+Date=2020%2F01%2F01+to+2022%2F10%2F30&Desc+Producto={{_filters['tf_forecast.desc_producto']}}&Jerarquia+Producto=&Desc+Sucursal=&Estrategia+Producto=&Desc+Laboratorio=&Grupo+Producto="
    }
  }

  measure: ms_piezas {
    label: "Piezas "
    group_label: "Market Share"
    value_format_name: decimal_0
    type: sum
    sql:CASE WHEN ${origen} = 'HISTORICO' AND ${movimiento}='VENTA' AND ${ms_nadro} IS NOT NULL AND ${ms_nadro} != 0 THEN ${venta_unidades} END ;;
  }

  measure: participacion_sucursal {
    group_label: "Market Share"
    value_format_name: percent_2
    type: number
    sql: ${ms_piezas}/NULLIF(${ms_mercado_avg},0) ;;
  }
}
