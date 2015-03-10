var App = React.createClass({

  getInitialState: function () {
    return {
      projects: []
    }
  },

  componentDidMount: function () {
    this.setState({
      projects: this.props.projects
    })
  },

  addProject: function (project) {
    var projects = this.state.projects;
    projects.push(project);
    this.setState({
      projects: projects
    })
  },

  render: function () {
    var projects = this.state.projects;

    if (projects.length === 0) {
      var projectView = <ProjectBlank /> //if no projects then render ProjectBlank component
    } else {
      var projectView = <ProjectList projects={projects} added={this.addProject} /> //pass down {projects} to ProjectList(list of all projects)
    }

    return (
      <div className="projects">
        {projectView}
      </div>
    );
  }
});
