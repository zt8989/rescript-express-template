type expressWinston
type winston
type format

@module external expressWinston: expressWinston = "express-winston"
@module external winston: winston = "winston"
@module("winston") external format: format = "format"
@uncurry @send external combine: (format, 'a, 'b) => 'c = "combine"
@send external colorize: (format, unit) => 'a = "colorize"
@send external json: (format, unit) => 'a = "json"
@module("express-winston") external logger: 'a => Express.middleware = "logger"
@module("express-winston") external errorLogger: 'a => Express.middleware = "errorLogger"
let makeConsole: unit => 'a = %raw(`() => new (require("winston").transports.Console)()`)
