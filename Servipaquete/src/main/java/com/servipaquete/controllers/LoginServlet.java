package com.servipaquete.controllers;

import com.servipaquete.beans.Usuario;
import com.servipaquete.dao.UsuarioDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar el formulario de login
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
        rd.forward(request, response);
    }

  @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String usernameInput = request.getParameter("username").trim().toLowerCase();
    String passwordInput = request.getParameter("password").trim();

    System.out.println("[LoginServlet] Usuario ingresado: " + usernameInput);
    System.out.println("[LoginServlet] Contraseña ingresada: " + passwordInput);

    Usuario usuario = usuarioDAO.obtenerPorUsername(usernameInput);

    if (usuario != null && usuario.getPassword() != null) {
        System.out.println("[LoginServlet] Usuario encontrado: " + usuario.getUsername());
        System.out.println("[LoginServlet] Hash almacenado: " + usuario.getPassword());

        if (BCrypt.checkpw(passwordInput, usuario.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect(request.getContextPath() + "/jsp/gestionPedido.jsp");
            return;
        } else {
            System.out.println("[LoginServlet] Contraseña incorrecta");
        }
    } else {
        System.out.println("[LoginServlet] Usuario no encontrado o password nulo");
    }

    request.setAttribute("error", "Usuario o contraseña incorrectos.");
    RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
    rd.forward(request, response);
}
}
