type expressWinston
type winston

@module external expressWinston: expressWinston = "express-winston"
@module external winston: winston = "winston"
@module("express-winston") external logger: 'a => Express.middleware = "logger"
@module("winston") @new external console: unit => 'a = "transports.Console"
