var NewProject = React.createClass({
  addProject: function () { 
    var project = {
      name: this.refs.name.getDOMNode().value
    };

    console.log(project);

    $.post('/projects', { project: project }, function (response){
      console.log(response);
    })
  },
  render: function () {
    return (
      <div className="add-a-project">
        <input type="text" placeholder="Name your project" ref="name" />

        <button onClick={this.addProject}>Add this project</button>
        <button className="white" onClick={this.props.cancel}>Cancel</button> /*on click, it accesses 
        cancel property of NewProject (which is in ProjectBlank - this initiates ToggleAddingProject)*/
      </div>
    );
  }
});
