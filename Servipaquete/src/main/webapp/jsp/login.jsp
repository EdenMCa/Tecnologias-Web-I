<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Operadores - ServiPaquete Ixtlán</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <div class="login-container">
            <i class="fas fa-motorcycle moto-icon"></i>
            <i class="fas fa-box-open package-icon"></i>

            <div class="logo-container">
                <div class="logo">
                    <div class="logo-icon">
                        <i class="fas fa-box"></i>
                    </div>
                    <div class="logo-text">ServiPaquete</div>
                </div>
                <div class="system-name">Ixtlán de Juarez</div>
            </div>

            <div class="panel-title">Panel de Operadores</div>

            <form action="${pageContext.request.contextPath}/LoginServlet" method="POST" class="login-form">
                <div class="form-group">
                    <label for="username"><i class="fas fa-user"></i> Usuario</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Ingrese su usuario" required>
                </div>

                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Contraseña</label>
                    <div class="password-container">
                        <input type="password" id="password" name="password" class="form-control" placeholder="Ingrese su contraseña" required>
                        <span class="toggle-password" id="togglePassword"><i class="fas fa-eye"></i></span>
                    </div>
                </div>

                <% if (request.getAttribute("error") != null) {%>
                <p style="color:red; text-align: center;"><%= request.getAttribute("error")%></p>
                <% }%>

                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                </button>
            </form>


            <div class="footer">
                <p>© 2023 ServiPaquete Ixtlán </p>
                <p><a href="#"><i class="fas fa-headset"></i>servipaquete@gmail.com</a></p>
            </div>
        </div>

        <script>
            document.getElementById('togglePassword').addEventListener('click', function () {
                const passwordInput = document.getElementById('password');
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
            });

            // Add focus effect
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', () => {
                    input.parentElement.classList.add('focused');
                });

                input.addEventListener('blur', () => {
                    input.parentElement.classList.remove('focused');
                });
            });
        </script>
    </body>
</html>