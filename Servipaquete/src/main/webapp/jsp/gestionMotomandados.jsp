<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.servipaquete.beans.Motomandado" %>
<%@ page import="java.util.List" %>
<%
    if (request.getAttribute("listaMotomandados") == null) {
        response.sendRedirect(request.getContextPath() + "/MotomandadoServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Motomandados</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gestionMotomandados.css">
</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="registro-pedidos-container">
        <div class="pedido-header">
            <h1><i class="fas fa-motorcycle"></i> Gestión de Motomandados</h1>
            <p>Lista de repartidores disponibles para pedidos</p>
        </div>

        <div class="tabla-header">
            <button class="modal-btn" id="btnAgregarMotomandado">
                <i class="fas fa-plus"></i> Agregar Motomandado
            </button>
        </div>

        <div class="pedidos-container">
            <table class="pedidos-table" id="tablaMotomandados">
                <thead>
                    <tr>
                        <th>Nombre completo</th>
                        <th>Teléfono</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Motomandado> lista = (List<Motomandado>) request.getAttribute("listaMotomandados");
                        for (Motomandado m : lista) {
                    %>
                    <tr>
                        <td><%= m.getNombreCompleto() %></td>
                        <td><%= m.getTelefono() %></td>
                        <td>
                            <span class="status <%= m.getEstado().equalsIgnoreCase("activo") ? "status-activo" : "status-inactivo" %>">
                                <%= m.getEstado().substring(0,1).toUpperCase() + m.getEstado().substring(1).toLowerCase() %>
                            </span>
                        </td>
                        <td>
                            <!-- Form eliminar -->
                            <form method="post" action="${pageContext.request.contextPath}/MotomandadoServlet" style="display:inline">
                                <input type="hidden" name="id" value="<%= m.getId() %>"/>
                                <input type="hidden" name="accion" value="eliminar"/>
                                <button class="action-btn delete-btn" type="submit" title="Eliminar">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>

                            <!-- Botón editar -->
                            <button 
                                class="action-btn edit-btn"
                                data-id="<%= m.getId() %>"
                                data-nombre="<%= m.getNombreCompleto() %>"
                                data-telefono="<%= m.getTelefono() %>"
                                data-estado="<%= m.getEstado().toLowerCase() %>"
                                title="Editar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal agregar/editar -->
    <div class="modal" id="motomandadoModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitulo"><i class="fas fa-user"></i> Motomandado</h2>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="formMotomandado" method="post" action="${pageContext.request.contextPath}/MotomandadoServlet">
                    <input type="hidden" name="id" id="inputId">
                    <input type="hidden" name="accion" id="inputAccion" value="insertar">
                    <div class="form-group">
                        <label for="inputNombre">Nombre completo</label>
                        <input type="text" name="nombre" id="inputNombre" required>
                    </div>
                    <div class="form-group">
                        <label for="inputTelefono">Teléfono</label>
                        <input type="tel" name="telefono" id="inputTelefono" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEstado">Estado</label>
                        <select name="estado" id="inputEstado">
                            <option value="activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="modal-btn" id="btnGuardarMotomandado" type="button">
                    <i class="fas fa-save"></i> Guardar
                </button>
                <button class="modal-btn close-modal" type="button">Cancelar</button>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script>
        // Context path para JS
        const contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="${pageContext.request.contextPath}/js/gestionMotomandados.js"></script>
</body>
</html>
