<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nav ServiPaquete Ixtlán</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css" />
</head>
<body>
<nav class="servipaquete-navbar">
    <div class="nav-container">
        <a href="${pageContext.request.contextPath}/jsp/gestionPedido.jsp" class="nav-brand">
            <div class="nav-logo">
                <i class="fas fa-box"></i>
            </div>
            <span class="nav-app-name">ServiPaquete Ixtlán</span>
        </a>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/MotomandadoServlet" class="nav-link">
                <i class="fas fa-motorcycle"></i>
                <span>Motomandados</span>
            </a>
            <a href="${pageContext.request.contextPath}/OperadorServlet" class="nav-link">
                <i class="fas fa-users-cog"></i>
                <span>Operadores</span>
            </a>
        </div>

        <div class="nav-profile">
            <div class="profile-avatar">
                <c:choose>
                    <c:when test="${not empty sessionScope.usuario.nombreCompleto}">
                        ${fn:toUpperCase(fn:substring(sessionScope.usuario.nombreCompleto, 0, 2))}
                    </c:when>
                    <c:otherwise>??</c:otherwise>
                </c:choose>
            </div>
            <div class="profile-info">
                <span class="profile-name">${sessionScope.usuario.nombreCompleto}</span>
                <span class="profile-role">Operador</span>
            </div>
            <div class="profile-dropdown">
                <a href="${pageContext.request.contextPath}/UsuarioServlet">
                    <i class="fas fa-user"></i>
                    <span>Ver mi perfil</span>
                </a>
                <a href="${pageContext.request.contextPath}/UsuariosServlet">
                    <i class="fas fa-users"></i>
                    <span>Gestión de usuarios</span>
                </a>
                <a href="${pageContext.request.contextPath}/LogoutServlet">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>

        <button class="nav-toggle">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>

<script>
    // Toggle del menú móvil
    document.querySelector('.nav-toggle').addEventListener('click', function () {
        document.querySelector('.nav-links').classList.toggle('active');
    });

    // Cerrar menú al hacer clic fuera de él
    document.addEventListener('click', function (event) {
        const navLinks = document.querySelector('.nav-links');
        const navToggle = document.querySelector('.nav-toggle');

        if (navLinks.classList.contains('active') &&
            !navLinks.contains(event.target) &&
            !navToggle.contains(event.target)) {
            navLinks.classList.remove('active');
        }
    });
</script>
</body>
</html>
