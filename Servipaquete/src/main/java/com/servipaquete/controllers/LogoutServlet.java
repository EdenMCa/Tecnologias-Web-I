package com.servipaquete.controllers;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener la sesión actual (si existe)
        HttpSession session = request.getSession(false); // false para no crear una nueva si no hay
        
        if (session != null) {
            session.invalidate();  // Destruir la sesión, elimina atributos y finaliza sesión
        }
        
        // Redirigir a la página de login o inicio
        response.sendRedirect("jsp/login.jsp");
    }
}
