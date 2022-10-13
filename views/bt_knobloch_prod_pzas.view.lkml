view: bt_knobloch_prod_pzas {
  sql_table_name: `trend-it-nadro-data-lake.nadro_info_plata.bt_knobloch_prod_pzas`
    ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.ANIO ;;
  }

  dimension: desc_laboratorio {
    type: string
    sql: ${TABLE}.DESC_LABORATORIO ;;
  }

  dimension: desc_producto {
    type: string
    sql: ${TABLE}.DESC_PRODUCTO ;;
  }

  dimension: id_laboratorio {
    type: string
    sql: ${TABLE}.ID_LABORATORIO ;;
  }

  dimension: id_producto {
    type: string
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: mercado {
    type: number
    sql: ${TABLE}.MERCADO ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.MES ;;
  }

  dimension: nadro {
    type: number
    sql: ${TABLE}.NADRO ;;
  }

  dimension: porc_participacion {
    type: number
    sql: ${TABLE}.PORC_PARTICIPACION ;;
  }

  dimension: presentacion {
    type: string
    sql: ${TABLE}.PRESENTACION ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.TIPO ;;
  }

  #Llave
  dimension: llave {
    type: string
    sql: CONCAT(${anio},${mes},${sku}) ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
