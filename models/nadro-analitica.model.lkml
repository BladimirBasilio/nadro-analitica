connection: "nadro"

# include all the views
include: "/views/**/*.view"

datagroup: nadro-analitica_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nadro-analitica_default_datagroup

explore: agg_precio_promedio {}

explore: cat_ciudad_distancia {}

explore: cat_planta {}

explore: cat_cliente_ciudades {}

explore: cat_ciudad_temperatura {}

explore: ventas_r {}
