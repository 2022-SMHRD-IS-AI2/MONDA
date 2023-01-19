package 상속3;

public class PhoneMain {

	public static void main(String[] args) {

		Phone p1 = new Phone();
		p1.call();
		
		Lollipop p2 = new Lollipop();
		p2.Message();
		p2.call();
		
		// 업캐스팅 -> 상위클래스 객채명 = 하위 클래스객체
		// 상위 클래스에 있는 기능 만 사용할 수 있다.
		// ★★★★★ 단!! 업캐스팅을 했을때 하위클래스에서 이미 오버라이딩(재정의)
		// 해준 경우는 업캐스팅 하더라도 재정의한 기능이 사용 되어진다!
		Phone p3 = p2;
		p3.call();
		p3.send();
	}

}
