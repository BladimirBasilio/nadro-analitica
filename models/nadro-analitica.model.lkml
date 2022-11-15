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

explore: tf_forecast {}

explore: real_vs_predicho {}

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

  join: cat_producto {
    sql_on: ${ventas_r.material} = ${cat_producto.id_producto} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: agg_precio_promedio {
    sql_on: ${ventas_r.llave_producto_pp} = ${agg_precio_promedio.llave} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: cat_ciudad_distancia {
    sql_on: ${cat_planta.id_ciudad} = ${cat_ciudad_distancia.id_ciudad} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: cat_ciudad_temperatura {
    sql_on: ${cat_planta.id_ciudad} = ${cat_ciudad_temperatura.id_ciudad};;
    relationship: many_to_many
    type: left_outer
  }

}
