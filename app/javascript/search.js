document.addEventListener('turbo:load', function() {
  const searchInput = document.getElementById('search-input')

  searchInput.addEventListener('input', function() {
    const searchValue = searchInput.value.trim()
    const frame = document.querySelector('turbo-frame#tasks-frame')

    frame.setAttribute('src', '/tasks?search=' + encodeURIComponent(searchValue))
  })
})
