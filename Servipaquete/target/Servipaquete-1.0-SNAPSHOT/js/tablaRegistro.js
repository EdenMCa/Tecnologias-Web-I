// Funcionalidad para la página de registro de pedidos
document.addEventListener('DOMContentLoaded', function () {
    // Referencias a elementos del modal
    const modal = document.getElementById('pedidoModal');
    const closeModalBtns = document.querySelectorAll('.close-modal');
    const viewBtns = document.querySelectorAll('.view-btn');
    const printBtn = document.getElementById('print-btn');

    // Datos de ejemplo para los pedidos (en una aplicación real estos vendrían de una base de datos)
    const pedidos = {
        1: {
            cliente: "Eden Mendoza",
            telefono: "951 112 9825",
            direccion: "Priv. Cuahuremoc #12",
            comunidad: "Centro",
            pago: "Efectivo",
            tipo: "Abarrotes. Verdura",
            tiempo: "30 minutos",
            operador: "Karen Fernanda Bautista",
            repartidor: "Jorge Ramírez Amaro",
            descripcion: "1 Kg de tomate\n2 Kg de carne para tacos",
            total: "115.50 pesos"
        },
        2: {
            cliente: "Hazel Ramírez",
            telefono: "951 234 5678",
            direccion: "Cuahuremoc #13",
            comunidad: "Norte",
            pago: "Transferencia",
            tipo: "Mercancía General",
            tiempo: "45 minutos",
            operador: "Carlos Martínez",
            repartidor: "Jorge Ramírez Amaro",
            descripcion: "Paquete pequeño\nDocumentos importantes",
            total: "75.00 pesos"
        },
        3: {
            cliente: "Christian Martínez",
            telefono: "951 345 6789",
            direccion: "Hernandez #25",
            comunidad: "Sur",
            pago: "Efectivo",
            tipo: "Alimentos",
            tiempo: "25 minutos",
            operador: "Luis Hernández",
            repartidor: "Jorge Ramírez Amaro",
            descripcion: "Pizza familiar\n2 refrescos",
            total: "220.00 pesos"
        },
        4: {
            cliente: "Karen Bautista",
            telefono: "951 456 7890",
            direccion: "Fidencio #30",
            comunidad: "Oriente",
            pago: "Transferencia",
            tipo: "Documentos",
            tiempo: "20 minutos",
            operador: "Ana Rodríguez",
            repartidor: "Jorge Ramírez Amaro",
            descripcion: "Sobre con documentos legales",
            total: "50.00 pesos"
        },
        5: {
            cliente: "Laura García",
            telefono: "951 567 8901",
            direccion: "Calle Flores #45",
            comunidad: "Centro",
            pago: "Efectivo",
            tipo: "Farmacia",
            tiempo: "35 minutos",
            operador: "Miguel Hernández",
            repartidor: "Miguel Hernández",
            descripcion: "Medicamento recetado\nTermómetro digital",
            total: "185.75 pesos"
        },
        6: {
            cliente: "Roberto Sánchez",
            telefono: "951 678 9012",
            direccion: "Privada Sol #55",
            comunidad: "Oriente",
            pago: "Transferencia",
            tipo: "Electrónicos",
            tiempo: "50 minutos",
            operador: "Jorge Ramírez",
            repartidor: "Ana Rodríguez",
            descripcion: "Cargador para laptop\nMouse inalámbrico",
            total: "320.00 pesos"
        }
    };

    // Funcionalidad para abrir el modal
    viewBtns.forEach(btn => {
        btn.addEventListener('click', function () {
            const pedidoId = this.getAttribute('data-id');
            const pedido = pedidos[pedidoId];

            // Llenar el modal con los datos del pedido
            document.getElementById('modal-cliente').textContent = pedido.cliente;
            document.getElementById('modal-telefono').textContent = pedido.telefono;
            document.getElementById('modal-direccion').textContent = pedido.direccion;
            document.getElementById('modal-comunidad').textContent = pedido.comunidad;
            document.getElementById('modal-pago').textContent = pedido.pago;
            document.getElementById('modal-tipo').textContent = pedido.tipo;
            document.getElementById('modal-tiempo').textContent = pedido.tiempo;
            document.getElementById('modal-operador').textContent = pedido.operador;
            document.getElementById('modal-repartidor').textContent = pedido.repartidor;
            document.getElementById('modal-descripcion').textContent = pedido.descripcion;
            document.getElementById('modal-total').textContent = pedido.total;

            // Mostrar el modal
            modal.style.display = 'flex';
        });
    });

    // Funcionalidad para cerrar el modal
    closeModalBtns.forEach(btn => {
        btn.addEventListener('click', function () {
            modal.style.display = 'none';
        });
    });

    // Cerrar modal al hacer clic fuera del contenido
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    // Funcionalidad de impresión
    printBtn.addEventListener('click', function () {
        alert('Función de impresión activada. En una aplicación real, esto generaría un PDF o recibo.');
        // Aquí iría la lógica para imprimir o generar un PDF
    });

    // Funcionalidad de búsqueda
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('input', function () {
            const searchTerm = this.value.toLowerCase().trim();
            const rows = document.querySelectorAll('tbody tr');

            rows.forEach(row => {
                const rowText = row.textContent.toLowerCase();
                row.style.display = rowText.includes(searchTerm) ? '' : 'none';
            });
        });
    }

    // Funcionalidad de filtros
    const filterButtons = document.querySelectorAll('.filter-btn');

    filterButtons.forEach(button => {
        button.addEventListener('click', function () {
            // Remover clase activa de todos los botones
            filterButtons.forEach(btn => btn.classList.remove('active'));

            // Agregar clase activa al botón clickeado
            this.classList.add('active');

            // Obtener el tipo de filtro
            const filterType = this.getAttribute('data-filter');
            const rows = document.querySelectorAll('tbody tr');

            rows.forEach(row => {
                const status = row.getAttribute('data-status');

                if (filterType === 'all') {
                    row.style.display = '';
                } else if (filterType === status) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });


    // Paginación
    const paginationButtons = document.querySelectorAll('.pagination button');
    paginationButtons.forEach(button => {
        button.addEventListener('click', function () {
            paginationButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            // Aquí iría la lógica para cargar la página correspondiente
        });
    });
});
