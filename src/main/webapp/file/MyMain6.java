package 상속3;

public class MyMain {

	public static void main(String[] args) {

		
		//파이리 인형
		//꼬부기 인형
		//피카츄 인형 을 머신을 통해 뽑아주세요!!
		Machine m =new Machine();
		//파이리 인형을 뽑겠습니다.
		Piri p1 = new Piri();
		m.pickPokect(p1);
		
		//꼬부기 인형을 뽑겠습니다.
		Kkobuck p2 = new Kkobuck();
		m.pickPokect(p2);
		
		//피카츄 인형을 뽑겠습니다.
		Pika p3 = new Pika();
		m.pickPokect(p3);
		
		//치코리타 인형을 뽑겠습니다.
		Chicorita p4 = new Chicorita();
		m.pickPokect(p4);
		
		
		
	}

}
