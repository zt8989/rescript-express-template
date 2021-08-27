@module external appRoot: string = "app-root-path"

let options = {
  "file": {
    "level": "info",
    "filename": j`${appRoot}/logs/app.log`,
    "handleExceptions": true,
    "json": true,
    "maxsize": 5242880, // 5MB
    "maxFiles": 5,
    "colorize": false,
  },
  "console": {
    "level": "debug",
    "handleExceptions": true,
    "json": false,
    "colorize": true,
  },
}

let logger = Winston.createLogger({
  "transports": [
    Winston.makeConsole(Winston.anyToOptions(options["console"])),
    Winston.makeFile(Winston.anyToOptions(options["file"])),
  ],
  "format": Winston.format->Winston.combine([
    Winston.format->Winston.timestamp(),
    Winston.format->Winston.prettyPrint(),
  ]),
  "exitOnError": false,
})

let info = logger->Winston.info
let warn = logger->Winston.warn
let error = logger->Winston.error

let stream = {
  "write": info,
}
