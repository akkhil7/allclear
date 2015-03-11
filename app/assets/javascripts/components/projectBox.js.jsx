var ProjectBox = React.createClass({
  getInitialState: function(){
  return {
    project: this.props.project
  }
  },
  deleteProject: function(){
    var _this = this;
    var project = this.state.project;
    var url = "/projects/" + project.id;
    
    $.ajax({
      type: 'DELETE',
      url: url,
      success: function (response) {
        _this.props.deleted(response)
      }
    })
  },
  addUser: function(){
    var _this = this;
    var project = this.state.project;
    var url = "/projects/" + project.id;
    var username = project.created_by_id;
    username+=","+this.refs.user.getDOMNode().value
    project.user_ids = username.indexOf(",") > -1 ? username.split(",") : [username]

    $.ajax({
      type: 'PUT',
      url: url,
      data: { project : project },
      success: function(res){
        console.log(res);
      }

    });

  },

  render: function() {
    var _this = this;
    var project = this.props.project;

    return (
      <div className="project-box">
        <h1>{project.name}</h1>

        <a onClick={this.deleteProject}>Delete</a>
        <input type="text" placeholder="Enter username" ref="user" />
        <button onClick={this.addUser}>Add this user</button>
      </div>
    );
  }
});
