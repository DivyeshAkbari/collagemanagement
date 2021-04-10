package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class DownloadNotes
 */
public class DownloadNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TeacherService ts = new TeacherServiceimpl();
	private static final int BUFFER_SIZE = 4096;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadNotes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("id"));
		
	InputStream inputStream=null;
	inputStream = ts.getNotesPDf(id);
	
	ServletContext context = getServletContext();
	 String fileName="Notes"+".pdf";
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
