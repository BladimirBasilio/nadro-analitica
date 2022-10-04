view: cat_ciudad_temperatura {
  sql_table_name: `nadro_info_plata.cat_ciudad_temperatura`
    ;;

  dimension: ciudad {
    type: string
    sql: ${TABLE}.CIUDAD ;;
  }

  dimension: factor {
    type: number
    sql: ${TABLE}.FACTOR ;;
  }

  dimension: id_ciudad {
    type: number
    sql: ${TABLE}.ID_CIUDAD ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.MES ;;
  }

  dimension: temperatura_media {
    type: number
    sql: ${TABLE}.TEMPERATURA_MEDIA ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_temp_media {
    type: average
    sql: ${temperatura_media} ;;
  }
}
