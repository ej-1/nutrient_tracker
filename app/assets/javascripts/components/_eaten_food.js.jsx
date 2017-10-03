var EatenFood = React.createClass({

    getInitialState() {
        return {editable: false}
    },

    handleEdit() {
        if(this.state.editable) {
            var id = this.props.eaten_food.id;
            var name = this.refs.name.value;
            var amount = this.refs.amount.value;
            var eaten_at = this.refs.eaten_at.value;
            var eaten_food = {id: id, name: name , amount: amount , eaten_at: eaten_at};
            this.props.handleUpdate(eaten_food);
        }
        this.setState({ editable: !this.state.editable })
    },

    render() {
        var id = this.props.eaten_food.id
        var name = this.state.editable ? <input type='text' ref='name' defaultValue={this.props.eaten_food.name} /> : <p>{this.props.eaten_food.name}</p>;
        var amount = this.state.editable ? <input type='text' ref='amount' defaultValue={this.props.eaten_food.amount} />: <p>{this.props.eaten_food.amount}</p>;
        var eaten_at = this.state.editable ? <input type='text' ref='eaten_at' defaultValue={this.props.eaten_food.eaten_at} />: <p>{this.props.eaten_food.eaten_at}</p>;
        return (
            <tr key={id}>
              <td>{name}</td>
              <td>{amount}</td>
              <td>{eaten_at}</td>
              <td>
                <button onClick={this.props.handleDelete} >Delete</button>
              </td>
              <td>
                <button onClick={this.handleEdit}> {this.state.editable ? 'Submit' : 'Edit' } </button>
              </td>
            </tr>
        )
    }
});
