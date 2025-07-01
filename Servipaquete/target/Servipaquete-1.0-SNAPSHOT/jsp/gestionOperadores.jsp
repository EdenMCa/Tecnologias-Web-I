<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.servipaquete.beans.Operador" %>
<%@ page import="java.util.List" %>
<%
    if (request.getAttribute("listaOperadores") == null) {
        response.sendRedirect(request.getContextPath() + "/OperadorServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Operadores</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gestionMotomandados.css">
    </head>
    <body>

        <jsp:include page="nav.jsp" />

        <div class="registro-pedidos-container">
            <div class="pedido-header">
                <h1><i class="fas fa-user-tie"></i> Gestión de Operadores</h1>
                <p>Lista de operadores disponibles</p>
            </div>

            <div class="tabla-header">
                <button class="modal-btn" id="btnAgregarOperador">
                    <i class="fas fa-plus"></i> Agregar Operador
                </button>
            </div>

            <div class="pedidos-container">
                <table class="pedidos-table" id="tablaOperadores">
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
                            List<Operador> lista = (List<Operador>) request.getAttribute("listaOperadores");
                            for (Operador op : lista) {
                        %>
                        <tr>
                            <td><%= op.getNombreCompleto()%></td>
                            <td><%= op.getTelefono()%></td>
                            <td>
                                  <span class="status <%=op.getEstado().equalsIgnoreCase("Activo") ? "status-activo" : "status-inactivo"%>">
                                    <%= op.getEstado()%>
                                </span>
                            </td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/OperadorServlet" style="display:inline">
                                    <input type="hidden" name="id" value="<%= op.getId()%>"/>
                                    <input type="hidden" name="accion" value="eliminar"/>
                                    <button class="action-btn delete-btn" type="submit"><i class="fas fa-trash-alt"></i></button>
                                </form>
                                <button 
                                    class="action-btn edit-btn"
                                    data-id="<%= op.getId()%>"
                                    data-nombre="<%= op.getNombreCompleto()%>"
                                    data-telefono="<%= op.getTelefono()%>"
                                    data-estado="<%= op.getEstado().toLowerCase()%>">
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

        <!-- Modal -->
        <div class="modal" id="operadorModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="modalTitulo"><i class="fas fa-user"></i> Operador</h2>
                    <button class="close-modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="formOperador">
                        <input type="hidden" id="inputId">
                        <div class="form-group">
                            <label for="inputNombre">Nombre completo</label>
                            <input type="text" id="inputNombre" class="value" required>
                        </div>
                        <div class="form-group">
                            <label for="inputTelefono">Teléfono</label>
                            <input type="tel" id="inputTelefono" class="value" required>
                        </div>
                        <div class="form-group">
                            <label for="inputEstado">Estado</label>
                            <select id="inputEstado" class="value">
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="modal-btn" id="btnGuardarOperador">
                        <i class="fas fa-save"></i> Guardar
                    </button>
                    <button class="modal-btn close-modal">Cancelar</button>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <!-- ContextPath en JavaScript -->
        <script>
            const contextPath = '${pageContext.request.contextPath}';
        </script>
        <script src="${pageContext.request.contextPath}/js/gestionOperadores.js"></script>

    </body>
</html>
