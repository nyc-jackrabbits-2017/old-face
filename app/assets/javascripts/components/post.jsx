class Post extends React.Component {

  render(){

    let {title, body, receiver_id, poster_id } = this.props.post ;


    return(
      <li><p>{ title }</p>
          <p>{ receiver_id }</p>
          <p>{ body }</p>
      </li>
      )
}

}
