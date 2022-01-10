# A Stream Processing Job

In SQL Stream Builder, a job is defined as a SQL statement. It processes data from a source to a sink. The INSERT keyword is used to specify the sink table. The sink table schema must match the output schema of the query (names/types).

- SQL defines the stream processor end-to-end
- Functions, joins, window operators - rich SQL grammar compatible with [Calcite SQL](https://calcite.apache.org/docs/stream.html) (Ansi92).

[Example](../examples/stream_processor.sql)

[Documentation](https://docs.cloudera.com/csa-ce/1.6.0/getting-started/topics/csa-ce-create-view.html)
