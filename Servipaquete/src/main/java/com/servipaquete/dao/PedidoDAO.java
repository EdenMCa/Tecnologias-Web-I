package com.servipaquete.dao;

import com.servipaquete.beans.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PedidoDAO {
    private Connection con;

    public PedidoDAO(Connection con) {
        this.con = con;
    }

    // Insertar un nuevo pedido
    public boolean insertar(Pedido pedido) {
        String sql = "INSERT INTO pedidos (nombre_completo, telefono, direccion_entrega, comunidad_entrega, metodo_pago, tipo_pedido, tiempo_estimado_entrega, operador_asignado_id, motomandado_asignado_id, descripcion_pedido, total) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, pedido.getNombreCompleto());
            ps.setString(2, pedido.getTelefono());
            ps.setString(3, pedido.getDireccionEntrega());
            ps.setString(4, pedido.getComunidadEntrega());
            ps.setString(5, pedido.getMetodoPago());
            ps.setString(6, pedido.getTipoPedido());
            ps.setInt(7, pedido.getTiempoEstimadoEntrega());
            ps.setInt(8, pedido.getOperadorAsignadoId());
            ps.setInt(9, pedido.getMotomandadoAsignadoId());
            ps.setString(10, pedido.getDescripcionPedido());
            ps.setDouble(11, pedido.getTotal());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
