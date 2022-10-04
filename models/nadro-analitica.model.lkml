connection: "nadro"

# include all the views
include: "/views/**/*.view"

datagroup: nadro_analitica_default_datagroup {
   sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nadro_analitica_default_datagroup

explore: agg_precio_promedio {}

explore: cat_ciudad_distancia {}

explore: cat_planta {}

explore: cat_cliente_ciudades {}

explore: cat_ciudad_temperatura {}

explore: ventas_r {
  join: cat_planta {
    sql_on: ${ventas_r.plant} = ${cat_planta.id_sucursal} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: cat_cliente_ciudades {
    sql_on: ${ventas_r.ship_to} = ${cat_cliente_ciudades.id_cliente} ;;
    relationship: many_to_one
    type: left_outer
  }

}
