define [
    'backbone'
    'cs!views/cats'
    'jade!templates/side'
], (Backbone, ListView, template) ->
    Backbone.View.extend
        className: "col-md-3"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            list_view = new ListView _parentId: null
            i.$(".panel.mcr_cats_cont").append list_view.render().el
            i
