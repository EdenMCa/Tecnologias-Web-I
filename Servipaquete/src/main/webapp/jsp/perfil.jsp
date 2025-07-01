<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty sessionScope.usuario}">
    <c:redirect url="${pageContext.request.contextPath}/jsp/login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Mi Perfil</title>
    <link rel="stylesheet" href="../css/nav.css" />
    <link rel="stylesheet" href="../css/registroPedidos.css" />
    <link rel="stylesheet" href="../css/perfil.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
    <%@ include file="nav.jsp" %>
    <div style="height: 80px;"></div>

    <div class="container py-4">
        <h1><i class="fas fa-user-circle"></i> Mi Perfil</h1>
        <p>Gestiona tus datos y configuraciones</p>

        <!-- Mensajes -->
        <c:if test="${not empty requestScope.mensaje}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${requestScope.mensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${requestScope.error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Información Personal -->
        <div class="card mb-4 perfil-card">
            <div class="card-header"><i class="fas fa-user"></i> Información Personal</div>
            <div class="card-body">
                <form method="post" action="${pageContext.request.contextPath}/UsuarioServlet" id="formInfo">
                    <input type="hidden" name="accion" value="actualizarInfo" />
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre completo</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" required value="${sessionScope.usuario.nombreCompleto}" />
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="tel" id="telefono" name="telefono" class="form-control" required value="${sessionScope.usuario.telefono}" />
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo electrónico</label>
                        <input type="email" id="correo" name="correo" class="form-control" required value="${sessionScope.usuario.correo}" />
                    </div>
                    <div class="mb-3">
                        <label for="rol" class="form-label">Rol</label>
                        <input type="text" id="rol" class="form-control" disabled value="Operador" />
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Guardar Información</button>
                </form>
            </div>
        </div>

        <!-- Configuración de Contraseña -->
        <div class="card perfil-card">
            <div class="card-header"><i class="fas fa-key"></i> Configuración de contraseña</div>
            <div class="card-body">
                <form method="post" action="${pageContext.request.contextPath}/UsuarioServlet" id="formPassword" novalidate>
                    <input type="hidden" name="accion" value="cambiarPassword" />
                    <div class="mb-3">
                        <label for="actual" class="form-label">Contraseña actual</label>
                        <input type="password" id="actual" name="actual" class="form-control" placeholder="Contraseña actual" required />
                    </div>
                    <div class="mb-3">
                        <label for="nueva" class="form-label">Nueva contraseña</label>
                        <input type="password" id="nueva" name="nueva" class="form-control" placeholder="Nueva contraseña" required />
                    </div>
                    <div class="mb-3">
                        <label for="confirmar" class="form-label">Confirmar contraseña</label>
                        <input type="password" id="confirmar" name="confirmar" class="form-control" placeholder="Confirmar contraseña" required />
                    </div>
                    <button type="submit" class="btn btn-success"><i class="fas fa-check"></i> Cambiar contraseña</button>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const formPass = document.getElementById('formPassword');
            formPass.addEventListener('submit', e => {
                const nueva = document.getElementById('nueva').value.trim();
                const confirmar = document.getElementById('confirmar').value.trim();
                if (nueva !== confirmar) {
                    e.preventDefault();
                    alert('La nueva contraseña y su confirmación no coinciden.');
                }
            });
        });
    </script>
</body>
</html>
