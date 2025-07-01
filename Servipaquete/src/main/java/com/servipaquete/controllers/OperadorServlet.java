// src/main/java/com/servipaquete/controllers/OperadorServlet.java
package com.servipaquete.controllers;

import com.servipaquete.beans.Operador;
import com.servipaquete.dao.OperadorDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/OperadorServlet")
public class OperadorServlet extends HttpServlet {
    private OperadorDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new OperadorDAO();
    }

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    List<Operador> lista = dao.listar();
    
    System.out.println("🧪 Lista desde DAO: ");
    for (Operador op : lista) {
        System.out.println(op.getId() + " - " + op.getNombreCompleto());
    }

    req.setAttribute("listaOperadores", lista);
    req.getRequestDispatcher("/jsp/gestionOperadores.jsp").forward(req, resp);
}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr    = req.getParameter("id");
        String nombre   = req.getParameter("nombre");
        String telefono = req.getParameter("telefono");
        String estado   = req.getParameter("estado");
        String accion   = req.getParameter("accion"); // "insertar", "actualizar" o "eliminar"

        if ("eliminar".equals(accion)) {
            dao.eliminar(Integer.parseInt(idStr));
        } else {
            Operador o = new Operador();
            o.setNombreCompleto(nombre);
            o.setTelefono(telefono);
            o.setEstado(estado);
            if ("actualizar".equals(accion)) {
                o.setId(Integer.parseInt(idStr));
                dao.actualizar(o);
            } else {
                dao.insertar(o);
            }
        }

        // recarga la lista
        resp.sendRedirect(req.getContextPath() + "/OperadorServlet");
    }
}
