open Sequelize

let user = Factory.db->Sequelize.defineWithOptions(
  "user",
  {
    "id": {
      "type": dataTypes["INTEGER"],
      "primaryKey": true,
    },
    "name": dataTypes["STRING"],
    "created_at": dataTypes["TIME"],
    "updated_at": dataTypes["TIME"],
    "name": dataTypes["TIME"],
  },
  {
    "tableName": "user",
    "timestamps": false,
  },
)
