connection: "mint_staging_data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: mint_staging_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mint_staging_data_default_datagroup

explore: test {}

explore: standardized_chart_data_v01 {
    join: standardized_chart_data_v01__music_entity {
      view_label: "Standardized Chart Data V01: Music Entity"
      sql: LEFT JOIN UNNEST(${standardized_chart_data_v01.music_entity}) as standardized_chart_data_v01__music_entity ;;
      relationship: one_to_many
    }
    join: standardized_chart_data_v01__addtional_info {
      view_label: "Standardized Chart Data V01: Addtional Info"
      sql: LEFT JOIN UNNEST(${standardized_chart_data_v01.addtional_info}) as standardized_chart_data_v01__addtional_info ;;
      relationship: one_to_many
    }
}

explore: standardized_chart_data {
    join: standardized_chart_data__score {
      view_label: "Standardized Chart Data: Score"
      sql: LEFT JOIN UNNEST(${standardized_chart_data.score}) as standardized_chart_data__score ;;
      relationship: one_to_many
    }
    join: standardized_chart_data__artist {
      view_label: "Standardized Chart Data: Artist"
      sql: LEFT JOIN UNNEST(${standardized_chart_data.artist}) as standardized_chart_data__artist ;;
      relationship: one_to_many
    }
}

