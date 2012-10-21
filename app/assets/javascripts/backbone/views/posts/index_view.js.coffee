BackboneBlog.Views.Posts ||= {}

class BackboneBlog.Views.Posts.IndexView extends Backbone.View
  template: JST["backbone/templates/posts/index"]

  initialize: () ->
    @options.posts.bind('reset', @addAll)

  addAll: () =>
    $("#posts-list").html("")
    @options.posts.each(@addOne)

  addOne: (post) =>
    view = new BackboneBlog.Views.Posts.PostView({model : post})
    @$("#posts-list").append(view.render().el)

  render: =>
    $(@el).html(@template(posts: @options.posts.toJSON() ))
    @addAll()

    return this
