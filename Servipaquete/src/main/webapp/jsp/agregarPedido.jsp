<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Pedido - ServiPaquete Ixtlán</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/agregarPedido.css">
    </head>
    <body>
        <%@include file="nav.jsp" %>

        <div class="agregar-pedido-container">
            <div class="pedido-header">
                <h1>Revisión y asignación del pedido</h1>
            </div>

            <form class="pedido-form-container">
                <div class="form-column">
                    <div class="form-section">
                        <h2>Datos del cliente</h2>
                        <div class="form-group">
                            <label>Nombre completo</label>
                            <input type="text" class="form-input" value="Edén Mendoza">
                        </div>
                        <div class="form-group">
                            <label>Teléfono de contacto</label>
                            <input type="tel" class="form-input" value="951 112 9825">
                        </div>
                        <div class="form-group">
                            <label>Dirección de entrega</label>
                            <input type="text" class="form-input" value="Priv. Cuainutemoc S/N">
                        </div>
                        <div class="form-group">
                            <label>Comunidad de entrega</label>
                            <input type="text" class="form-input" value="Ixtlan de Juarez">
                        </div>
                        <div class="form-group">
                            <label>Metodo de pago</label>
                            <select class="form-input">
                                <option>Efectivo</option>
                                <option>Transferencia</option>
                            </select>
                        </div>

                    </div>
                </div>

                <div class="form-column">
                    <div class="form-section">
                        <h2>Datos del pedido</h2>
                        <div class="form-group">
                            <label>Tipo de pedido</label>
                            <select class="form-input">
                                <option>Abarrotes. Verdura</option>
                                <option>Mercancía General</option>
                                <option>Documentos</option>
                                <option>Alimentos</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Tiempo estimado de entrega (minutos)</label>
                            <input type="number" class="form-input" value="30" min="0">
                        </div>
                        <div class="form-group">
                            <label>Operador asignado</label>
                            <select class="form-input">
                                <option>Karen Fernanda Bautista</option>
                                <option>Jorge Ramírez</option>
                                <option>Luis Hernández</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Repartidor</label>
                            <select class="form-input">
                                <option>Jorge Ramírez Amaro</option>
                                <option>Carlos Mendoza</option>
                                <option>Ana Sánchez</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Descripción del pedido</label>
                            <textarea class="form-input" rows="10">1 Kg de tomate&#10;2 Kg de carne para tacos</textarea>
                        </div>
                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" class="form-input" value="115.5 pesos">
                        </div>
                    </div>
                </div>

                <div class="form-buttons">
                    <button type="button" class="btn btn-cancelar">Cancelar</button>
                    <button type="submit" class="btn btn-confirmar">Confirmar y generar recibo</button>
                </div>
            </form>
        </div>

        <%@include file="footer.jsp" %>

        <script>
            // Botón cancelar
            document.querySelector('.btn-cancelar').addEventListener('click', function () {
                if (confirm('¿Está seguro que desea cancelar?')) {
                    window.location.href = 'dashboard.jsp';
                }
            });

            // Formulario submit
            document.querySelector('form').addEventListener('submit', function (e) {
                e.preventDefault();
                alert('Pedido confirmado con éxito. Generando recibo...');
                // Aquí iría la lógica para generar el recibo
            });
        </script>
    </body>
</html>