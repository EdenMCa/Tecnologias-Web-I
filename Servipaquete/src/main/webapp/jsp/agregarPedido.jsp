<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Agregar Pedido - ServiPaquete Ixtlán</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/agregarPedido.css" />
</head>
<body>
    <%@ include file="nav.jsp" %>

    <div class="agregar-pedido-container">
        <h1>Revisión y asignación del pedido</h1>

        <c:if test="${not empty error}">
            <div class="error-msg" style="color:red; font-weight:bold; margin-bottom:15px;">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/PedidoServlet" method="post" class="pedido-form-container">
            <!-- No necesitas input hidden action, porque solo tienes un POST que registra -->

            <div class="form-column">
                <div class="form-section">
                    <h2>Datos del cliente</h2>
                    <div class="form-group">
                        <label for="nombre_completo">Nombre completo</label>
                        <input type="text" id="nombre_completo" name="nombre_completo" class="form-input" required />
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono de contacto</label>
                        <input type="tel" id="telefono" name="telefono" class="form-input" required />
                    </div>
                    <div class="form-group">
                        <label for="direccion_entrega">Dirección de entrega</label>
                        <input type="text" id="direccion_entrega" name="direccion_entrega" class="form-input" required />
                    </div>
                    <div class="form-group">
                        <label for="comunidad_entrega">Comunidad de entrega</label>
                        <input type="text" id="comunidad_entrega" name="comunidad_entrega" class="form-input" required />
                    </div>
                    <div class="form-group">
                        <label for="metodo_pago">Método de pago</label>
                        <select id="metodo_pago" name="metodo_pago" class="form-input" required>
                            <option value="">-- Selecciona --</option>
                            <option value="Efectivo">Efectivo</option>
                            <option value="Transferencia">Transferencia</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-column">
                <div class="form-section">
                    <h2>Datos del pedido</h2>
                    <div class="form-group">
                        <label for="tipo_pedido">Tipo de pedido</label>
                        <select id="tipo_pedido" name="tipo_pedido" class="form-input" required>
                            <option value="">-- Selecciona --</option>
                            <option value="Abarrotes. Verdura">Abarrotes. Verdura</option>
                            <option value="Mercancía General">Mercancía General</option>
                            <option value="Documentos">Documentos</option>
                            <option value="Alimentos">Alimentos</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tiempo_estimado_entrega">Tiempo estimado de entrega (minutos)</label>
                        <input type="number" id="tiempo_estimado_entrega" name="tiempo_estimado_entrega" class="form-input" min="0" required />
                    </div>
                    <div class="form-group">
                        <label for="operador_asignado_id">Operador asignado</label>
                        <select id="operador_asignado_id" name="operador_asignado_id" class="form-input" required>
                            <option value="">-- Selecciona --</option>
                            <c:forEach var="op" items="${listaOperadores}">
                                <option value="${op.id}">${op.nombreCompleto}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="motomandado_asignado_id">Repartidor</label>
                        <select id="motomandado_asignado_id" name="motomandado_asignado_id" class="form-input" required>
                            <option value="">-- Selecciona --</option>
                            <c:forEach var="m" items="${listaMotomandados}">
                                <option value="${m.id}">${m.nombreCompleto}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="descripcion_pedido">Descripción del pedido</label>
                        <textarea id="descripcion_pedido" name="descripcion_pedido" class="form-input" rows="6" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="total">Total</label>
                        <input type="number" step="0.01" id="total" name="total" class="form-input" required />
                    </div>
                </div>
            </div>

            <div class="form-buttons">
                <button type="button" class="btn btn-cancelar">Cancelar</button>
                <button type="submit" class="btn btn-confirmar">Confirmar y generar recibo</button>
            </div>
        </form>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        document.querySelector('.btn-cancelar').addEventListener('click', function () {
            if (confirm('¿Está seguro que desea cancelar?')) {
                window.location.href = '${pageContext.request.contextPath}/dashboard.jsp';
            }
        });
    </script>
</body>
</html>
