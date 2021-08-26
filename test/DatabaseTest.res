Model.user
->Sequelize.Model.findAll(None)
->Promise.then(res =>
  res
  ->Js_array2.forEach(item => {
    item->Sequelize.Model.get("created_at")->Js_console.log
  })
  ->Promise.resolve
)
->ignore
