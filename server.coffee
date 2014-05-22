restify = require 'restify'
mongoose = require 'mongoose'

port = process.env.PORT || 3000

server = restify.createServer()
server.use restify.bodyParser()
server.use restify.queryParser()

config = require './config'
db = mongoose.connect config.creds.mongoose_auth
Schema = mongoose.Schema

CategorySchema = new Schema
    name: String
    _parentId: Schema.Types.ObjectId
, versionKey: false

ProductSchema = new Schema
    name: String
    price: Number
    file: Buffer
    _categoryId: Schema.Types.ObjectId
    description: String
    count: Number
, versionKey: false

mongoose.model 'Category', CategorySchema
mongoose.model 'Product', ProductSchema

Category = mongoose.model 'Category'
Product = mongoose.model 'Product'

readCategories = (req, res) ->
    if req.query._parentId == ""
        req.query._parentId = null
    Category.find req.query, (err, data) ->
        res.send data

readCategory = (req, res) ->
    Category.findById req.params.id, (err, data) ->
        res.send data

createCategory = (req, res) ->
    Category.create req.body, (err, data) ->
        res.send data

updateCategory = (req, res) ->
    Category.update _id: req.params.id, req.body, ->
        res.end

deleteCategory = (req, res) ->
    Category.remove _id: req.params.id, ->
        res.send true

readProducts = (req, res) ->
    if req.query._parentId == ""
        req.query._parentId = null
    Product.find req.query, (err, data) ->
        res.send data

readProduct = (req, res) ->
    Product.findById req.params.id, (err, data) ->
        res.send data

createProduct = (req, res) ->
    Product.create req.body, (err, data) ->
        res.send data

updateProduct = (req, res) ->
    Product.update _id: req.params.id, req.body, ->
        res.end

deleteProduct = (req, res) ->
    Product.remove _id: req.params.id, ->
        res.send true


server.get ///^/api/categories/?$///, readCategories
server.get '/api/categories/:id', readCategory
server.post '/api/categories', createCategory
server.del '/api/categories/:id', deleteCategory

server.get ///^/api/products/?$///, readProducts
server.get '/api/products/:id', readProduct
server.post '/api/products', createProduct
server.del '/api/products/:id', deleteProduct

server.get ///.*///, restify.serveStatic
  directory: './static'
  default: 'index.html'
  maxAge: 0

server.listen port
