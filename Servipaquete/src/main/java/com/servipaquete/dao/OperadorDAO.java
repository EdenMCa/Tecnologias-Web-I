package com.servipaquete.dao;

import com.servipaquete.beans.Operador;
import com.servipaquete.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OperadorDAO {
    private Connection conn;

    public OperadorDAO() {
        conn = DBConnection.getConnection();
    }

    public List<Operador> listar() {
        List<Operador> lista = new ArrayList<>();
        String sql = "SELECT id_operador, nombre_completo, telefono, estado FROM operadores";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Operador o = new Operador();
                o.setId(rs.getInt("id_operador"));
                o.setNombreCompleto(rs.getString("nombre_completo"));
                o.setTelefono(rs.getString("telefono"));
                o.setEstado(rs.getString("estado").toLowerCase());
                lista.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean insertar(Operador o) {
        String sql = "INSERT INTO operadores (nombre_completo, telefono, estado) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, o.getNombreCompleto());
            ps.setString(2, o.getTelefono());
            ps.setString(3, capitalize(o.getEstado()));
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean actualizar(Operador o) {
        String sql = "UPDATE operadores SET nombre_completo=?, telefono=?, estado=? WHERE id_operador=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, o.getNombreCompleto());
            ps.setString(2, o.getTelefono());
            ps.setString(3, capitalize(o.getEstado()));
            ps.setInt(4, o.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM operadores WHERE id_operador=?";
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
