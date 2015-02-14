var ProjectList = React.createClass({
  render: function() {
    var projects = this.props.projects;

    return (
      <div className="project-list">
         Projects ({projects.length})
         {projects.map(function(project){
            return <ProjectBox project={project} />
         })}
      </div>
    );
  }
});