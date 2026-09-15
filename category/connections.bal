import ballerinax/postgresql;
import ballerinax/postgresql.driver as _;
import ballerinax/postgresql.driver as _;
import ballerinax/postgresql.driver as _;

final postgresql:Client postgresqlClient = check new (string `${host}`, string `${user}`, string `${password}`, string `${db}`, 5432);
