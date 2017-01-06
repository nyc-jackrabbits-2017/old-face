class User extends React.Component {

  render() {

    let{username, id} =  this.props.user;

    return(
      <li><a href={"users/" + id + "/posts"}>{username}</a></li>
      )
  }
}
