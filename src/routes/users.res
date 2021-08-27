open Express.Router
let router = make()

router->get("/", (_req, res) => {
  Model.user->Sequelize.Model.findAll(None)->Express2.thenJsonIgnore(res)
})

router->get("/:id", (req, res) => {
  Model.user
  ->Sequelize.Model.findByPk({
    let params = req->Express.params
    params["id"]
  })
  ->Express2.thenJsonIgnore(res)
})

router->post("/", (req, res) => {
  Model.user->Sequelize.Model.create(req->Express.body)->Express2.thenJsonIgnore(res)
})

router->patch("/", (req, res) => {
  let body = req->Express.body
  switch body->Js_dict.get("id") {
  | Some(id) =>
    Model.user
    ->Sequelize.Model.findByPk(id)
    ->Promise2.thenIgnore(result => {
      let _ = switch Js_null.toOption(result) {
      | Some(r) => r->Sequelize.Model.update(body)->Promise2.thenIgnore(res->Express.json)
      | None => res->Express.json(Result.makeError(`未找到对应的用户`))->ignore
      }
    })
  | None => {
      let _ = res->Express.json(Result.makeError(`未指定id`))->ignore
    }
  }
})
