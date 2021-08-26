type t

type connectionConfig = {
  host: string,
  user: string,
  password: string,
  database: string,
}

@module("mysql") external createConnection: connectionConfig => t = "createConnection"

@send external connect: (t, unit) => unit = "connect"

@send external end: (t, unit) => unit = "end"

@send
external query: (t, string, (Js.null_undefined<Js.Exn.t>, array<'a>, array<'b>) => unit) => unit =
  "query"
