import ballerina/graphql;
import ballerina/http;
import ballerina/sql;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /categories on httpDefaultListener {
    resource function get categories() returns User[]|error {
        do {
            stream<User, sql:Error?> result = postgresqlClient->query(`SELECT * FROM users LIMIT 10;`);

            return from User user in result
                select user;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener httpDefaultListener1 = http:getDefaultListener();

listener graphql:Listener graphqlListener = new (8080);

service /graphql on graphqlListener {

    resource function get greeting() returns string {
        return "Hello from WSO2 Integrator!";
    }

    resource function get users() returns User[] {
        return [
            {
                ID: 1,
                Name: "Long",
                Email: "long@gmail.com"
            },
            {
                ID: 2,
                Name: "Phi",
                Email: "phi@gmail.com"
            }
        ];
    }

    resource function get getJob(int job_id) returns BulkJob[]|error {
        stream<BulkJob, sql:Error?> result = postgresqlClient->query(`SELECT * FROM bulk_jobs;`);

        return from BulkJob job in result
            select job;
    }
}
