
document.addEventListener("DOMContentLoaded", () => {
	  const editBtn = document.getElementById("editButton");
	  const deleteBtn = document.getElementById("deleteButton");
	  const editModal = document.getElementById("editModal");
	  const deleteModal = document.getElementById("deleteModal");
	  const cancelEdit = document.getElementById("cancelEdit");
	  const cancelDelete = document.getElementById("cancelDelete");

	  editBtn.addEventListener("click", () => editModal.style.display = "flex");
	  cancelEdit.addEventListener("click", () => editModal.style.display = "none");

	  deleteBtn.addEventListener("click", () => deleteModal.style.display = "flex");
	  cancelDelete.addEventListener("click", () => deleteModal.style.display = "none");

	  window.addEventListener("click", (e) => {
	    if (e.target === editModal) editModal.style.display = "none";
	    if (e.target === deleteModal) deleteModal.style.display = "none";
	  });
	});
