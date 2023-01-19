package 상속3;

public class Machine {

	
	// 뽑기 기능 필요!
	
	// 파이리 인형 뽑기 기능
//	public void pickPokect(Piri piri) {
//		piri.pick();
//	}
//	// 꼬부기 인형 뽑기 기능
//	public void pickPokect(Kkobuck kkobuck) {
//		kkobuck.pick();
//	}
//	// 피카츄 인형 뽑기 기능
//	public void pickPokect(Pika pika) {
//		pika.pick();
//	}
//	// 치코리타 인형 뽑기 기능
//	public void pickPokect(Chicorita chicorita) {
//		chicorita.pick();
//	}
	// 메소드 이름을 그대로 유지한채로
	// 다른 매개변수를 받아서 새로운 메소드를 만드는 기능!
	// -> 메소드 오버로딩 : 다형성!
	
	
	public void pickPokect(Pokect pokect) {
		pokect.pick();
	}
	
	
}
