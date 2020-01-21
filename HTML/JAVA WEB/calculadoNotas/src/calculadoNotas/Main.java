package calculadoNotas;

public class Main {
	public static void main(String[] args) {
		Aluno aluno1 = new Aluno();

			
		aluno1.setNome("Lucas Pinheiro");
		aluno1.setDataNasc("24/03/1993");
		aluno1.setNomePai("Luis Alberto");
		aluno1.setNomeMae("Marinilde Pinheiro");
		aluno1.setSerieMatriculada("5 serie");
		aluno1.setNota1(95.5);
		aluno1.setNota2(55.0);
		aluno1.setNota3(70.5);
		aluno1.setNota4(40.9);
		
		System.out.println("Nome:"+aluno1.getNome());
		System.out.println("NASC.:"+aluno1.getDataNasc());
		System.out.println("Pai:"+aluno1.getNomePai());
		System.out.println("Mãe:"+aluno1.getNomeMae());
		System.out.println("Série:"+aluno1.getSerieMatriculada());
		System.out.println("MEDIA:"+aluno1.CalcularMedia());
	}

}
