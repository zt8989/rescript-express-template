@module("dotenv") external loadEnv: unit => unit = "config"
loadEnv()

@module("app-root-path") external resolve: string => string = "resolve"
// @module external morgan: (string, 'b) => 'a = "morgan"
@module external cookieParser: unit => 'a = "cookie-parser"
@module external createError: int => 'a = "http-errors"
@module("express-vhtml-views") external createEngine: unit => 'a = "createEngine"
@module("swig") external renderFile: (. unit) => 'a = "renderFile"
@val external __dirname: string = "__dirname"

open Express

let app = Express.expressCjs()

app->use(
  Winston.createExpresslogger({
    "winstonInstance": Logger.logger,
  }),
)

// view engine setup
app->Express2.engine("jsx", createEngine())
app->Express2.set("views", resolve("views"))
app->Express2.set("view engine", "jsx")
// app->Express.use(Express.asMiddleware(morgan("combined", {"stream": Logger.stream})))
app->Express.use(Express.jsonMiddleware())
app->Express.use(Express.urlencodedMiddlewareWithOptions({"extended": false}))
app->Express.use(Express.asMiddleware(cookieParser()))
app->Express.use(Express.staticMiddleware(resolve("public")))

app->useRouterWithPath("/", Index.router)
app->useRouterWithPath("/users", Users.router)

app->use(
  Winston.createExpressErrorLogger({
    "winstonInstance": Logger.logger,
  }),
)

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
