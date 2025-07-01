package com.servipaquete.controllers;

import com.servipaquete.beans.Motomandado;
import com.servipaquete.dao.MotomandadoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class MotomandadoServlet extends HttpServlet {
    private MotomandadoDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new MotomandadoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Motomandado> lista = dao.listar();
        req.setAttribute("listaMotomandados", lista);
        req.getRequestDispatcher("/jsp/gestionMotomandados.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        String telefono = req.getParameter("telefono");
        String estado = req.getParameter("estado");
        String accion = req.getParameter("accion"); // insertar, actualizar, eliminar

        if ("eliminar".equalsIgnoreCase(accion)) {
            if (idStr != null && !idStr.isEmpty()) {
                dao.eliminar(Integer.parseInt(idStr));
            }
        } else {
            Motomandado m = new Motomandado();
            m.setNombreCompleto(nombre);
            m.setTelefono(telefono);
            m.setEstado(estado);

            if ("actualizar".equalsIgnoreCase(accion)) {
                if (idStr != null && !idStr.isEmpty()) {
                    m.setId(Integer.parseInt(idStr));
                    dao.actualizar(m);
                }
            } else if ("insertar".equalsIgnoreCase(accion)) {
                dao.insertar(m);
            }
        }

        // Redirigir para refrescar la lista
        resp.sendRedirect(req.getContextPath() + "/MotomandadoServlet");
    }
}
