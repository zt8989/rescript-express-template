@module("path") external join: (string, string) => string = "join"
@module external logger: string => 'a = "morgan"
@module external cookieParser: unit => 'a = "cookie-parser"
@module external createError: int => 'a = "http-errors"
@val external __dirname: string = "__dirname"

open Express

let app = Express.expressCjs()

// view engine setup
app->Express2.set("views", join(__dirname, "views"))
app->Express2.set("view engine", "jade")
app->Express.use(Express.asMiddleware(logger("dev")))
app->Express.use(Express.jsonMiddleware())
app->Express.use(Express.urlencodedMiddlewareWithOptions({"extended": false}))
app->Express.use(Express.asMiddleware(cookieParser()))
app->Express.use(Express.staticMiddleware(join(__dirname, "public")))

app->useRouterWithPath("/", Index.router)
app->useRouterWithPath("/users", Users.router)

app->Express.use((_req, _res, next) => {
  next(createError(404))
})

app->Express.useWithError((err, req, res, _next) => {
  // set locals, only providing error in development
  let locals = res->locals
  locals["message"] = err->Js.Exn.message
  locals["error"] = if req->Express2.app->Express2.get("env") === "development" {
    Some(err)
  } else {
    None
  }

  // render the error page
  res->status(err->Exn2.status->Js.Option.getWithDefault(500, _))->ignore

  res->Express2.render("error")
})
