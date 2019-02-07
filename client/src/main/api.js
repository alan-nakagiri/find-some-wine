import 'whatwg-fetch'
// import { get, post } from '../../util/api'

export const get = (url) => {
  return fetch(url, {
    method: 'GET',
    credentials: 'include',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'API-VERSION': '2',
    }
  }).then((response) => {
    // ensureAuthorized(response)
    return response.json()
  })
}

const csrfToken = () => {
  // Cribbed from https://stackoverflow.com/a/7524621
  // I tried to do something like this:
  //   document.getElementsByTagName('meta').namedItem('csrf-token').getAttribute('content')
  // But sadly, `namedItem` API seems to take issue with capybara-webkit :(

  const metaTags = document.getElementsByTagName('meta')

  for (let i = 0; i < metaTags.length; i++) {
    if (metaTags[i].getAttribute('name') === 'csrf-token') {
      return metaTags[i].getAttribute('content')
    }
  }

  return null
}

export default {
  wineries: {
    index: () => get('api/wineries')
  }
}