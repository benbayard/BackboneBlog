class BackboneBlog.Routers.PostsRouter extends Backbone.Router
  initialize: (options) ->
    @posts = new BackboneBlog.Collections.PostsCollection()
    @posts.reset options.posts


  routes:
    "": "index"
    "new"      : "newPost"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newPost: ->
    @view = new BackboneBlog.Views.Posts.NewView(collection: @posts)
    $("#posts").html(@view.render().el)

  index: ->
    @view = new BackboneBlog.Views.Posts.IndexView(posts: @posts)
    $("#posts").html("")
    $("#posts").html(@view.render().el)

  show: (id) ->
    console.log(@posts)
    console.log(id)
    @post = @posts.get(id)
    console.log(@posts.at(0))
    @view = new BackboneBlog.Views.Posts.ShowView(model: @post)
    $("#posts").html(@view.render().el)

  edit: (id) ->
    post = @posts.get(id)

    @view = new BackboneBlog.Views.Posts.EditView(model: post)
    $("#posts").html(@view.render().el)
