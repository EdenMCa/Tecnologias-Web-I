<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Registro de Pedidos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tablaRegistro.css">
</head>
<body>
    <%@ include file="nav.jsp" %>
    
    <div class="registro-pedidos-container">
        <div class="pedido-header">
            <h1><i class="fas fa-shipping-fast"></i> Registro de Pedidos</h1>
            <p>Sistema de seguimiento y gestión de pedidos</p>
        </div>
        
        <div class="controls">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Buscar pedido, cliente, repartidor...">
            </div>
            
            <div class="filters">
                <div class="filter-btn active" data-filter="all">
                    <i class="fas fa-list"></i> Todos
                </div>
                <div class="filter-btn" data-filter="proceso">
                    <i class="fas fa-clock"></i> En proceso
                </div>
                <div class="filter-btn" data-filter="finalizado">
                    <i class="fas fa-check-circle"></i> Finalizados
                </div>
                <div class="filter-btn" data-filter="pendiente">
                    <i class="fas fa-exclamation-circle"></i> Pendientes
                </div>
            </div>
        </div>
        
        <div class="pedidos-container">
            <table class="pedidos-table">
                <thead>
                    <tr>
                        <th>Cliente</th>
                        <th>Dirección</th>
                        <th>Localidad</th>
                        <th>Motomandado</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr data-status="pendiente">
                        <td>Eden Mendoza</td>
                        <td>Priv. Cuahuremoc #12</td>
                        <td>Centro</td>
                        <td>Jorge Ramírez Amaro</td>
                        <td><span class="status status-pendiente">Pendiente</span></td>
                        <td>
                            <button class="action-btn view-btn" data-id="1"><i class="fas fa-eye"></i></button>
                            <button class="action-btn"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                    <tr data-status="pendiente">
                        <td>Hazel Ramírez</td>
                        <td>Cuahuremoc #13</td>
                        <td>Norte</td>
                        <td>Jorge Ramírez Amaro</td>
                        <td><span class="status status-pendiente">Pendiente</span></td>
                        <td>
                            <button class="action-btn view-btn" data-id="2"><i class="fas fa-eye"></i></button>
                            <button class="action-btn"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                    <tr data-status="pendiente">
                        <td>Christian Martínez</td>
                        <td>Hernandez #25</td>
                        <td>Sur</td>
                        <td>Jorge Ramírez Amaro</td>
                        <td><span class="status status-pendiente">Pendiente</span></td>
                        <td>
                            <button class="action-btn view-btn" data-id="3"><i class="fas fa-eye"></i></button>
                            <button class="action-btn"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                    <tr data-status="pendiente">
                        <td>Karen Bautista</td>
                        <td>Fidencio #30</td>
                        <td>Oriente</td>
                        <td>Jorge Ramírez Amaro</td>
                        <td><span class="status status-pendiente">Pendiente</span></td>
                        <td>
                            <button class="action-btn view-btn" data-id="4"><i class="fas fa-eye"></i></button>
                            <button class="action-btn"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                    <tr data-status="proceso">
                        <td>Laura García</td>
                        <td>Calle Flores #45</td>
                        <td>Centro</td>
                        <td>Miguel Hernández</td>
                        <td><span class="status status-proceso">En proceso</span></td>
                        <td>
                            <button class="action-btn view-btn" data-id="5"><i class="fas fa-eye"></i></button>
                            <button class="action-btn"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                    <tr data-status="finalizado">
                        <td>Roberto Sánchez</td>
                        <td>Privada Sol #55</td>
                        <td>Oriente</td>
                        <td>Ana Rodríguez</td>
                        <td><span class="status status-finalizado">Finalizado</span></td>
                        <td>
                            <button class="action-btn view-btn" data-id="6"><i class="fas fa-eye"></i></button>
                            <button class="action-btn"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="pagination">
            <button class="active">1</button>
            <button>2</button>
            <button>3</button>
            <button><i class="fas fa-chevron-right"></i></button>
        </div>
        
        <button class="add-btn">
            <i class="fas fa-plus"></i>
        </button>
    </div>
    
    <!-- Modal para visualizar detalles del pedido -->
    <div class="modal" id="pedidoModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2><i class="fas fa-file-alt"></i> Detalles del Pedido</h2>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-columns">
                    <div class="form-column">
                        <div class="form-section">
                            <h3>Datos del Cliente</h3>
                            <div class="form-group">
                                <label>Nombre completo</label>
                                <div class="value" id="modal-cliente">Eden Mendoza</div>
                            </div>
                            <div class="form-group">
                                <label>Teléfono de contacto</label>
                                <div class="value" id="modal-telefono">951 112 9825</div>
                            </div>
                            <div class="form-group">
                                <label>Dirección de entrega</label>
                                <div class="value" id="modal-direccion">Priv. Cuahuremoc #12</div>
                            </div>
                            <div class="form-group">
                                <label>Comunidad de entrega</label>
                                <div class="value" id="modal-comunidad">Centro</div>
                            </div>
                            <div class="form-group">
                                <label>Método de pago</label>
                                <div class="value" id="modal-pago">Efectivo</div>
                            </div>
                        </div>
                    </div>

                    <div class="form-column">
                        <div class="form-section">
                            <h3>Datos del Pedido</h3>
                            <div class="form-group">
                                <label>Tipo de pedido</label>
                                <div class="value" id="modal-tipo">Abarrotes. Verdura</div>
                            </div>
                            <div class="form-group">
                                <label>Tiempo estimado de entrega</label>
                                <div class="value" id="modal-tiempo">30 minutos</div>
                            </div>
                            <div class="form-group">
                                <label>Operador asignado</label>
                                <div class="value" id="modal-operador">Karen Fernanda Bautista</div>
                            </div>
                            <div class="form-group">
                                <label>Repartidor</label>
                                <div class="value" id="modal-repartidor">Jorge Ramírez Amaro</div>
                            </div>
                            <div class="form-group">
                                <label>Descripción del pedido</label>
                                <div class="value" id="modal-descripcion">1 Kg de tomate
2 Kg de carne para tacos</div>
                            </div>
                            <div class="form-group">
                                <label>Total</label>
                                <div class="value" id="modal-total">115.50 pesos</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn" id="print-btn"><i class="fas fa-print"></i> Imprimir</button>
                <button class="modal-btn close-modal">Cerrar</button>
            </div>
        </div>
    </div>
    
    <%@include file="footer.jsp" %>
    
    <script src="../js/tablaRegistro.js"></script>
</body>
</html>
