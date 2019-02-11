// Action Creators
// makeActionCreator is from http://redux.js.org/docs/recipes/ReducingBoilerplate.html#generating-action-creators
export default function makeActionCreator(type, ...argNames) {
  return function actionCreator(...args) {
    const action = { type }
    argNames.forEach((arg, index) => {
      action[argNames[index]] = args[index]
    })
    return action
  }
}
