define [
    'jquery'
    'backbone'
    'cs!views/nav'
    'cs!views/outer_container'
    'cs!views/side'
    'cs!views/main'
    'cs!views/footer'
    'bootstrap'
    'less'
], ($, Backbone, NavView, OuterContainerView, SideView, MainView, FooterView) ->
    AppRouter = Backbone.Router.extend
        routes:
            '(/)': 'home'
            '*action': 'e404'

    nav_view = new NavView
    document.body.appendChild nav_view.render().el

    outer_container_view = new OuterContainerView
    document.body.appendChild outer_container_view.render().el
    ocvr = outer_container_view.$ ".row"

    side_view = new SideView
    ocvr.append side_view.render().el

    main_view = new MainView
    ocvr.append main_view.render().el

    footer_view = new FooterView
    document.body.appendChild footer_view.render().el

    app_router = new AppRouter
    app_router.on 'route:home', ->
        false
    app_router.on 'route:e404', ->
        false

    Backbone.history.start()
