view: standardized_chart_data_v01 {
  sql_table_name: `mint_staging_data.standardized_chart_data_v01` ;;

  dimension: addtional_info {
    hidden: yes
    sql: ${TABLE}.addtional_info ;;
  }
  dimension: chart_entity_type {
    type: string
    description: "차트 주제(album, song, artist, video, genre)"
    sql: ${TABLE}.chart_entity_type ;;
  }
  dimension: chart_period_type {
    type: string
    description: "차트 기간 타입(hourly, daily, weekly, monthly, yearly)"
    sql: ${TABLE}.chart_period_type ;;
  }
  dimension: chart_type {
    type: string
    description: "차트 종류 이름"
    sql: ${TABLE}.chart_type ;;
  }
  dimension: country {
    type: string
    description: "국가"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: create {
    type: time
    description: "입력일시"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.create_at ;;
  }
  dimension: data_source {
    type: string
    description: "데이터 수집 출처"
    sql: ${TABLE}.data_source ;;
  }
  dimension: end_datetime {
    type: string
    description: "차트를 수집한 종료일시(yyyy-MM-ddTHH:mm:ss)"
    sql: ${TABLE}.end_datetime ;;
  }
  dimension: genre {
    type: string
    description: "차트 장르 구분"
    sql: ${TABLE}.genre ;;
  }
  dimension_group: modify {
    type: time
    description: "수정일시"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.modify_at ;;
  }
  dimension: music_entity {
    hidden: yes
    sql: ${TABLE}.music_entity ;;
  }
  dimension: rank {
    type: number
    description: "랭킹"
    sql: ${TABLE}.rank ;;
  }
  dimension: start_datetime {
    type: string
    description: "차트를 수집한 시작일시(yyyy-MM-ddTHH:mm:ss)"
    sql: ${TABLE}.start_datetime ;;
  }
  measure: count {
    type: count
  }
}

view: standardized_chart_data_v01__music_entity {

  dimension: album {
    type: string
    description: "앨범"
    sql: album ;;
  }
  dimension: artist {
    type: string
    description: "아티스트"
    sql: artist ;;
  }
  dimension: lable {
    type: string
    description: "레이블"
    sql: lable ;;
  }
  dimension: standardized_chart_data_v01__music_entity {
    type: string
    description: "차트 기준 엔티티"
    hidden: yes
    sql: standardized_chart_data_v01__music_entity ;;
  }
  dimension: track {
    type: string
    description: "트랙"
    sql: track ;;
  }
}

view: standardized_chart_data_v01__addtional_info {

  dimension: key {
    type: string
    description: "추가 정보 값"
    sql: key ;;
  }
  dimension: standardized_chart_data_v01__addtional_info {
    type: string
    description: "추가 정보"
    hidden: yes
    sql: standardized_chart_data_v01__addtional_info ;;
  }
  dimension: value {
    type: string
    description: "추가 정보 키"
    sql: value ;;
  }
}
