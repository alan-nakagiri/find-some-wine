import makeActionCreator from '../makeActionCreator'

export const LOAD_WINERIES = 'wineres/load'
export const LOAD_WINERIES_SUCCESS = 'wineres/LOAD_WINERIES_SUCCESS'

export const loadWineries = makeActionCreator(LOAD_WINERIES)
export const loadWineriesSuccess = makeActionCreator(LOAD_WINERIES_SUCCESS, 'wineries')
