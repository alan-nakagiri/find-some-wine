import React, { Component } from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { loadWineries } from '../actions'
import { css } from 'aphrodite'
import styles from '../styles/app'

class App extends Component {
  componentDidMount() {
    this.props.loadWineries()
  }

  render() {
    const names = this.props.wineries.map((winery, index) => (
      <div
        key={`winery_${index}`}
        className={css(styles.name)}
      >
        {`${winery.name}`}
      </div>
    ))
    return (
      <div className={css(styles.outerContainer)}>
        <div>{'Wineries'}</div>
        {names}
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  console.log('STATE', state)
  return {
    wineries: state.mainState.wineries
  }
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators({
    loadWineries
  }, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)
