package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Tarjeta")
public class Tarjeta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String numero;
    private LocalDate vencimiento;
    private String titular;
    private Integer cvv;

    public Tarjeta() {
    }

    public Tarjeta(String numero, LocalDate vencimiento, String titular, Integer cvv) {
        this.numero = numero;
        this.vencimiento = vencimiento;
        this.titular = titular;
        this.cvv = cvv;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public LocalDate getVencimiento() {
        return vencimiento;
    }

    public void setVencimiento(LocalDate fVencimineto) {
        this.vencimiento = fVencimineto;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public Integer getCvv() {
        return cvv;
    }

    public void setCvv(Integer cvv) {
        this.cvv = cvv;
    }

    public void validar(){
        if(!this.vencimiento.isAfter(LocalDate.now())) throw new IllegalArgumentException("Tarjeta Vencida");
    }
}