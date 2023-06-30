package com.foods.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.foods.service.foodsService;
import com.foods.vo.FoodsVO;

@Controller
public class foodsController {
   
   @Autowired
   private foodsService foodsservice;
   
   // 상품 관리
   @RequestMapping("/foods/list")
   public String memberList(Model model) {
      // 목록을 조회해서 전달
      List<FoodsVO> list = foodsservice.FoodsList();
      model.addAttribute("list", list);
      
      return "foods_list";
   }
   
   
   @RequestMapping("foods/write")
   public String memberwriteView() {
      return "foods_write";
   }
   
   @RequestMapping(value="foods/write", method=RequestMethod.POST)
   public String foodsInsert(@ModelAttribute FoodsVO vo) {
      System.out.println("상품 등록");
      foodsservice.insertFoods(vo);
      
      return "redirect:/foods/list";
   }
   
   @RequestMapping("foods/view") 
   public String foodsView(@RequestParam int foodsId, Model model) {
      System.out.println("상품 상세보기");
      FoodsVO data = foodsservice.viewFoods(foodsId);
      model.addAttribute("dto", data);
      
      return "foods_view";
   }
   
   @RequestMapping(value = "foods/update", method=RequestMethod.POST)
   public String foodsUpdate(@ModelAttribute FoodsVO vo) {
      foodsservice.updateFoods(vo);
      return "redirect:/foods/list"; 
   }
   
   @RequestMapping(value ="foods/delete", method=RequestMethod.POST)
   public String foodsDelete(@ModelAttribute FoodsVO vo, Model model) {
      int foodsId = vo.getFoodsId();
      foodsservice.deleteFoods(foodsId);
      return "redirect:/foods/list"; 
   }
   
   /* 첨부 파일 업로드 */
   @RequestMapping(value = "foods/fileupload", method = RequestMethod.POST)
    public String fileupload(@RequestParam("file") MultipartFile file, HttpServletRequest request,FoodsVO vo) {
       String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
      long size = file.getSize(); //파일 사이즈
      
      System.out.println("파일명 : "+fileRealName);
      System.out.println("용량크기(byte) : "+size);
    
      String webappRoot = request.getServletContext().getRealPath("/");      //서버 경로 확인
      String folder = "resources" + File.separator + "images" + File.separator; //\resource\images 저장폴더 지정
      System.out.println(webappRoot+folder);
      
      //배포위치에 저장
      String filename = webappRoot + folder + fileRealName; //서버위치+저장폴더+파일명   
      try {
         file.transferTo(new File(filename)); //전달받은 파일을 지정된 위치에 파일명으로 저장한다.   
      } catch (Exception e) {
         // TODO: handle exception
      }
      /*
       * String path2
       * ="C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\foods\\resources\\images";
       */
      //개발위치에 저장            
      String path = "C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE\\foods\\src\\main\\webapp\\resources\\imgUpload";
      String filename2 =path+File.separator+fileRealName;
      
      try {
         file.transferTo(new File(filename2));   
      } catch (Exception e) {
         // TODO: handle exception
      }
      String[] splitPath = filename2.split("webapp\\\\");
      String remainingPath = "\\" + splitPath[1];
      System.out.println(remainingPath);
      
      vo.setFoodsImg(fileRealName);
      System.out.println("상품 등록");
      foodsservice.insertFoods(vo);
      /* System.out.println(filename2); */
       return "redirect:/foods/list";
    }

}