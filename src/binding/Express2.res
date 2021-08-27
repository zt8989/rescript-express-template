@send external render: (Express.res, string) => unit = "render"
@send external renderWithOptions: (Express.res, string, 'a) => unit = "render"
@send external set: (Express.express, string, 'a) => unit = "set"
@send external get: (Express.express, string) => 'a = "get"
@send external engine: (Express.express, string, 'a) => unit = "engine"
@get external app: Express.req => Express.express = "app"

open Promise
let thenJson = (next: Promise.t<'a>, res: Express.res) => {
  next
  ->Promise.thenResolve(result => result->Result.makeOk->Express.json(res, _))
  ->Promise.catch(error =>
    switch error {
    | JsError(err) =>
      switch Js.Exn.message(err) {
      | Some(msg) => Express.json(res, Result.makeErrorWithData(msg, err))
      | None => Express.json(res, err)
      }
    | _ => Express.json(res, Result.makeErrorWithData(`未知的错误`, error))
    }->Promise.resolve
  )
}
let thenJsonIgnore = (next: Promise.t<'a>, res: Express.res) => {
  thenJson(next, res)->ignore
}
