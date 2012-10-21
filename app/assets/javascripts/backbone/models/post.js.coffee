class BackboneBlog.Models.Post extends Backbone.Model
  paramRoot: 'post'
  initialize: ->
    @comments = new BackboneBlog.Collections.CommentsCollection(@get('comments'))

class BackboneBlog.Collections.PostsCollection extends Backbone.Collection
  model: BackboneBlog.Models.Post
  url: '/posts'