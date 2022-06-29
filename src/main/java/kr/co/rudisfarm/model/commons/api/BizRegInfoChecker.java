package kr.co.rudisfarm.model.commons.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class BizRegInfoChecker {
	URL url;
	URLConnection urlConn;
	HttpURLConnection httpUrlConn;
	BufferedReader bufferedReader;
	String xmlPasingStr;
	
	public BizRegInfoChecker() {
		try {
			url = new URL("https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId="); // 국세청 홈텍스 사업자등록상태조회 URL
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		urlConn = null;
		httpUrlConn = null;
		bufferedReader = null;
		xmlPasingStr = "";
	}
	
	public String postCRN(String txprDscmNo) {
		try {
			urlConn =  url.openConnection();
			httpUrlConn = (HttpURLConnection)urlConn;
			httpUrlConn.setConnectTimeout(10000);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setUseCaches(false);
			httpUrlConn.setDefaultUseCaches(false);
			httpUrlConn.setRequestMethod("POST");
			httpUrlConn.setRequestProperty("Content-Type","text/plain; charset=uft-8");
			
			BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(httpUrlConn.getOutputStream(), "UTF-8")); //XML로 내보낼 데이터를 위한 객체 생성
			
			//전송할 xml 데이터
			String xmlData = "<map id=\"ATTABZAA001R08\">" + 
							 "<pubcUserNo></pubcUserNo>" + 
							 "<mobYn>N</mobYn>" + 
						 	 "<inqrTrgtClCd>1</inqrTrgtClCd>" + 
						 	 "<txprDscmNo>" + txprDscmNo.replaceAll("-", "") + "</txprDscmNo>" + 
							 "<dongCode>15</dongCode>" + 
							 "<psbSearch>Y</psbSearch>" + 
							 "<map id=\"userReqInfoVO\"></map>" + 
							 "</map>";
			
			wr.write(xmlData);
			wr.flush();
			wr.close();
			
			InputStream inStream = httpUrlConn.getInputStream();
			
			if(inStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inStream));
				String line = "";
				
				while((line = bufferedReader.readLine()) != null) {
					xmlPasingStr += line;
				}
			}
			inStream.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return xmlPasingStr.substring(xmlPasingStr.indexOf("<smpcBmanTrtCntn>")+17, xmlPasingStr.indexOf("/smpcBmanTrtCntn>")-1);
	}

}
