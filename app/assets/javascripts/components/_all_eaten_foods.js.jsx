var AllEatenFoods = React.createClass({

    handleDelete(id) {
        console.log('delete eaten food clicked');
        this.props.handleDelete(id);
    },

    render() {
        var eaten_foods_body = this.props.eaten_foods.map((eaten_food) => {
            return (
                <tr>
                  <td>{eaten_food.name}</td>
                  <td>{eaten_food.amount}</td>
                  <td>{eaten_food.eaten_at}</td>
                  <td>
                    <button onClick={this.handleDelete.bind(this, eaten_food.id)} >Delete</button>
                  </td>
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
              {eaten_foods_body}
            </tbody>
          </table>
        )
    }
});
