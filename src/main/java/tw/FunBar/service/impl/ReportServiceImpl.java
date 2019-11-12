package tw.FunBar.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.FunBar.dao.ReportDAO;
import tw.FunBar.model.Comment;
import tw.FunBar.model.Report;
import tw.FunBar.service.ReportService;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDAO reportDao;

	@Override
	public void insertReport(Report report) {
		reportDao.insertReport(report);
	}

	@Override
	public Comment findCommentById(int id) {
		return reportDao.findCommentById(id);
	}

}
