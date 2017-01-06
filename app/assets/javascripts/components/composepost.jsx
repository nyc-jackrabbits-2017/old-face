class ComposePost extends React.Component {

  handleSubmit(event){
    event.preventDefault()
  }

  render() {


    return (
      <div>
      <h2>Make a Post to {this.props.user} wall</h2>
      <form className="navbar-form navbar-left" onSubmit={this.handleSubmit.bind(this)}>
        <label>Title</label><br/>
        <input type="text" className="form-group" ref="titleBox"/>
        <label>Body</label><br/>
        <input type="textarea" className="form-group" ref="bodyBox"/>

        <input type="submit" className="btn btn-default" value="submit"/>
      </form>
      </div>


      )
  }
}
