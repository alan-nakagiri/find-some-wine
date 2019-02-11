import { call, put, takeLatest } from 'redux-saga/effects'
import {
  LOAD_WINERIES,
  loadWineriesSuccess
} from '../actions'
import api from '../api'

export function* handleLoadWineries() {
  try {
    const apiResponse = yield call(api.wineries.index)
    console.log('RESPONSE', apiResponse)
    yield put(loadWineriesSuccess(apiResponse.wineries))
  } catch (error) {
    // yield put(createAssessmentError(error))
  }
}

export default function* loadWineries() {
  yield takeLatest(LOAD_WINERIES, handleLoadWineries)
}
