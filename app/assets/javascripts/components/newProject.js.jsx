var NewProject = React.createClass({

  render: function () {
    return (
      <div className="add-a-project">
        <input type="text" placeholder="Name your project" ref="text" />

        <button>Add this project</button>
        <button className="white" onClick={this.props.cancel}>Cancel</button>
      </div>
    );
  }
});
