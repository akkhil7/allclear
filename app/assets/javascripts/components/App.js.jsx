var App = React.createClass({

  render: function () {
    var projects = this.props.projects;

    if (projects.length === 0) {
      var projectView = <ProjectBlank /> //if no projects then render ProjectBlank component
    } else {
      var projectView = <ProjectList projects={projects} /> //pass down {projects} to ProjectList(list of all projects)
    }

    return (
      <div className="projects">
        {projectView}
      </div>
    );
  }
});
