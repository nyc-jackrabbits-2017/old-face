class WallPost extends React.Component {

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

    $.ajax({
      url: '/users/1ex/posts.json'
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
    debugger
    return (
      <div>
        <h2>{this.state.user} posts</h2>
        <ul>
        { this.state.userPosts.map( (post) =>
            <Post post={post} key={post.id}/>
          )
        }
        <h2>{this.state.user} wall posts</h2>
        </ul>
        { this.state.wallPosts.map( (wallpost) =>
            <PostToWall post={wallpost} key={wallpost.id}/>
          )
        }
      </div>
      )
  }
}
