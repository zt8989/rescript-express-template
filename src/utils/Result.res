type result<'a> = {
  code: int,
  data: 'a,
  success: bool,
  message: string,
}

let makeOk = data => {code: 200, data: data, success: true, message: ""}
let makeError = (message: string) => {
  code: 500,
  data: Js_null.empty,
  message: message,
  success: false,
}
