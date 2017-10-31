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

    removeEatenFoodClient(id) {
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
               this.removeEatenFoodClient(id);
               console.log('successfully removed eaten food')
            }
        });
    },


    handleUpdate(eaten_food) {
      console.log(eaten_food)
        $.ajax({
                url: `/api/v1/eaten_foods/${eaten_food.id}`,
                type: 'PUT',
                data: { eaten_food: eaten_food },
                success: () => {
                    this.updateEatenFoods(eaten_food);

                }
            }
        )},

    updateEatenFoods(eaten_food) {
        var eaten_foods = this.state.eaten_foods.filter((i) => { return i.id != eaten_food.id });
        eaten_foods.push(eaten_food);

        this.setState({eaten_foods: eaten_foods });
    },

    render() {
        return (
            <div>
              <AllEatenFoods eaten_foods={this.state.eaten_foods} handleDelete={this.handleDelete} handleEdit={this.handleEdit} onUpdate={this.handleUpdate}/>
              <NewEatenFood handleSubmit={this.handleSubmit} />
            </div>
        )
    }
});
