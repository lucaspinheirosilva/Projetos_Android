package calculadoNotas;


public class Main {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Aluno aluno1 = new Aluno();
			
		aluno1.setNome("Lucas Pinheiro");
		aluno1.setDataNasc("24/03/1993");
		aluno1.setNomePai("Luis Alberto");
		aluno1.setNomeMae("Marinilde Pinheiro");
		aluno1.setSerieMatriculada("5 serie");
		aluno1.setNota1(80.5);
		  aluno1.setNota2(48.0);
		aluno1.setNota3(70.5);
		aluno1.setNota4(40.9);
		
		System.out.println(aluno1.toString());
		System.out.println("Media:"+aluno1.CalcularMedia());
		System.out.println("RESULTADO: "+(aluno1.ResultadoFinal()?"APROVADO":"REPROVADO"));
	}

}
