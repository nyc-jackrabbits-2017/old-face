class WallPost extends React.Component {


  render(){

    return (
      <div>
        <h2>{this.props.user} posts</h2>
        <ul>
        { this.props.userPosts.map( (post) =>
            <Post post={post} key={post.id}/>
          )
        }
        </ul>
        <h2>{this.props.user} wall posts</h2>
        <ul>
        { this.props.wallPosts.map( (wallpost) =>
            <PostToWall post={wallpost} key={wallpost.id}/>
          )
        }
        </ul>
      </div>
      )
  }
}
