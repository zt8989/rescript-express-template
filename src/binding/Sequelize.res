type t

type options = {
  host: string,
  port: option<int>,
  username: string,
  password: string,
  database: string,
  dialect: string,
  dialectModule: option<string>,
  dialectModulePath: option<string>,
  storage: option<string>,
  protocol: option<string>,
}
@new @module("sequelize")
external make: options => t = "Sequelize"

@send external authenticate: (t, unit) => Promise.t<unit> = "authenticate"

module Model = {
  type t
  @send external findAll: (t, option<'a>) => Promise.t<array<t>> = "findAll"

  @send external get: (t, string) => 'a = "get"
}

@send external define: (t, string, 'a) => Model.t = "define"
@send external defineWithOptions: (t, string, 'a, 'b) => Model.t = "define"

@module("sequelize") external dataTypes: 'a = "DataTypes"
