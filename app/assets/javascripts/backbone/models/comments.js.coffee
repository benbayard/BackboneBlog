class BackboneBlog.Models.Comments extends Backbone.Model
  paramRoot: 'comment'


class BackboneBlog.Collections.CommentsCollection extends Backbone.Collection
  model: BackboneBlog.Models.Comments
  url: '/comments'
