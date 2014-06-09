define [
    'backbone'
    'cs!models/category'
    'cs!views/cats'
    'jade!templates/side'
], (Backbone, Category, ListView, template) ->
    Backbone.View.extend
        className: "col-md-3"
        template: _.template template()
        events:
            "click .add": "create"
        render: ->
            i = @
            i.$el.html template
            list_view = new ListView _parentId: null
            i.$(".panel.mcr_cats_cont").append list_view.render().el
            i
        create: ->
            cat = new Category
