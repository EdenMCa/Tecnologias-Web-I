package com.servipaquete.controllers;

import com.servipaquete.beans.Usuario;
import com.servipaquete.dao.UsuarioDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

    public class UsuarioServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
        if (usuarioSesion == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        String mensaje = null;
        String error = null;

        if ("actualizarInfo".equals(accion)) {
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");

            if (nombre == null || nombre.trim().isEmpty() ||
                telefono == null || telefono.trim().isEmpty() ||
                correo == null || correo.trim().isEmpty()) {
                error = "Todos los campos son obligatorios para actualizar la información.";
            } else {
                usuarioSesion.setNombreCompleto(nombre.trim());
                usuarioSesion.setTelefono(telefono.trim());
                usuarioSesion.setCorreo(correo.trim());

                boolean actualizado = usuarioDAO.actualizar(usuarioSesion);
                if (actualizado) {
                    session.setAttribute("usuario", usuarioSesion);
                    mensaje = "Información personal actualizada con éxito.";
                } else {
                    error = "Error al actualizar la información personal.";
                }
            }

        } else if ("cambiarPassword".equals(accion)) {
            String actual = request.getParameter("actual");
            String nueva = request.getParameter("nueva");
            String confirmar = request.getParameter("confirmar");

            if (actual == null || nueva == null || confirmar == null ||
                actual.trim().isEmpty() || nueva.trim().isEmpty() || confirmar.trim().isEmpty()) {
                error = "Todos los campos de contraseña son obligatorios.";
            } else if (!nueva.equals(confirmar)) {
                error = "La nueva contraseña y su confirmación no coinciden.";
            } else if (!BCrypt.checkpw(actual, usuarioSesion.getPassword())) {
                error = "La contraseña actual es incorrecta.";
            } else {
                String hashed = BCrypt.hashpw(nueva, BCrypt.gensalt());
                usuarioSesion.setPassword(hashed);
                boolean actualizado = usuarioDAO.actualizar(usuarioSesion);
                if (actualizado) {
                    session.setAttribute("usuario", usuarioSesion);
                    mensaje = "Contraseña actualizada con éxito.";
                } else {
                    error = "Error al actualizar la contraseña.";
                }
            }
        } else {
            error = "Acción no válida.";
        }

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
        }
        if (error != null) {
            request.setAttribute("error", error);
        }

        request.getRequestDispatcher("/jsp/perfil.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Para evitar el error 405, implementamos doGet y redirigimos al perfil si hay sesión
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }
        request.getRequestDispatcher("/jsp/perfil.jsp").forward(request, response);
    }
}
