class Parent extends React.Component {

   constructor(){
    super();
    this.state = {
      userPosts: [],
      wallPosts: [],
      user: ""

    }

    this.updatePosts = this.updatePosts.bind(this)
  }


  componentDidMount(){
    let path = window.location.pathname
    $.ajax({
      url: path +'.json'
    }).done(this.updatePosts)
  }

  updatePosts(response){

    this.setState({
      userPosts: response.posts,
      wallPosts: response.wall_posts,
      user: response.user.username
    })
  }

  render(){

    return(
      <div>
      <WallPost wallPosts ={this.state.wallPosts} userPosts = {this.state.userPosts} user = {this.state.user}/>
      <ComposePost user = {this.state.user}/>
      </div>
      )
  }
}
