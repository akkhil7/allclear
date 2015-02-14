var ProjectBlank = React.createClass({
  getInitialState: function () {
    return { isAdding: false }
  },

  toggleAddingProject: function () {
    var isAdding = this.state.isAdding;
    this.setState({ isAdding: !isAdding });
  },

  render: function () {
    var isAdding = this.state.isAdding;
    if (isAdding) {
      var display = <NewProject cancel={this.toggleAddingProject} />
    } else {
      var display = <button onClick={this.toggleAddingProject}>Add a new project</button>
    }

    return (
      <div className="projects-blank">
        <h3>There are no projects yet!</h3>
        <p>That means you are either just getting started or have deleted everything.</p>
        {display}
      </div>
    );
  }
});
