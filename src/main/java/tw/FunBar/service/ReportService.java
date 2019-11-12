package tw.FunBar.service;

import tw.FunBar.model.Comment;
import tw.FunBar.model.Report;

public interface ReportService {
	public void insertReport(Report report);

	public Comment findCommentById(int id);
}
