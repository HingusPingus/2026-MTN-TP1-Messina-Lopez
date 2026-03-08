package com.polipalozza.polipalozza.dto;

import java.time.LocalDate;

public class TarjetaDTO {
    private String numero;
    private LocalDate vencimiento;
    private String titular;
    private Integer cvv;

    public TarjetaDTO(String numero, LocalDate vencimiento, String titular, Integer cvv) {
        this.numero = numero;
        this.vencimiento = vencimiento;
        this.titular = titular;
        this.cvv = cvv;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public LocalDate getfVencimineto() {
        return vencimiento;
    }

    public void setfVencimineto(LocalDate fVencimineto) {
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
}
