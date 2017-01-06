class PostToWall extends React.Component {

  render() {
    debugger
    let {title, body, receiver_id, poster_id } = this.props.post ;

    return(
       <li><p>{ title }</p>
          <p>{ poster_id }</p>
          <p>{ body }</p>
      </li>
      )
  }
}
