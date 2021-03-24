package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;

/**
 * Servlet implementation class DownloadPaper
 */
public class DownloadPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
	private static final int BUFFER_SIZE = 4096;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadPaper() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		
        InputStream inputStream=null;
		inputStream = Service.getPDf(id);
		
		ServletContext context = getServletContext();
		 String fileName="Question Paper"+".pdf";
        // sets MIME type for the file download
        String mimeType = context.getMimeType(fileName);
        if (mimeType == null)
        {        
            mimeType = "application/octet-stream";
        }              
         
        // set content properties and header attributes for the response
        response.setContentType(mimeType);
        //response.setContentLength(fileLength);
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", fileName);
        response.setHeader(headerKey, headerValue);

        // writes the file to the client
        OutputStream outStream = response.getOutputStream();
         
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = -1;
           
        while ((bytesRead = inputStream.read(buffer)) != -1)
        {
            outStream.write(buffer, 0, bytesRead);
        }
         
        inputStream.close();
        outStream.close();
	}
}
