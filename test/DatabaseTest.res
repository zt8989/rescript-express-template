let connect = Database.make()

connect->Mysql.connect()

connect->Mysql.query("select * from user", (err, rows, fields) => {
  switch Js_null_undefined.toOption(err) {
  | Some(err) => Js_console.log(err)
  | None => Js_console.log3("got", rows, fields)
  }
})

connect->Mysql.end()
