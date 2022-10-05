view: cat_producto {
  sql_table_name: `trend-it-nadro-data-lake.nadro_info_plata.cat_producto`
    ;;

  dimension: desc_hier {
    type: string
    sql: ${TABLE}.DESC_HIER ;;
  }

  dimension: desc_laboratorio {
    type: string
    sql: ${TABLE}.DESC_LABORATORIO ;;
  }

  dimension: desc_producto {
    type: string
    sql: ${TABLE}.DESC_PRODUCTO ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.HEIGHT ;;
  }

  dimension: id_laboratorio {
    type: string
    sql: ${TABLE}.ID_LABORATORIO ;;
  }

  dimension: id_producto {
    type: string
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: id_matl_group {
    type: string
    sql: ${TABLE}.ID_MATL_GROUP ;;
  }

  dimension: prod_hier {
    type: string
    sql: ${TABLE}.PROD_HIER ;;
  }

  dimension: sku {
    type: number
    sql: ${TABLE}.SKU ;;
  }

  dimension: desc_matl_group {
    type: string
    sql: ${TABLE}.DESC_MATL_GROUP ;;
  }

  dimension: volume {
    type: number
    sql: ${TABLE}.VOLUME ;;
  }

  dimension: volumeunit {
    type: string
    sql: ${TABLE}.VOLUMEUNIT ;;
  }

  dimension: width {
    type: number
    sql: ${TABLE}.WIDTH ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
