let db = Database.make()

open Sequelize

let user = db->Sequelize.define3("user", Some({
	"id": {
		"type": dataTypes["INTEGER"]
		"primaryKey": true
	},
	"name": dataTypes["STRING"],
	"created_at": dataTypes["TIME"],
	"name": dataTypes["TIME"],
}), Some({
	"tableName": "user",
	"timestamps": false
}))
