#!/bin/bash

# Parse configuration from config.ini
config_file="/Users/kimdohoon/git/study/postgresql-server/config/config.ini"
if [ -f "$config_file" ]; then
    source "$config_file"
else
    echo "Error: Config file not found!"
    exit 1
fi

# 파일로부터 테이블명과 데이터 추출
file_path=$1

# PostgreSQL 스크립트 실행
psql -h "$postgresql_host" \
     -U "$postgresql_username" \
     -d "$postgresql_database" \
     -W \
     -f "$file_path"
