<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Pedidos - ServiPaquete Ixtlán</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gestionPedido.css">

    </head>

    <body>
        <jsp:include page="/jsp/nav.jsp"/>   
    <div style="height: 65px;"></div>
        <div class="dashboard-container">
            <div class="header">
                <h1>Gestión de Pedidos</h1>
            </div>

            <!-- Estadísticas -->
            <div class="stats-container">
                <div class="stat-card" onclick="redirectToTabla('total')">
                    <div class="stat-title">Pedidos de hoy</div>
                    <div class="stat-value">15</div>
                </div>
                <div class="stat-card" onclick="redirectToTabla('pendientes')">
                    <div class="stat-title">Pendientes</div>
                    <div class="stat-value">5</div>
                </div>
                <div class="stat-card" onclick="redirectToTabla('proceso')">
                    <div class="stat-title">En proceso</div>
                    <div class="stat-value">3</div>
                </div>
                <div class="stat-card urgent-card" onclick="redirectToTabla('urgentes')">
                    <div class="stat-title">Urgentes</div>
                    <div class="stat-value">0</div>
                </div>
                <div class="stat-card" onclick="redirectToTabla('finalizados')">
                    <div class="stat-title">Finalizados</div>
                    <div class="stat-value">7</div>
                </div>
            </div>

            <!-- Pedidos pendientes -->
            <h2 class="section-title">Pedidos Pendientes</h2>
            <div class="pedidos-container">
                <table class="pedidos-table">
                    <thead>
                        <tr>
                            <th>Cliente</th>
                            <th>Dirección</th>
                            <th>Localidad</th>
                            <th>Motomandado</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Eden Mendoza</td>
                            <td>Priv. Cuahuremoc #12</td>
                            <td>Centro</td>
                            <td>Jorge Ramírez Amaro</td>
                            <td><span class="status status-pendiente">Pendiente</span></td>
                        </tr>
                        <tr>
                            <td>Hazel Ramírez</td>
                            <td>Cuahuremoc #13</td>
                            <td>Norte</td>
                            <td>Jorge Ramírez Amaro</td>
                            <td><span class="status status-pendiente">Pendiente</span></td>
                        </tr>
                        <tr>
                            <td>Christian Martínez</td>
                            <td>Hernandez #25</td>
                            <td>Sur</td>
                            <td>Jorge Ramírez Amaro</td>
                            <td><span class="status status-pendiente">Pendiente</span></td>
                        </tr>
                        <tr>
                            <td>Karen Bautista</td>
                            <td>Fidencio #30</td>
                            <td>Oriente</td>
                            <td>Jorge Ramírez Amaro</td>
                            <td><span class="status status-pendiente">Pendiente</span></td>
                        </tr>
                    </tbody>
                </table>

                <button class="action-button add-pedido-btn" onclick="location.href = 'agregarPedido.jsp'">
                    <i class="fas fa-plus"></i> Registrar Nuevo Pedido
                </button>
            </div>
            <jsp:include page="/jsp/footer.jsp"/>   

        </div>

        <script>
            // Función para redireccionar a tablaRegistro.jsp con parámetro
            function redirectToTabla(tipo) {
                window.location.href = 'tablaRegistro.jsp?filtro=' + tipo;
            }

            // Funcionalidad del botón de agregar pedido
            document.querySelector('.add-pedido-btn').addEventListener('click', function () {
                // Redirección ya está en el onclick del botón
            });

            // Efecto hover para las tarjetas
            document.querySelectorAll('.stat-card').forEach(card => {
                card.style.cursor = 'pointer';
            });

        </script>

    </body>
</html>