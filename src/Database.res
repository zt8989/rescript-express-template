let make = () => {
  let connect = Sequelize.make({
    host: "localhost",
    port: None,
    username: "root",
    password: "my-secret-pw",
    database: "re-site",
    dialect: "mysql",
    dialectModule: None,
    dialectModulePath: None,
    storage: None,
    protocol: None,
  })
  connect
}
