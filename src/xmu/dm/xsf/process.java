package xmu.dm.xsf;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

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


public class process extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	

    /**
     * Default constructor. 
     */
    public process() {
        // TODO Auto-generated constructor stub
    }
    final public void init(ServletConfig config)throws ServletException{
    	this.config=config;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //删除临时文件
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
    //自定义的比较函数，用来将Zscore文件的内容根据zsore排序
    public class WeightComparator implements Comparator<String>{
    	public int compare(String s1, String s2) {
    		// TODO Auto-generated method stub
    		double score1 = Double.parseDouble(s1.split("\t\t")[4]);
    		double score2 = Double.parseDouble(s2.split("\t\t")[4]);
    		return score1 > score2? -1:1;
    	}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String systemPath=request.getSession().getServletContext().getRealPath("");
		String temppath = systemPath + "/Temp/";
		File file=new File(temppath);
		if(!file.exists())
			file.mkdirs();
		String errorMessage="";
		//是否有向
		String type="directed";
		//gpunemo的参数 s,默认设为4
		int s = 4;
		SmartUpload upload=null;
		try{
			upload =new SmartUpload();     		
			upload.initialize(config, request, response);
			upload.setMaxFileSize(1024*1024*10);
			upload.upload();
			type = upload.getRequest().getParameter("netmotif");
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
			s = Integer.parseInt(upload.getRequest().getParameter("msize"));
			String trainpath=systemPath+"/Temp/0.txt";
			String result = systemPath + "/Result";
			File resultfile=new File(result);
			int isdir = 0;
			if(!resultfile.exists())
				resultfile.mkdirs();
		    errorMessage=new Check().checkIsRight(trainpath, "net");
			if(errorMessage.equals("Fine")){
			String shellstring = "/home/xiesifa/gpuNemo/gpuNemo -i " + trainpath + " -s " + s + " -r 100 -o " + result +" -g 0  -u ";
			if (type.equals("directed")){
				//有向的
				shellstring = "/home/xiesifa/gpuNemo/gpuNemo -i " + trainpath + " -s " + s + " -r 100 -o " + result +" -g 0 ";
				isdir = 1;
			}
			Process process = Runtime.getRuntime().exec(shellstring);
			int exitvalue = process.waitFor();
			if(0 == exitvalue){	
			//画全图
			shellstring = "/home/xiesifa/example_igraph/overview/formatAndPlot.pl " + trainpath  + " " + isdir + " "+ systemPath + "/result.html";
			process = Runtime.getRuntime().exec(shellstring);
			exitvalue = process.waitFor();
			if(0 != exitvalue){
				errorMessage = "Draw figure error"; 
				throw new Exception();
			}
			List<String> showContent = new LinkedList<String>();
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(systemPath+"/result.html")));
			String line = br.readLine();
			for(int i=0;i<5;i++)
				line=br.readLine();
			while(line != null){
				if(line.startsWith("<script>")){
					while(!line.startsWith("</script>")){
						showContent.add(line);
						line = br.readLine();
					}
					showContent.add("</script>");
					break;
				}
				line = br.readLine();
			}
			deleteTemp(new File(systemPath+"/Temp/"));
			//画每个子图
			shellstring = "/home/xiesifa/example_igraph/drawGraph.pl " + result +"/adjMatrix.txt " + systemPath + "/images/ " + isdir;
			process = Runtime.getRuntime().exec(shellstring);
			exitvalue = process.waitFor();
			if(0 != exitvalue){
				errorMessage = "Draw figure error"; 
				throw new Exception();
			}
			BufferedReader zscore = new BufferedReader(new InputStreamReader(new FileInputStream(result + "/ZScore.txt")));
			 line = zscore.readLine();
			line = zscore.readLine();
			line = zscore.readLine();
			line = zscore.readLine();
			List<String> linelist = new ArrayList<String>();
			while(line != null){
				if (line.startsWith("**"))
					line = line.substring(2);
				double score = Double.parseDouble(line.split("\t\t")[4]);
				if (score > 0)
				linelist.add(line);
				line = zscore.readLine();
			}
			WeightComparator weightComp=new WeightComparator();
			Collections.sort(linelist,weightComp);
			request.getSession().setAttribute("result", linelist);
			request.getSession().setAttribute("showcontent", showContent);
			response.sendRedirect("netshow.jsp");
			}else{
				errorMessage = "Recall gpuNemo error"; 
				throw new Exception();
			}
			}else{
				throw new Exception();
			}
		}catch(Exception e){
          deleteTemp(new File(systemPath+"/Temp/"));
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