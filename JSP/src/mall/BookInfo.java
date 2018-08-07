package mall;

public class BookInfo extends ProductInfo {

	private short page;
	private String writer;

	public void setPage(short page) {
		this.page = page;
	}

	public short getPage() {
		return page;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriter() {
		return writer;
	}

}
