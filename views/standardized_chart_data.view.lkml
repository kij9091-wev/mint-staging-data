view: standardized_chart_data {
  sql_table_name: `mint_staging_data.standardized_chart_data` ;;

  dimension: artist {
    hidden: yes
    sql: ${TABLE}.artist ;;
  }
  dimension: chart_name {
    type: string
    description: "차트 종류 이름"
    sql: ${TABLE}.chart_name ;;
  }
  dimension: chart_period_type {
    type: string
    description: "차트 기간 타입(hourly, daily, weekly, monthly, yearly)"
    sql: ${TABLE}.chart_period_type ;;
  }
  dimension: chart_type {
    type: string
    description: "차트 주제(album, song, artist, video)"
    sql: ${TABLE}.chart_type ;;
  }
  dimension: country {
    type: string
    description: "국가"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: details {
    type: string
    description: "상세 정보"
    sql: ${TABLE}.details ;;
  }
  dimension: end_datetime {
    type: string
    description: "차트를 수집한 종료일시(yyyy-MM-ddTHH:mm:ss)"
    sql: ${TABLE}.end_datetime ;;
  }
  dimension: score {
    hidden: yes
    sql: ${TABLE}.score ;;
  }
  dimension: start_datetime {
    type: string
    description: "차트를 수집한 시작일시(yyyy-MM-ddTHH:mm:ss)"
    sql: ${TABLE}.start_datetime ;;
  }
  measure: count {
    type: count
    drill_fields: [chart_name]
  }
}

view: standardized_chart_data__score {

  dimension: name {
    type: string
    description: "스코어 이름"
    sql: name ;;
  }
  dimension: standardized_chart_data__score {
    type: string
    description: "점수"
    hidden: yes
    sql: standardized_chart_data__score ;;
  }
  dimension: value__float_value {
    type: number
    description: "소수점 포함 스코어"
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }
  dimension: value__int_value {
    type: number
    description: "INT 스코어"
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }
  dimension: value__string_value {
    type: string
    description: "문자열  스코어"
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}

view: standardized_chart_data__artist {

  dimension: album {
    type: string
    description: "앨범"
    sql: album ;;
  }
  dimension: artist_name {
    type: string
    description: "아티스트 이름"
    sql: artist_name ;;
  }
  dimension: label {
    type: string
    description: "레이블"
    sql: label ;;
  }
  dimension: standardized_chart_data__artist {
    type: string
    description: "아티스트"
    hidden: yes
    sql: standardized_chart_data__artist ;;
  }
  dimension: track {
    type: string
    description: "트랙(노래 제목)"
    sql: track ;;
  }
}
