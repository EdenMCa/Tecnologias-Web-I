package com.servipaquete.controllers;

import com.servipaquete.beans.Motomandado;
import com.servipaquete.beans.Operador;
import com.servipaquete.beans.Pedido;
import com.servipaquete.dao.MotomandadoDAO;
import com.servipaquete.dao.OperadorDAO;
import com.servipaquete.dao.PedidoDAO;
import com.servipaquete.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class PedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OperadorDAO operadorDAO = new OperadorDAO();
        MotomandadoDAO motomandadoDAO = new MotomandadoDAO();

        List<Operador> operadores = operadorDAO.listar();
        List<Motomandado> motomandados = motomandadoDAO.listar();

        req.setAttribute("listaOperadores", operadores);
        req.setAttribute("listaMotomandados", motomandados);

        // Mostrar JSP con formulario
        req.getRequestDispatcher("/jsp/agregarPedido.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Recoger datos del formulario
        String nombreCompleto = req.getParameter("nombre_completo");
        String telefono = req.getParameter("telefono");
        String direccionEntrega = req.getParameter("direccion_entrega");
        String comunidadEntrega = req.getParameter("comunidad_entrega");
        String metodoPago = req.getParameter("metodo_pago");
        String tipoPedido = req.getParameter("tipo_pedido");
        int tiempoEstimadoEntrega = Integer.parseInt(req.getParameter("tiempo_estimado_entrega"));
        int operadorAsignadoId = Integer.parseInt(req.getParameter("operador_asignado_id"));
        int motomandadoAsignadoId = Integer.parseInt(req.getParameter("motomandado_asignado_id"));
        String descripcionPedido = req.getParameter("descripcion_pedido");
        double total = Double.parseDouble(req.getParameter("total"));

        Pedido pedido = new Pedido();
        pedido.setNombreCompleto(nombreCompleto);
        pedido.setTelefono(telefono);
        pedido.setDireccionEntrega(direccionEntrega);
        pedido.setComunidadEntrega(comunidadEntrega);
        pedido.setMetodoPago(metodoPago);
        pedido.setTipoPedido(tipoPedido);
        pedido.setTiempoEstimadoEntrega(tiempoEstimadoEntrega);
        pedido.setOperadorAsignadoId(operadorAsignadoId);
        pedido.setMotomandadoAsignadoId(motomandadoAsignadoId);
        pedido.setDescripcionPedido(descripcionPedido);
        pedido.setTotal(total);

        try (Connection con = DBConnection.getConnection()) {
            PedidoDAO pedidoDAO = new PedidoDAO(con);
            boolean insertado = pedidoDAO.insertar(pedido);
            if (insertado) {
                // Redirigir a página de éxito o lista (ajusta según tu proyecto)
                resp.sendRedirect(req.getContextPath() + "/listaPedidos.jsp");
                return;
            } else {
                req.setAttribute("error", "Error al guardar el pedido");
            }
        } catch (Exception e) {
            throw new ServletException("Error al insertar pedido", e);
        }

        // Si falla, recarga operadores y motomandados para mostrar formulario con error
        OperadorDAO operadorDAO = new OperadorDAO();
        MotomandadoDAO motomandadoDAO = new MotomandadoDAO();

        List<Operador> operadores = operadorDAO.listar();
        List<Motomandado> motomandados = motomandadoDAO.listar();

        req.setAttribute("listaOperadores", operadores);
        req.setAttribute("listaMotomandados", motomandados);

        req.getRequestDispatcher("/jsp/agregarPedido.jsp").forward(req, resp);
    }
}
