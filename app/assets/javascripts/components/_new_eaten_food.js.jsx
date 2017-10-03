

var NewEatenFood = React.createClass({
    handleClick() {
        var name    	= this.refs.name.value;
        var amount 		= this.refs.amount.value;
	    	var eaten_at 	= this.refs.eaten_at.value;
	    	alert('hello');
	   		console.log('The name value is ' + name + 'the amount value is ' + amount + 'eaten at' + eaten_at + '.');
        $.ajax({
            url: '/api/v1/eaten_foods',
            type: 'POST',
            data: { eaten_food: { name: name, amount: amount, eaten_at: eaten_at } },
            success: (response) => {
                console.log('it worked!', response);
            }
        });
    },

    render() {
        return (
                <div>
		                <input ref='name' placeholder='Enter the food'/>
		                <input ref='amount' placeholder='How many grams did you eat?'/>
		                <input ref='eaten_at' placeholder='When did you eat?'/>
                    <button onClick={this.handleClick}>Submit</button>
                </div>
        )
    }
});
