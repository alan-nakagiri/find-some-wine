import { createStore, applyMiddleware, compose } from 'redux'
import createSagaMiddleware from 'redux-saga'
import sagas from './main/sagas'
import reducer from './main/reducer'

export default function configureStore(initialState) {
  const sagaMiddleware = createSagaMiddleware()
  const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose // Enable Redux dev tool

  const store = createStore(
    reducer,
    initialState,
    composeEnhancers(applyMiddleware(sagaMiddleware))
  )


  for (const saga in sagas) {
    sagaMiddleware.run(sagas[saga])
  }

  return store
}