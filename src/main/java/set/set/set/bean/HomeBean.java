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
	// getter & setter �������Ѿ� �Ѵ�.
	// how can i generate getter & setter automatically?
	// �������� ó�� �޾ƿö� �׳� �����ϸ� �׸��̱���...
	// reflection���� ó���ϴ� ����� �غ���!
}
