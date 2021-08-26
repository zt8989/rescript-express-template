@send external render: (Express.res, string) => unit = "render"
@send external renderWithOptions: (Express.res, string, 'a) => unit = "render"
@send external set: (Express.express, string, 'a) => unit = "set"
@send external get: (Express.express, string) => 'a = "get"
@send external engine: (Express.express, string, 'a) => unit = "engine"
@get external app: Express.req => Express.express = "app"

let thenJson = (then: Promise.t<'a>, res: Express.res) => {
  then->Promise.thenResolve(Express.json(res))
}
let thenJsonIgnore = (then: Promise.t<'a>, res: Express.res) => {
  thenJson(then, res)->ignore
}
