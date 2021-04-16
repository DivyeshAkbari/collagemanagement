package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.bean.User;


public interface QuoraSessionService {
	
		public String savequestiondetails(QuoraSession query);
		
		public List<QuoraSession> fetchquestiondetails();
		
		public String saveanswerdetails(Answer ans);

		public List<QuoraSession> GetQuestiondetails(String id);

		public List<Answer> fetchanswer(String id);

		public List<User> fetchimage();

		public List<QuoraSession> fetchunanswerquestion();

		public String searchquestion(String question);

		public String modifyAnswer(Answer answer);

		public Answer getAnswer(String id);

		public String removeStudentDetails(String id, String userid);

		public List<QuoraSession> fetchTaglist();

		public int fetchTagid(String tagname);

		public int insertTagDetails(String tagname);

		public List<QuoraSession> fetchquestion(String decryptid);

}
//Pull 
