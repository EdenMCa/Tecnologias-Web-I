document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('motomandadoModal');
    const closeModalBtns = document.querySelectorAll('.close-modal');
    const btnAgregar = document.getElementById('btnAgregarMotomandado');
    const btnGuardar = document.getElementById('btnGuardarMotomandado');

    const inputId = document.getElementById('inputId');
    const inputNombre = document.getElementById('inputNombre');
    const inputTelefono = document.getElementById('inputTelefono');
    const inputEstado = document.getElementById('inputEstado');
    const inputAccion = document.getElementById('inputAccion');
    const modalTitulo = document.getElementById('modalTitulo');

    function abrirModal(titulo, data = null) {
        modalTitulo.innerText = titulo;
        if (data) {
            inputId.value = data.id;
            inputNombre.value = data.nombre;
            inputTelefono.value = data.telefono;
            inputEstado.value = data.estado;
            inputAccion.value = 'actualizar';
        } else {
            inputId.value = '';
            inputNombre.value = '';
            inputTelefono.value = '';
            inputEstado.value = 'activo';
            inputAccion.value = 'insertar';
        }
        modal.style.display = 'flex';
    }

    function cerrarModal() {
        modal.style.display = 'none';
    }

    // Abrir modal para agregar
    btnAgregar.addEventListener('click', () => abrirModal('Agregar Motomandado'));

    // Cerrar modal
    closeModalBtns.forEach(btn => btn.addEventListener('click', cerrarModal));
    window.addEventListener('click', e => {
        if (e.target === modal) cerrarModal();
    });

    // Abrir modal para editar
    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            abrirModal('Editar Motomandado', {
                id: btn.dataset.id,
                nombre: btn.dataset.nombre,
                telefono: btn.dataset.telefono,
                estado: btn.dataset.estado
            });
        });
    });

    // Guardar (submit form)
    btnGuardar.addEventListener('click', () => {
        if (!inputNombre.value.trim() || !inputTelefono.value.trim()) {
            alert('Completa todos los campos.');
            return;
        }
        document.getElementById('formMotomandado').submit();
    });
});
