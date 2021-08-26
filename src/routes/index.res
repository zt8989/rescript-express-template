open Express.Router
let router = make()

router->get("/", (req, res) => {
  let result = Js.Dict.fromArray([("title", "Express")])
  res->Express2.render("index", Some(result))
})

router->get("/api", (req, res) => {
  res
  ->Express.json({
    "hello": "world",
  })
  ->ignore
})
