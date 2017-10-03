var AllEatenFoods = React.createClass({

    handleDelete(id) {
        console.log('delete eaten food clicked');
        this.props.handleDelete(id);
    },

    onUpdate(eaten_food) {
        this.props.onUpdate(eaten_food);
    },

    render() {

        var eaten_foods_body = this.props.eaten_foods.map((eaten_food) => {
            return (
                <EatenFood eaten_food={eaten_food}
                      handleDelete={this.handleDelete.bind(this, eaten_food.id)}
                      handleUpdate={this.onUpdate}/>
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
