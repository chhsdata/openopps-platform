module.exports = {
  subject: 'There\'s a new comment on "<%- task.title %>"',
  to: '<%- owner.username %>',
  data: function (model, done) {
    var data = {
      comment: model.comment,
      commenter: model.commenter,
      task: model.task,
      owner: model.owner,
    };
    done( null, data );
  },
};
