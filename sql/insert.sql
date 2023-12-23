DO $$
DECLARE
    table_name text := table_name;
    input_data json := data_json;
    record_data json;
BEGIN
    -- JSON 데이터를 PostgreSQL 레코드로 변환하여 테이블에 추가
    FOR record_data IN SELECT * FROM json_array_elements(input_data)
    LOOP
        EXECUTE 'INSERT INTO ' || table_name || ' (' || (SELECT string_agg(column_name, ',') FROM json_object_keys(record_data)) || ') VALUES (' || (SELECT string_agg(quote_literal(record_data->>column_name), ',') FROM json_object_keys(record_data)) || ')';
    END LOOP;
END $$;
