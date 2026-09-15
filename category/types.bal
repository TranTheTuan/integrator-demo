import ballerina/sql;

type BulkJobOutbox record {|
    int id;
    int job_id;
    boolean published;
    string created_at;
|};

type BulkJob record {|
    int id;
    int owner_id;
    string file_key;
    string filename;
    string result_key;
    string status;
    int total_rows;
    int done_rows;
    string created_at;
    string updated_at;
|};

type User record {|
    @sql:Column {
        name: "id"
    }
    int ID;
    @sql:Column {
        name: "email"
    }
    string Email;
    @sql:Column {
        name: "name"
    }
    string Name;
    @sql:Column {
        name: "created_at"
    }
    string CreatedAt?;
    @sql:Column {
        name: "updated_at"
    }
    string UpdatedAt?;
    @sql:Column {
        name: "external_id"
    }
    string ExternalID?;
|};
