import ballerina/http;
import ballerinax/postgresql;
import ballerinax/postgresql.driver as _;
import ballerinax/postgresql.driver as _;
import ballerinax/postgresql.driver as _;

final http:Client externalApi = check new ("https://apis.wso2.com/zvdz/mi-qsg/v1.0");
final postgresql:Client postgresqlClient = check new (string `${host}`, string `${user}`, string `${password}`, string `${db}`, 5432);
