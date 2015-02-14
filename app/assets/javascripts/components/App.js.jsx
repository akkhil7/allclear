var App = React.createClass({

  render: function () {
    var projects = this.props.projects;

    if (projects.length === 0) {
      var projectView = <ProjectBlank />
    } else {
      var projectView = <ProjectList projects={projects} />
    }

    return (
      <div className="projects">
        {projectView}
      </div>
    );
  }
});
