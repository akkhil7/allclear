var ProjectList = React.createClass({
  getInitialState: function(){
    return { 
      projects: this.props.projects
    }
  },
  addProject: function () {
    var _this = this;
    var project = {
      name: this.refs.name.getDOMNode().value
    };

    if ($.trim(project.name) === "") {
      return alert("Project name can't be empty!")
    }

    $.ajax({
      url: "/projects",
      type: "POST",
      data: { project : project },
      success: function (res) {
        _this.props.added(res);
        console.log(res);
      },
      error: function (res) {
        console.log(res)
      }
    });

  }, 

  deleteProject: function(project) {
    var projects = this.state.projects;
    var index = projects.indexOf(project);
    projects.splice(index,1);
    this.setState({
      projects: projects
    })
  },

  render: function() {
    var _this = this;
    var projects = this.props.projects;
    if(projects.length>0){
      var display=<div className="project-list">
           Projects ({projects.length})
           {projects.map(function(project){
              return <ProjectBox deleted={_this.deleteProject} project={project} />
           })}
        </div>
    }

    return (
      <div className="projectswrapper">    
        {display}
        <div className="add-a-project">
          <input type="text" placeholder="Name your project" ref="name" />

          <button onClick={this.addProject}>Add this project</button>
          <button className="white" onClick={this.props.cancel}>Cancel</button> 

        </div>
      </div>
    );
  }

});