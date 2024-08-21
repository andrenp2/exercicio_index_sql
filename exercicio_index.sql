CREATE TABLE test_indexing(id SERIAL, name TEXT);

INSERT INTO test_indexing(name) SELECT 'bob' FROM generate_series(1,250000);

INSERT INTO test_indexing(name) SELECT 'alice' FROM generate_series(1,250000);

EXPLAIN ANALYZE SELECT * FROM test_indexing WHERE id = 2;

CREATE INDEX test_idx_ebac ON test_indexing(id);

EXPLAIN ANALYZE SELECT * FROM test_indexing WHERE id = 2;