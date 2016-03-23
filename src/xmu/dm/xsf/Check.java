package xmu.dm.xsf;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class Check {
	
/**
 * 
 * @param trainPath
 * @param testPath
 * @return error message
 * @throws Exception
 */
	public String checkIsRight(String trainPath, String type) throws Exception{
		File trainfile=new File(trainPath);
		if(trainfile.length()==0||!trainfile.exists()){
			return "Train set is empty!";
		}
		int countnum = 1;
		BufferedReader trainbr=new BufferedReader(new FileReader(trainfile));
		String s=trainbr.readLine();
		if(type == "net"){
		int maxv;
		try{
			maxv = Integer.parseInt(s);
		}catch(Exception e){
			return "The first line must be a number!";
		}
		s = trainbr.readLine();
		while(s!=null){
			countnum ++;
			String []sl=s.split("\t");
			if(sl.length!=2){
				trainbr.close();
				return "Train set should contain two column devide by Tab!";
			}
			try{
				int  sour=Integer.parseInt(sl[0]);
				int  dst=Integer.parseInt(sl[1]);
				if(sour > maxv || dst > maxv){
					trainbr.close();
					return "The " + countnum + "'s vertex is bigger than max value!";
				}
			}catch(Exception e){
				trainbr.close();
				return "Train set's probability is wrong in line "+countnum+"!";
			}
			s=trainbr.readLine();
		}
	}else{
		//TODO
	   //network的输入文件检查
		//如果出错，直接返回出错信息，正确返回Fine
	}
		trainbr.close();
		return "Fine";
	}
}
