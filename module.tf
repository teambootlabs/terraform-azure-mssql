module "mssql"{
    source = "./enviroment"
    location = var.location
    charset = var.charset
    collation = var.collation
    mssql_server_administraxtion_login =var.mssql_server_administraxtion_login
    mssql_server_administraxtion_login_password =var.mssql_server_administraxtion_login_password
    name = var.name
}