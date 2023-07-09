import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	toggle(e) {
		const id = e.target.dataset.id
		const csrfToken = document.querySelector("[name='csrf-token']").content

		fetch(`/tasks/${id}/toggle`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRF-Token': csrfToken
			},
			body: JSON.stringify({ completed: e.target.checked })
		})
			.then(data => {
				alert(e.target.checked ? 'task completed' : 'task not completed')
			})
	}
}
