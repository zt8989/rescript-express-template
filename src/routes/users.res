open Express.Router
let router = make()

router->get("/", (_req, res) => {
  Model.user
  ->Sequelize.Model.findAll(None)
  ->Promise.then(result => {
    res->Express.json(result)->ignore
    Promise.resolve()
  })
  ->ignore
})
