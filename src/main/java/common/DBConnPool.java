package common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/*
JNDI(Java Naming and Directory INterface)
: 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서 참조(Lookup)하는
API로 쉽게 말하면 외부에 있는 개체를 이름으로 찾아오기 위한 기술이다.

DBCP(DateBase Connection Pool : 커넥션풀)
: DB와 연결된 커넥션 객체를 이미 만들어 풀(Pool)에 저장해 두었다가 필요할때
가져다 쓰고 반납하는 기법을 말한다. DB의 부하를 줄이고 자원을 효율적으로
관리할 수 있다. 워터파크의 유수풀과 유사한 개념이다.
*/
public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DBConnPool() {
		try {
			//1.Context 인스턴스 즉 Tomcat 컨테이너를 생성한다.
			Context initCtx = new InitialContext();
			//2.Tomcat의 Root디렉토리를 얻어온다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			//3.미리 생성된 커넥션풀 객체를 얻어온다.
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			//4.커넥션풀에 생성해 둔 커넥션객체를 가져다가 사용한다.
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB  커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("DB 커넥션 풀 지원 반납");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
