package tw.FunBar.dao.impl;

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

}
