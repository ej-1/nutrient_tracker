var AllEatenFoods = React.createClass({
    getInitialState() {
        return { items: [] }
        console.log(componentDidMount());
    },

    componentDidMount() {
        $.getJSON('/api/v1/eaten_foods.json', (response) => { this.setState({ items: response }) });
    },

    render() {

        var items_body = this.state.items.map((item) => {
            return (
                <tr>
                  <td>{item.name}</td>
                  <td>{item.amount}</td>
                  <td>{item.eaten_at}</td>
                </tr>
            )
        });


        return(
          <table className="table table-striped">
            <thead>
              <tr>
                <th className="col-md-3">Name</th>
                <th className="col-md-2">Amount</th>
                <th className="col-md-3">Eaten at</th>
              </tr>
            </thead>
            <tbody>
              {items_body}
            </tbody>
          </table>
        )
    }

});


