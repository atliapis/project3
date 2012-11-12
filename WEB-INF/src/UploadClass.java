import java.io.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
 
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
 
public class UploadClass extends HttpServlet {
	private static final String TMP_DIR_PATH = "/var/lib/tomcat6/webapps/project3/files/tmp";
	private File tmpDir;
	private static final String DESTINATION_DIR_PATH ="/files/images";
	private File destinationDir;
 
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		tmpDir = new File(TMP_DIR_PATH);
		if(!tmpDir.isDirectory()) {
			throw new ServletException(TMP_DIR_PATH + " is not a directory");
		}
		String realPath = getServletContext().getRealPath(DESTINATION_DIR_PATH);
		destinationDir = new File(realPath);
		if(!destinationDir.isDirectory()) {
			throw new ServletException(DESTINATION_DIR_PATH+" is not a directory");
		}
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();
	    response.setContentType("text/html");
	    out.println();
 
		DiskFileItemFactory  fileItemFactory = new DiskFileItemFactory ();
		/*
		 *Set the size threshold, above which content will be stored on disk.
		 */
		fileItemFactory.setSizeThreshold(1*1024*1024); //1 MB
		/*
		 * Set the temporary directory to store the uploaded files of size above threshold.
		 */
		fileItemFactory.setRepository(tmpDir);
 
		ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
		try {
			/*
			 * Parse the request
			 */
			List items = uploadHandler.parseRequest(request);
			Iterator itr = items.iterator();
                        
            String caption = new String("");
			while(itr.hasNext()) {        
				FileItem item = (FileItem) itr.next();
				/*
				 * Handle Form Fields.
				 */
				if(item.isFormField()) {
					String tempString = new String("caption");
					if(tempString.equals(item.getFieldName())){ caption = item.getString(); }                   
				} else {
					HttpSession session = request.getSession(true);

					out.println("<img src=\"/project3" + DESTINATION_DIR_PATH + "/" + item.getName() + "\"/></br>");
					out.println("<h2>" + caption + "</h2>");
					out.println((int)(item.getSize()/1024) + "KB : File " + item.getName() + " uploaded successfully\n");
                    out.println("</br><b>Return to </b><a href='home.jsp'>Go back to Home Page for thumbnails view</a></b>");
                     
					File file = new File(destinationDir, item.getName());
					item.write(file);
                    
					//Create xml File
					File xml = new File(destinationDir, item.getName() + ".xml");
                    BufferedWriter output = new BufferedWriter(new FileWriter(xml));
		      output.write("<img>\n");
                    output.write("<dest>" + item.getName() + "</dest>\n");
                    output.write("<caption>" + caption + "</caption>\n");
                    output.write("</img>\n");
                    output.close();
				}
				
			}
		}catch(FileUploadException ex) {
			log("Error encountered while parsing the request",ex);
		} catch(Exception ex) {
			log("Error encountered while uploading file",ex);
		}
                
        out.close();
 
	}
 
}