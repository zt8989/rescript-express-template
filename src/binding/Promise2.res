let thenIgnore = (then: Promise.t<'b>, f: 'a) => {
  then
  ->Promise.then(_result => {
    f(_result)->ignore
    Promise.resolve()
  })
  ->ignore
}
