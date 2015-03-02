var ProjectBox = React.createClass({
  deleteProject: function(){
    var project = this.props.project;
    var url = "/projects/" + project.id;
    
    $.ajax({
      type: 'DELETE',
      url: url,
      success: function (response) {
        console.log(response)
      }
    })
  },

  render: function() {
    var project = this.props.project;

    return (
      <div className="project-box">
        <h1>{project.name}</h1>
        <a onClick={this.deleteProject}>Delete</a>
      </div>
    );
  }
});