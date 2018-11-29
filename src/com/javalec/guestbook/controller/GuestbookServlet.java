package com.javalec.guestbook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.guestbook.dao.GuestBookDAO;
import com.javalec.guestbook.vo.GuestBookVO;

@WebServlet("/gb")
public class GuestbookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionName = req.getParameter("a");
		if ("add".equals(actionName)) {
			String name = req.getParameter("name");
			String pw = req.getParameter("pw");
			String content = req.getParameter("content");

			if (name != null || pw != null || content != null) {
				GuestBookDAO dao = new GuestBookDAO();
				GuestBookVO vo = new GuestBookVO();

				vo.setName(name);
				vo.setPassword(pw);
				vo.setContent(content);
				dao.insert(vo);
			}
			resp.sendRedirect("gb");

		} else if ("deleteform".equals(actionName)) {

			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
			rd.forward(req, resp);

		} else if ("delete".equals(actionName)) {
			String no = req.getParameter("no");
			String password = req.getParameter("pw");

			if (password != null || no != null) {
				int id = Integer.parseInt(no);
				GuestBookDAO dao = new GuestBookDAO();
				GuestBookVO vo = new GuestBookVO();

				vo.setNo(id);
				vo.setPassword(password);

				dao.delete(vo);
			}

			resp.sendRedirect("gb");

		} else if ("update".equals(actionName)) {
			String no = req.getParameter("no");
			String name = req.getParameter("name2");
			String content = req.getParameter("content2");
			String password = req.getParameter("pw");

			if (no != null) {
				int id = Integer.parseInt(no);
				GuestBookDAO dao = new GuestBookDAO();
				GuestBookVO vo = new GuestBookVO();
				vo.setNo(id);
				vo.setName(name);
				vo.setContent(content);
				vo.setPassword(password);

				dao.update(vo);
			}

			resp.sendRedirect("gb");

		} else if ("updateform".equals(actionName)) {
			
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/updateform1.jsp");
			rd.forward(req, resp);

		} else if ("updatecon".equals(actionName)) {
			
			if (req.getParameter("password").equals(req.getParameter("pw"))) {
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/updateform2.jsp");
				rd.forward(req, resp);
			} else {
				resp.sendRedirect("gb");
			}

		} else {

			GuestBookDAO dao = new GuestBookDAO();
			List<GuestBookVO> list = dao.getGuestBookList();
			req.setAttribute("list", list);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
