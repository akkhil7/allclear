var NewProject = React.createClass({
  addProject: function () { 
    var project = {
      name: this.refs.name.getDOMNode().value
    };

    $.post('/projects', { project: project }, function (response){
      console.log(response);
    })
  },
  render: function () {
    return (
      <div className="add-a-project">
        <input type="text" placeholder="Name your project" ref="name" />

        <button onClick={this.addProject}>Add this project</button>
        <button className="white" onClick={this.props.cancel}>Cancel</button>
      </div>
    );
  }
});
