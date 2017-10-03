var Body = React.createClass({
    getInitialState() {
        return { eaten_foods: [] }
        console.log(componentDidMount());
    },

    componentDidMount() {
        $.getJSON('/api/v1/eaten_foods.json', (response) => { this.setState({ eaten_foods: response }) });
    },

    handleSubmit(eaten_food) {
        var newState = this.state.eaten_foods.concat(eaten_food);
        this.setState({ eaten_foods: newState })
        console.log(eaten_food);
    },

    removeItemClient(id) {
        var newEatenFoods = this.state.eaten_foods.filter((eaten_food) => {
            return eaten_food.id != id;
        });

        this.setState({ eaten_foods: newEatenFoods });
    },

    handleDelete(id) {
        console.log('in handle delete');
        $.ajax({
            url: `/api/v1/eaten_foods/${id}`,
            type: 'DELETE',

            success:() => {
               this.removeItemClient(id);
               console.log('successfully removed item')
            }
        });
    },

    render() {
        return (
            <div>
              <AllEatenFoods eaten_foods={this.state.eaten_foods} handleDelete={this.handleDelete} />
              <NewEatenFood handleSubmit={this.handleSubmit} />
            </div>
        )
    }
});
