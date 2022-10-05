view: cat_ciudad_temperatura {
  sql_table_name: `nadro_info_plata.cat_ciudad_temperatura`
    ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.ANIO ;;
  }

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

  dimension: llave_tmp {
    type: string
    sql: CONCAT(${anio},${mes},${id_ciudad}) ;;
    primary_key: yes
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
