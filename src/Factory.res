@val external process: 'a = "process"

let db = Sequelize.make({
  host: process["env"]["DB_HOST"],
  port: None,
  username: process["env"]["DB_USER"],
  password: process["env"]["DB_PASS"],
  database: process["env"]["DB_DATABASE"],
  dialect: "mysql",
  dialectModule: None,
  dialectModulePath: None,
  storage: None,
  protocol: None,
})
