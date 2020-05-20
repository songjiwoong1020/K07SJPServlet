package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fNum = request.getParameter("firstNum");
		String sNum = request.getParameter("secondNum");
		
		int fnum = Integer.parseInt(fNum);
		int snum = Integer.parseInt(sNum);
		
		String op = request.getParameter("operator");
		
		int returnValue;
		switch(op) {
		case "+":
			returnValue = fnum + snum;
			break;
		case "-":
			returnValue = fnum - snum;
			break;
		case "*":
			returnValue = fnum * snum;
			break;
		case "/":
			returnValue = fnum / snum;
			break;
		default:
			returnValue = 0;
		}
		
		request.setAttribute("calResult", "결과는? " + returnValue);
		request.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(request, response);
	}
	
	
	

}
