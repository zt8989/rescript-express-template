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

type model

module Model = {
  @send external findAll: (model, 'a) => Promise.t<array<model>> = "findAll"
  @send external findOne: (model, 'a) => Promise.t<Js_null.t<model>> = "findOne"
  @send external findByPk: (model, 'a) => Promise.t<Js_null.t<model>> = "findByPk"

  @send external create: (model, 'a) => Promise.t<model> = "create"
  @send external build: (model, 'a) => Promise.t<model> = "build"
  @send external buildArray: (model, array<'a>) => Promise.t<array<model>> = "build"

  @send external get: (model, string) => 'a = "get"
  @send external update: (model, 'a) => Promise.t<model> = "update"
}

@send external define: (t, string, 'a) => model = "define"
@send external defineWithOptions: (t, string, 'a, 'b) => model = "define"

@module("sequelize") external dataTypes: 'a = "DataTypes"
