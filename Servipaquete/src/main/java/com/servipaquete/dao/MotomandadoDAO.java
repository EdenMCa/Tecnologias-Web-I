package com.servipaquete.dao;

import com.servipaquete.beans.Motomandado;
import com.servipaquete.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MotomandadoDAO {
    private Connection conn;

    public MotomandadoDAO() {
        conn = DBConnection.getConnection();
    }

    public List<Motomandado> listar() {
        List<Motomandado> lista = new ArrayList<>();
        String sql = "SELECT id_motomandado, nombre_completo, telefono, estado FROM motomandados";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Motomandado m = new Motomandado();
                m.setId(rs.getInt("id_motomandado"));
                m.setNombreCompleto(rs.getString("nombre_completo"));
                m.setTelefono(rs.getString("telefono"));
                m.setEstado(rs.getString("estado").toLowerCase());
                lista.add(m);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public boolean insertar(Motomandado m) {
        String sql = "INSERT INTO motomandados (nombre_completo, telefono, estado) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getNombreCompleto());
            ps.setString(2, m.getTelefono());
            ps.setString(3, capitalize(m.getEstado()));
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean actualizar(Motomandado m) {
        String sql = "UPDATE motomandados SET nombre_completo=?, telefono=?, estado=? WHERE id_motomandado=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getNombreCompleto());
            ps.setString(2, m.getTelefono());
            ps.setString(3, capitalize(m.getEstado()));
            ps.setInt(4, m.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM motomandados WHERE id_motomandado=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private String capitalize(String s) {
        if (s == null || s.isEmpty()) return s;
        return Character.toUpperCase(s.charAt(0)) + s.substring(1).toLowerCase();
    }
}
