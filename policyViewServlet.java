package com.controller;
import com.dao.sqlite;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/policyViewServlet")
public class policyViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public policyViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid=Integer.parseInt(request.getParameter("policyid"));
		HttpSession session=request.getSession();
		int uid=(int) session.getAttribute("underwriterId");
		String[] arr=sqlite.viewPolicy(pid,uid);
		
		if(arr!=null)
		{
			request.setAttribute("present",null);
			request.setAttribute("policyId", arr[0]);
			request.setAttribute("VehicleNo", arr[1]);
			request.setAttribute("VehicleType", arr[2]);
			request.setAttribute("CustomerName", arr[3]);
			request.setAttribute("EngineNo", arr[4]);
			request.setAttribute("ChasisNo", arr[5]);
			request.setAttribute("PhoneNo", arr[6]);
			request.setAttribute("TypeOfInsurance", arr[7]);
			request.setAttribute("PremiumAmnt", arr[8]);
			request.setAttribute("FromDate", arr[9]);
			request.setAttribute("ToDate", arr[10]);
			request.setAttribute("underWriterId", arr[11]);
			request.getRequestDispatcher("ViewPolicy.jsp").forward(request, response);
			
		}
		else
		{
			request.setAttribute("present","Not valid id");
			request.getRequestDispatcher("ViewPolicy.jsp").forward(request, response);
		}
	}

}
