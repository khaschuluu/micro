define [
    'jquery'
    'backbone'
    'jade!templates/cat'
], ($, Backbone, template) ->
    Backbone.View.extend
        tagName: 'li'
        className: "list-group-item"
        template: _.template template()
        is_expand: false
        events:
            'click .expand:first': 'click'
            'click .name:first': 'select'
            'click .delete': 'delete'
        render: ->
            i = @
            i.$el.html i.template i.model.attributes
            i
        click: ->
            i = @
            if not i.is_expand
                CatsView = require "cs!views/cats"
                i.child_view = new CatsView _parentId: i.model.id
                i.$el.append i.child_view.render().el
                i.$("span.glyphicon.expand").removeClass("glyphicon-chevron-right").addClass "glyphicon-chevron-down"
                i.is_expand = true
            else
                i.child_view.$el.slideUp()
                i.$("span.glyphicon.expand").removeClass("glyphicon-chevron-down").addClass "glyphicon-chevron-right"
                i.is_expand = false
        select: ->
            i = @
            $(".mcr_cats > li").removeClass "active"
            i.$el.addClass "active"
        delete: ->
            i = @
            if confirm("Are you sure to delete '" + i.model.get("name") + "'?")
                i.model.destroy
                    success: ->
                        i.remove()
