package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Comment;
import tw.FunBar.model.Report;

public interface ReportDAO {
	public void insertReport(Report report);
	
	public Comment findCommentById(int id);
	
	public List<Report> queryReportProcess();
}
