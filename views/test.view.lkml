view: test {
  sql_table_name: `mint_staging_data.test` ;;

  dimension: aaa {
    type: string
    description: "ddd"
    sql: ${TABLE}.aaa ;;
  }
  dimension: bbb {
    type: number
    sql: ${TABLE}.bbb ;;
  }
  measure: count {
    type: count
  }
}
