define [
    'backbone'
    'cs!views/cats'
    'jade!templates/home'
], (Backbone, CatsView, template) ->
    Backbone.View.extend
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            cats_cont = i.$el.find "#micro_parent_cats"
            cats_view = new CatsView _parentId: null
            cats_cont.html cats_view.render().el
            i
