type winston
type winstonLogger
type format
type transportOptions

@module external winston: winston = "winston"
@module("winston") external format: format = "format"
@module("winston") external createLogger: 'a => winstonLogger = "createLogger"

@variadic @send external combine: (format, array<'a>) => 'c = "combine"
@send external colorize: (format, unit) => 'a = "colorize"
@send external timestamp: (format, unit) => 'a = "timestamp"
@send external prettyPrint: (format, unit) => 'a = "prettyPrint"
@send external json: (format, unit) => 'a = "json"
@send external info: (winstonLogger, string) => unit = "info"
@send external warn: (winstonLogger, string) => unit = "warn"
@send external error: (winstonLogger, string) => unit = "error"
external anyToOptions: 'a => transportOptions = "%identity"
let makeConsole: transportOptions => 'a = %raw(`(options) => new (require("winston").transports.Console)(options)`)
let makeFile: transportOptions => 'a = %raw(`(options) => new (require("winston").transports.File)(options)`)

type expressWinston
@module external expressWinston: expressWinston = "express-winston"
@module("express-winston") external createExpresslogger: 'a => Express.middleware = "logger"
@module("express-winston")
external createExpressErrorLogger: 'a => Express.middleware = "errorLogger"
