package com.servipaquete.beans;

import java.sql.Timestamp;

public class Pedido {
    private int id;
    private String nombreCompleto;
    private String telefono;
    private String direccionEntrega;
    private String comunidadEntrega;
    private String metodoPago;
    private String tipoPedido;
    private int tiempoEstimadoEntrega;
    private int operadorAsignadoId;
    private int motomandadoAsignadoId;
    private String descripcionPedido;
    private double total;
    private Timestamp fechaCreacion;
    private Timestamp fechaActualizacion;

    // Constructor vacío
    public Pedido() {
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccionEntrega() {
        return direccionEntrega;
    }

    public void setDireccionEntrega(String direccionEntrega) {
        this.direccionEntrega = direccionEntrega;
    }

    public String getComunidadEntrega() {
        return comunidadEntrega;
    }

    public void setComunidadEntrega(String comunidadEntrega) {
        this.comunidadEntrega = comunidadEntrega;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getTipoPedido() {
        return tipoPedido;
    }

    public void setTipoPedido(String tipoPedido) {
        this.tipoPedido = tipoPedido;
    }

    public int getTiempoEstimadoEntrega() {
        return tiempoEstimadoEntrega;
    }

    public void setTiempoEstimadoEntrega(int tiempoEstimadoEntrega) {
        this.tiempoEstimadoEntrega = tiempoEstimadoEntrega;
    }

    public int getOperadorAsignadoId() {
        return operadorAsignadoId;
    }

    public void setOperadorAsignadoId(int operadorAsignadoId) {
        this.operadorAsignadoId = operadorAsignadoId;
    }

    public int getMotomandadoAsignadoId() {
        return motomandadoAsignadoId;
    }

    public void setMotomandadoAsignadoId(int motomandadoAsignadoId) {
        this.motomandadoAsignadoId = motomandadoAsignadoId;
    }

    public String getDescripcionPedido() {
        return descripcionPedido;
    }

    public void setDescripcionPedido(String descripcionPedido) {
        this.descripcionPedido = descripcionPedido;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Timestamp getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(Timestamp fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }
}
