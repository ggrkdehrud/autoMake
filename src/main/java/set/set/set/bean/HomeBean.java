package set.set.set.bean;

public class HomeBean {
	private String id;
	private String title;
	private String content;
	
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	// getter & setter 생성시켜야 한다.
	// how can i generate getter & setter automatically?
	// 변수들을 처음 받아올땐 그냥 생성하면 그만이구나...
	// reflection으로 처리하는 방법을 해보자!
}
