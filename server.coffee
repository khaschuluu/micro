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

mongoose.model 'Category', CategorySchema
Category = mongoose.model 'Category'

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

server.get ///^/api/categories/?$///, readCategories
server.get '/api/categories/:id', readCategory
server.post '/api/categories', createCategory
server.del '/api/categories/:id', deleteCategory

server.get ///.*///, restify.serveStatic
  directory: './static'
  default: 'index.html'
  maxAge: 0

server.listen port
