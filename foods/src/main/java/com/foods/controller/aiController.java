package com.foods.controller;

import java.io.File;
import java.util.Base64;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;


public class aiController {
	
	private String getBase64String(MultipartFile multipartFile) throws Exception {
        byte[] bytes = multipartFile.getBytes();
        return Base64.getEncoder().encodeToString(bytes);
    }
	
	
	 public String requestToFlask(String fileName, MultipartFile file) throws Exception {
	      
	      String url = "http://127.0.0.1:5000/detect";
	       RestTemplate restTemplate = new RestTemplate();

	       // Header set
	       HttpHeaders httpHeaders = new HttpHeaders();
	       httpHeaders.setContentType(MediaType.APPLICATION_JSON);

	       // Body set
	       MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
	       String imageFileString = getBase64String(file);
	       body.add("filename", fileName);
	       body.add("image", imageFileString);

	       // Message
	       HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);
	       System.out.println("response.getBodyppp()");
	       // Request
	       //HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);
	       String response = restTemplate.postForObject(url, requestMessage, String.class);
	       //ResponseEntity<Map> response = restTemplate.exchange("http://54.180.120.189:5000/detect",HttpMethod.POST, requestMessage, String.class);
	       System.out.println(response);
	       JSONParser parser = new JSONParser();
	       JSONObject jsonobject = (JSONObject) parser.parse(response);
	       jsonobject.size();
	       
	       System.out.println("ret size : " +  jsonobject.size());
//	       System.out.println("ret 0 : " +  jsonobject.notifyAll());
	       //System.out.print(jsonobject.get("image"));
	       
	 
	       // create output file
	       File outputFile = new File("C:\\Users\\bingry56\\docker\\ret_spring.jpg");
	       byte[] decodedBytes = Base64.getDecoder().decode((String)(jsonobject.get(fileName)));
	       FileUtils.writeByteArrayToFile(outputFile, decodedBytes);
	       
	       return "OK";

	}
	 
	/*
	 * @Test public void file_transfer() throws Exception{
	 * 
	 * File file = new File("C:\\Users\\woori\\docker\\jung.jpg");
	 * 
	 * DiskFileItem fileItem = new DiskFileItem("file",
	 * Files.probeContentType(file.toPath()), false, file.getName(), (int)
	 * file.length() , file.getParentFile());
	 * 
	 * InputStream input = new FileInputStream(file); OutputStream os =
	 * fileItem.getOutputStream(); IOUtils.copy(input, os);
	 * 
	 * MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
	 * 
	 * String ret = requestToFlask("c1.jpg", multipartFile); System.out.print(ret);
	 * 
	 * }
	 */

}

