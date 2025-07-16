package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DirectServletPrint extends HttpServlet {

	private static final long serialVersionUID = 1L;
	/*
	사용자가 POST방식으로 전송한 요청을 처리하기 위해 doPost()를 오버라이딩
	한다. 만약 이 메서드가 없으면 요청을 처리할 수 없어 405에러가 발생하게 된다.
	*/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		/*
		서블릿에서 직접 HTML태그를 출력하기 위해 문서의 컨텐츠 타입을
		설정한다. JSP의 경우 page 지시어에 의해 설정된다.
		*/
		resp.setContentType("text/html;charset=UTF-8");
		//직접 출력을 위해 PrintWriter 인스턴스를 생성한다.
		PrintWriter writer = resp.getWriter();
		//출력할 내용을 기술한다.
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다.</h2>");
		writer.println("<p>jsp로 포워드하지 않습니다</p>");
		writer.println("<body>");
		writer.println("<html>");
		//출력을 위한 인스턴스 자원을 해제한다.
		writer.close();
		/*
		이 방식은 JSP없이 서블릿에서 직접 내용을 출력해야 할때 사용한다.
		주로 REST API를 만들때 사용한다.
		*/
	}
}
