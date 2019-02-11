import Immutable from 'seamless-immutable'
import {
  LOAD_WINERIES_SUCCESS
} from '../actions'

export const defaultState = Immutable.from({
  wineries: []
})

export default function reducer(state = defaultState, action) {
  switch (action.type) {
    case LOAD_WINERIES_SUCCESS:
      console.log('reducer', action)
      return state.set('wineries', action.wineries)
    default:
      return state
  }
}