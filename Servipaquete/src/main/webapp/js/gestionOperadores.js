document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('operadorModal');
    const closeBtns = document.querySelectorAll('.close-modal');
    const btnAgregar = document.getElementById('btnAgregarOperador');
    const btnGuardar = document.getElementById('btnGuardarOperador');
    const inputId = document.getElementById('inputId');
    const inputNombre = document.getElementById('inputNombre');
    const inputTel = document.getElementById('inputTelefono');
    const inputEstado = document.getElementById('inputEstado');
    const modalTitulo = document.getElementById('modalTitulo');

    // NO redefinir contextPath aquí, usar el global definido en JSP.

    function abrirModal(titulo, data = {}) {
        modalTitulo.innerText = titulo;
        inputId.value = data.id || '';
        inputNombre.value = data.nombre || '';
        inputTel.value = data.telefono || '';
        inputEstado.value = data.estado || 'activo';
        modal.style.display = 'flex';
    }

    function cerrarModal() {
        modal.style.display = 'none';
    }

    btnAgregar.addEventListener('click', () => abrirModal('Agregar Operador'));

    closeBtns.forEach(b => b.addEventListener('click', cerrarModal));
    window.addEventListener('click', e => {
        if (e.target === modal) cerrarModal();
    });

    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            abrirModal('Editar Operador', {
                id: btn.dataset.id,
                nombre: btn.dataset.nombre,
                telefono: btn.dataset.telefono,
                estado: btn.dataset.estado
            });
        });
    });

    btnGuardar.addEventListener('click', () => {
        const id = inputId.value;
        const nombre = inputNombre.value.trim();
        const tel = inputTel.value.trim();
        const est = inputEstado.value;

        if (!nombre || !tel) {
            alert('Completa todos los campos.');
            return;
        }

        const accion = id ? 'actualizar' : 'insertar';

        const form = document.createElement('form');
        form.method = 'post';
        form.action = contextPath + '/OperadorServlet';  // Usa contextPath global del JSP

        [['id', id], ['nombre', nombre], ['telefono', tel], ['estado', est], ['accion', accion]]
            .forEach(([name, val]) => {
                const i = document.createElement('input');
                i.type = 'hidden';
                i.name = name;
                i.value = val;
                form.appendChild(i);
            });

        document.body.appendChild(form);
        form.submit();
    });
});
    