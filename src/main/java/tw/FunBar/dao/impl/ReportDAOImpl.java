package tw.FunBar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ReportDAO;
import tw.FunBar.model.Comment;
import tw.FunBar.model.Report;

@Repository
public class ReportDAOImpl implements ReportDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void insertReport(Report report) {
		Session session = sessionFactory.getCurrentSession();
		session.save(report);
	}

	@Override
	public Comment findCommentById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Comment comment = session.get(Comment.class, id);

		return comment;
	}

	@Override
	public List<Report> queryReportProcess() {
		String hql = "From Report Where reportStatus = 0";
		Session session = sessionFactory.getCurrentSession();
		List<Report> reports = (List<Report>)session.createQuery(hql).getResultList();
		
		return reports;
	}

	@Override
	public List<Report> queryReportResult() {
		String hql = "From Report Where reportStatus = 1";
		Session session = sessionFactory.getCurrentSession();
		List<Report> reports = (List<Report>)session.createQuery(hql).getResultList();
		
		return reports;
	}

	@Override
	public void deleteComment(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(comment);
	}

	@Override
	public void resolveReport(Report report) {
		String hql = "Update Report Set reportStatus = 1 Where reportId = :reportId";
		Session session = sessionFactory.getCurrentSession();
		session.createSQLQuery(hql).setParameter("reportId", report.getReportId()).executeUpdate();
	}

	@Override
	public Report findReportById(int id) {
		String hql = "From Report Where reportId = :reportId";
		Session session = sessionFactory.getCurrentSession();
		Report report = (Report)session.createQuery(hql)
							.setParameter("reportId", id).getSingleResult();

		return report;
	}

}
