package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;


public interface QuoraSessionService {
	
		public String savequestiondetails(QuoraSession query);
		
		public List<QuoraSession> fetchquestiondetails();
		
		public String saveanswerdetails(Answer ans);

		public List<QuoraSession> GetQuestiondetails(String id);

		public List<Answer> fetchanswer(String id);

}
