package calculadoNotas;

public class Aluno {
	 private String nome;
	 private String dataNasc;
	 private String nomePai;
	 private String nomeMae;
	 private String serieMatriculada;
	 private Double nota1;
	 private Double nota2;
	 private Double nota3;
	 private Double nota4;
	 
	 
	 
	 public Aluno() {
		super();
		
	}
	public void setNome(String nome) {
		 this.nome = nome;
	 }
	 public String getNome() {
		 return nome;
	 }
	public String getDataNasc() {
		return dataNasc;
	}
	public void setDataNasc(String dataNasc) {
		this.dataNasc = dataNasc;
	}
	public String getNomePai() {
		return nomePai;
	}
	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}
	public String getNomeMae() {
		return nomeMae;
	}
	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}
	public String getSerieMatriculada() {
		return serieMatriculada;
	}
	public void setSerieMatriculada(String serieMatriculada) {
		this.serieMatriculada = serieMatriculada;
	}
	public Double getNota1() {
		return nota1;
	}
	public void setNota1(Double nota1) {
		this.nota1 = nota1;
	}
	public Double getNota2() {
		return nota2;
	}
	public void setNota2(Double nota2) {
		this.nota2 = nota2;
	}
	public Double getNota3() {
		return nota3;
	}
	public void setNota3(Double nota3) {
		this.nota3 = nota3;
	}
	public Double getNota4() {
		return nota4;
	}
	public void setNota4(Double nota4) {
		this.nota4 = nota4;
	}
	
	public static void name() {
		
	}
	
	public Double CalcularMedia() {
		return (nota1+nota2+nota3+nota4)/4;
	}
	 

}

