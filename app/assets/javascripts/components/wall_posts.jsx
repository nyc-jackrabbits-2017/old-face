class WallPost extends React.Component {

  constructor(){
    super();
    this.state = {
      userPosts: [],
      wallPosts: []
    }

    this.updatePosts = this.updatePosts.bind(this)
  }


  componentDidMount(){

    $.ajax({
      url: '/users/1/posts.json'
    }).done(this.updatePosts)
  }

  updatePosts(response){

    this.setState({
      userPosts: response.posts
      // wallPosts: response.wall_posts

    })
  }

  render(){
    return (
      <div>
        { this.state.userPosts.map( (post) =>
            <Post post={post} key={post.id}/>
          )
        }
      </div>
      )
  }
}
