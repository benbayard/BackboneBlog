#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BackboneBlog =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    @router = new BackboneBlog.Routers.PostsRouter()
    Backbone.history.start()