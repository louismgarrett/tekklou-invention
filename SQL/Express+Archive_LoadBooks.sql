DECLARE @ArchiveExpressRowCount BIGINT
       ,@Express_RPT_RowCount BIGINT

SET @ArchiveExpressRowCount =  
(SELECT DISTINCT
P.rows AS TableRowCount
FROM ArchiveExpress.sys.tables AS T WITH (NOLOCK)
    INNER JOIN ArchiveExpress.sys.schemas AS S
        ON T.schema_id = S.schema_id
    INNER JOIN ArchiveExpress.sys.partitions AS P WITH (NOLOCK)
        ON T.object_id = P.object_id
WHERE  t.name = 'LoadBooks')

SET @Express_RPT_RowCount =  
(SELECT DISTINCT
P.rows AS TableRowCount
FROM Express_RPT.sys.tables AS T WITH (NOLOCK)
    INNER JOIN Express_RPT.sys.schemas AS S
        ON T.schema_id = S.schema_id
    INNER JOIN Express_RPT.sys.partitions AS P WITH (NOLOCK)
        ON T.object_id = P.object_id
WHERE  t.name = 'LoadBooks')

SELECT @ArchiveExpressRowCount + @Express_RPT_RowCount
