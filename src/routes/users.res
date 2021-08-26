open Express.Router
let router = make()

router->get("/", (_req, res) => {
  res->Express.send("respond with a resource")->ignore
})
