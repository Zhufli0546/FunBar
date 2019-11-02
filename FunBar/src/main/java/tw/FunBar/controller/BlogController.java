package tw.FunBar.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.service.BlogService;
import tw.FunBar.util.JSONFileUpload;

@Controller
public class BlogController {
	@Autowired
	BlogService blogService;

	@RequestMapping("/blog")
	public String blog(Model model) {
		List<Category> categoryList = blogService.getCategories();
		model.addAttribute("categoryList", categoryList);
		return "blog";
	}
	
	@RequestMapping("/blogInsert")
	public String blogInsert(@RequestParam("upload") MultipartFile upload,
							 HttpServletRequest request,
							 HttpServletResponse response) throws ServletException, IOException {
		String filename = upload.getOriginalFilename();
        //System.out.println(filename);
        
        InputStream in = upload.getInputStream();
        String basePath = "C:\\Servlet_JSP\\apache-tomcat-9.0.22\\imgUpload\\";
        System.out.println("basePath:" + basePath);
        File outputFilePath = new File(basePath + filename);
        OutputStream output = new FileOutputStream(outputFilePath);
        byte[] buff = new byte[1024];
        int length;
        while ((length = in.read(buff)) != -1) {
            output.write(buff, 0, length);
        }
        output.close();
        in.close();
        
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(new JSONFileUpload(basePath + filename)));
        out.flush();
        out.close();
		
		return "blogInsert";
	}
	
	@RequestMapping("/blogBrowse")
	public String blogBrowse(HttpServletRequest request, Model model) {
		String basePath = "C:\\Servlet_JSP\\apache-tomcat-9.0.22\\imgUpload\\";
        File folder = new File(basePath);
        model.addAttribute("files", folder.listFiles());
        model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));

		return "browsefile";
	}
	
	@RequestMapping("/blogPost")
	public String blogPost(@RequestParam MultipartFile blogImage,
						   @RequestParam String blogTitle,
						   @RequestParam String blogContent,
						   @RequestParam Integer categoryId, HttpServletRequest request) throws IOException {
		
		Date date = new Date();
		String filename = date.getTime() + blogImage.getOriginalFilename();
        
        if(filename.length()>0) {
        	InputStream in = blogImage.getInputStream();
        	String basePath = "C:\\Servlet_JSP\\apache-tomcat-9.0.22\\imgUpload\\";
            System.out.println("basePath:" + basePath);
            File outputFilePath = new File(basePath + filename);
            OutputStream output = new FileOutputStream(outputFilePath);
            byte[] buff = new byte[1024];
            int length;
            while ((length = in.read(buff)) != -1) {
                output.write(buff, 0, length);
            }
            output.close();
            in.close();
        }
        
		String path = request.getContextPath() + "/imgUpload" + filename;
		Blog blog = new Blog();
		blog.setBlogImage(path);
		blog.setBlogTitle(blogTitle);
		blog.setBlogContent(blogContent);
		
		Date d = new Date();
		Timestamp timestamp = new Timestamp(d.getTime());
		blog.setBlogCreatedTime(timestamp);

		Category category = blogService.findByIdCategory(categoryId);
		blog.setCategory(category);
		
		blogService.insertBlog(blog);

		return "redirect:/blog";
	}
}
