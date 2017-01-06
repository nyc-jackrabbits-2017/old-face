class SearchBox extends React.Component {

  constructor(){
    super();
    this.state = {
    users: []
  }
    this.updateUsers = this.updateUsers.bind(this)
  }

  componentDidMount(){
    let path = window.location.pathname
    $.ajax({
      url: path +'.json'
    }).done(this.updateUsers)
  }


  handleSearch(e){
    e.preventDefault()

    let userInput = this.refs.userInput

    $.ajax({
      url: '/users',
      method: 'GET'
    }.done(this.updateUsers))

    }

    updateUsers(response){
      this.setState({
        users: response.users
      })
    }


  render(){

    return(
      <div className="container">
        <h1>Users</h1>
        <form action="/users" onSubmit={this.handleSearch.bind(this)}>
          <input type="search" name="query" placeholder="search" ref="userSubmit"/>
          <input type="submit" value="Search"/>
        </form>
        <ul>
          { this.state.users.map( (user) =>
            < User user={user} key={user.id} />
            )}
        </ul>
      </div>
      )
  }
}
