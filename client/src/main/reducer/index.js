import { combineReducers } from 'redux'
import mainState from './main'

const appReducer = combineReducers({
  mainState
})

const rootReducer = (state, action) => {
  return appReducer(state, action)
}

export default rootReducer