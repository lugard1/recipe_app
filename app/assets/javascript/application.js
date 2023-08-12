// app/assets/javascripts/application.js
document.addEventListener("DOMContentLoaded", function () {
    const toggleInputs = document.querySelectorAll('.toggle-checkbox');
  
    toggleInputs.forEach((input) => {
      input.addEventListener("change", function () {
        const form = this.closest("form");
        form.submit();
      });
    });
  });
  