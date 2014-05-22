define [
    'backbone'
    'jade!templates/cat'
], (Backbone, template) ->
    Backbone.View.extend
        tagName: 'li'
        className: "list-group-item"
        template: _.template template()
        events:
            'click .expand': 'click'
            'click .delete': 'delete'
        render: ->
            i = @
            i.$el.html i.template i.model.attributes
            i
        click: ->
            i = @
            CatsView = require "cs!views/cats"
            cats_view = new CatsView _parentId: i.model.id
            i.$el.append cats_view.render().el
        delete: ->
            i = @
            if confirm("Are you sure to delete '" + i.model.get("name") + "'?")
                i.model.destroy
                    success: ->
                        i.remove()
