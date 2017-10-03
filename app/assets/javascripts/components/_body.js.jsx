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

    render() {
        return (
            <div>
              <AllEatenFoods eaten_foods={this.state.eaten_foods} />
              <NewEatenFood handleSubmit={this.handleSubmit}/>
            </div>
        )
    }
});
