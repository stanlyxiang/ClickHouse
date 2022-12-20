DROP TABLE IF EXISTS test_02504;

CREATE TABLE test_02504 (`a` UInt32,`b` UInt32) ENGINE = MergeTree ORDER BY a;
INSERT INTO test_02504 values (1, 1) (2, 2), (3, 3);
SELECT * FROM test_02504;

ALTER TABLE test_02504 UPDATE b = 33 WHERE arrayJoin([1, 2]) = a; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT}

DROP TABLE test_02504;