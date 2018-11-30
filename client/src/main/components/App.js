import React, { Component } from 'react'
import { css } from 'aphrodite'
import styles from '../styles/app'

class App extends Component {
  render() {
    return (
      <div className={css(styles.outerContainer)}>
        <div>
          {'hello world'}
        </div>
        <div>
          {'hello world!!'}
        </div>
      </div>
    );
  }
}

export default App;
