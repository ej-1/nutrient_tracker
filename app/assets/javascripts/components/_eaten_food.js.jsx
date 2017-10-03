var EatenFood = React.createClass({
    render: function() {
        return (
          <div className="container">
            <div className="jumbotron">
              <h1>Eaten Foods</h1>
              <p>by Erik Wisalchai Jonsson</p>
            </div>
            <div className="row">
              <div className="col-md-12">
              <h1>This is {this.state.items}</h1>
                <EventTable />
              </div>
            </div>
          </div>
        )
    }
});
