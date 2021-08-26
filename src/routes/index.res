open Express.Router
let router = make()

router->get("/", (_req, res) => {
  let result = Js.Dict.fromArray([("title", "Express")])
  res->Express2.renderWithOptions("index", result)
})

router->get("/api", (_req, res) => {
  res
  ->Express.json({
    "hello": "world",
  })
  ->ignore
})
