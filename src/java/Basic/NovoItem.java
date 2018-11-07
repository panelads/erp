/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Basic;

/**
 *
 * @author jjeti
 */
public class NovoItem {
    private String nome, marca, descricao;
    private Double preco;
    private int qtde, qtdeMin, qtdeMax, tipo, localFisico;

    public NovoItem() {
    }
    
    public NovoItem(String nome, String marca, String descricao, Double preco, int qtde, int qtdeMin, int qtdeMax, int tipo, int localFisico) {
        this.nome = nome;
        this.marca = marca;
        this.descricao = descricao;
        this.preco = preco;
        this.qtde = qtde;
        this.qtdeMin = qtdeMin;
        this.qtdeMax = qtdeMax;
        this.tipo = tipo;
        this.localFisico = localFisico;
    }
    
    
    
    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the marca
     */
    public String getMarca() {
        return marca;
    }

    /**
     * @param marca the marca to set
     */
    public void setMarca(String marca) {
        this.marca = marca;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the preco
     */
    public Double getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(Double preco) {
        this.preco = preco;
    }

    /**
     * @return the qtde
     */
    public int getQtde() {
        return qtde;
    }

    /**
     * @param qtde the qtde to set
     */
    public void setQtde(int qtde) {
        this.qtde = qtde;
    }

    /**
     * @return the qtdeMin
     */
    public int getQtdeMin() {
        return qtdeMin;
    }

    /**
     * @param qtdeMin the qtdeMin to set
     */
    public void setQtdeMin(int qtdeMin) {
        this.qtdeMin = qtdeMin;
    }

    /**
     * @return the qtdeMax
     */
    public int getQtdeMax() {
        return qtdeMax;
    }

    /**
     * @param qtdeMax the qtdeMax to set
     */
    public void setQtdeMax(int qtdeMax) {
        this.qtdeMax = qtdeMax;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the localFisico
     */
    public int getLocalFisico() {
        return localFisico;
    }

    /**
     * @param localFisico the localFisico to set
     */
    public void setLocalFisico(int localFisico) {
        this.localFisico = localFisico;
    }
    
    
}
