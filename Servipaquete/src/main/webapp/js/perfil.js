document.addEventListener('DOMContentLoaded', () => {
  const formPass = document.getElementById('formPassword');

  formPass.addEventListener('submit', e => {
    e.preventDefault();
    const newP = document.getElementById('newPassword').value.trim();
    const confP = document.getElementById('confirmPassword').value.trim();
    if (newP !== confP) {
      alert('La nueva contraseña y su confirmación no coinciden.');
      return;
    }
    // Aquí llamas a tu lógica de backend o servlet para actualizar la contraseña
    alert('Contraseña actualizada con éxito.');
    formPass.reset();
  });

  const formInfo = document.getElementById('formInfo');
  formInfo.addEventListener('submit', e => {
    e.preventDefault();
    // Aquí envías los datos actualizados al backend
    alert('Información personal guardada con éxito.');
  });
});
