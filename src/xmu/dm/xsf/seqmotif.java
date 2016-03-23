package xmu.dm.xsf;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Servlet implementation class bestThreshold
 */
public class seqmotif extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	

    /**
     * Default constructor. 
     */
    public seqmotif() {
        // TODO Auto-generated constructor stub
    }
    final public void init(ServletConfig config)throws ServletException{
    	this.config=config;
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void deleteTemp(File file){
    	if(file.isDirectory())
    	{
    		File[]f=file.listFiles();
    		for(int i=0;i<f.length;i++)
    		{
    			deleteTemp(f[i]);
    		}
    	}
    	file.delete();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String systemPath=request.getSession().getServletContext().getRealPath("");
		String temppath = systemPath + "/seqinput/";
		String sequencetype = "dna";
		String modtype = "oops";
		File file=new File(temppath);
		if(!file.exists())
			file.mkdirs();
		String errorMessage="";
		SmartUpload upload=null;
		try{
			upload =new SmartUpload();     		
			upload.initialize(config, request, response);
			upload.setMaxFileSize(1024*1024*10);
			upload.upload();
			for(int i=0;i<upload.getFiles().getCount();i++){
				com.jspsmart.upload.File fileUpload=upload.getFiles().getFile(i);
				if(fileUpload.isMissing()){
					continue;
				}
				fileUpload.saveAs(temppath+i+".txt");
			}

		}catch(SmartUploadException e){
			errorMessage="Error in uploading"+e.getMessage();
		}
		try{
			sequencetype = upload.getRequest().getParameter("alphabet");
			modtype = upload.getRequest().getParameter("mod");
			String trainpath = temppath + "0.txt";
			String result = systemPath + "/seqoutput/";
			File resultfile=new File(result);
			if(!resultfile.exists())
				resultfile.mkdirs();
		   errorMessage=new Check().checkIsRight(trainpath, "seq");
			if(errorMessage.equals("Fine")){
			String shellstring = "cd /home/xiesifa/cuda-meme-3.0.15 && ./cuda-meme " + trainpath + " -" + sequencetype +" -mod " + modtype + " -oc " + result; 
			errorMessage = shellstring;
			Process process = Runtime.getRuntime().exec(new String[]{"sh","-c",shellstring});
			int exitvalue = process.waitFor();
			if(0 == exitvalue){
			deleteTemp(new File(temppath));		
			List<String> showContent = new LinkedList<String>();
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(result + "/meme.html")));
			String line = br.readLine();
			boolean flag = false;
			while(line != null){
				if(line.startsWith("<h4>Sites")){
					flag = true;
					br.readLine();
					br.readLine();
					br.readLine();
					line = br.readLine();
				}
				else if(line.startsWith("<p>Time"))
				{
					showContent.add(line);
					showContent.add("</div>\n");
					break;
				}else if(line.startsWith("<h4>Block Diagrams")){
					for(int i = 0; i < 7; i++)
					line = br.readLine();
					showContent.add("<div class=\"pad\">");
				}
				if(flag)
					showContent.add(line);
				line = br.readLine();
			}
			br.close();
			deleteTemp(new File(temppath));
			request.getSession().setAttribute("showContent", showContent);
			response.sendRedirect("seqshow.jsp");
			}else{
				errorMessage = "Recall MEME error"; 
				throw new Exception();
			}
			}else{
				throw new Exception();
			}
		}catch(Exception e){
          deleteTemp(new File(temppath));
          request.getSession().setAttribute("errorMessage", errorMessage);
          response.sendRedirect("error.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}