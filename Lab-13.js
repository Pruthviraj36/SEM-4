// 1. Create an index on the company field in the stocks collection.
db.stock.createIndex({company: 1})

// 2. Create a compound index on the sector and sales fields in the stocks collection.
db.stock.createIndex({ sector: 1, sales: 1})

// 3. List all the indexes created on the stocks collection.
db.stock.getIndexes()

// 4. Drop an existing index on the company field from the stocks collection.
db.stock.dropIndex("company_1")

// 5. Use a cursor to retrieve and iterate over documents in the stocks collection, displaying each document.
const cursor = db.stock.find()

// 6. Limit the number of documents returned by a cursor to the first 3 documents in the stocks collection.
cursor = db.stock.find().limit(3)

// 7. Sort the documents returned by a cursor in descending order based on the sales field.
cursor = db.stock.find().sort({sales: -1})

// 8. Skip the first 2 documents in the result set and return the next documents using the cursor.
cursor = db.stock.find().skip(2)

// 9. Convert the cursor to an array and return all documents from the stocks collection.
cursor = db.stock.find().toArray()

// 10. Create a collection named "Companies" with schema validation to ensure that each document must contains a company field (string) and a sector field (string).
db.createCollection("Companies", {
	validator: {
		$jsonSchema: {
			bsonType: "object",
			required: ["company", "sector"],
			properties: {
				company: {
					bsonType: "string",
					description: "must be a string and is required"
				},
				sector: {
					bsonType: "string",
					description: "must be a string and is required"
				}
			}
		}
	},
	validationAction: "error"
})
