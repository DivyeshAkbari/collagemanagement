package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.QuoraSessionDao;
import com.mysql.cj.Query;

public class QuoraSessionImpl implements QuoraSessionDao {

	@Override
	public int insertquestiondetails(Connection connection,QuoraSession query) {
		// TODO Auto-generated method stub
		
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into question_table(c_question_topic,c_question_description,c_question_category_type,i_user_id,c_Name) values (?,?,?,?,?)");
				)
		{
			p1.setString(1, query.getTopicname());
			p1.setString(2,query.getTdescription());
			p1.setString(3,query.getCtype());	
			p1.setInt(4,query.getUserid());
			p1.setString(5, query.getUsername());
			
			insertedRaws=p1.executeUpdate();	
			if(insertedRaws==1)
			{
				System.out.println("Query Registered Successfully");
			}
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
			
		return insertedRaws;
	}

	@Override
	public List<QuoraSession> selectquestiondetails(Connection connection) {
		// TODO Auto-generated method stub
		
		List<QuoraSession> querylist = new ArrayList<>();
		
		
		try(PreparedStatement p1=connection.prepareStatement("Select * from question_table");
			  )
		{
				try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					QuoraSession q1 = new QuoraSession();
					
					q1.setQueryId(r1.getInt("i_question_id"));
					q1.setTopicname(r1.getString("c_question_topic"));
					q1.setTdescription(r1.getString("c_question_description"));
					q1.setCtype(r1.getString("c_question_category_type"));
					querylist.add(q1);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return querylist;
	}

	@Override
	public int insertanswerdetails(Connection connection, Answer ans) {
		// TODO Auto-generated method stub
		
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into answer_table(c_answer_description) values (?) where i_answer_id=1 ");
				)
		{
			
			p1.setString(1, ans.getAnswerdescription());

			insertedRaws=p1.executeUpdate();	
			if(insertedRaws==1)
			{
				System.out.println("Answer Registered Successfully");
			}
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
			
		return insertedRaws;
	
	}

	@Override
	public List<Answer> fetchansdetails(Connection connection, String id) {
		// TODO Auto-generated method stub
		
		List<Answer> answerlist = new ArrayList<>();
		try(PreparedStatement p1=connection.prepareStatement("Select c_question_topic,c_question_description from question_table where i_question_id=?");
				
				)
		{
			p1.setString(1, id);
			try(ResultSet r1=p1.executeQuery();
					  )
				{
					while(r1.next())
					{
						Answer ans = new Answer();
						
						ans.setAnswerdescription(r1.getString("c_answer_description"));
						
						answerlist.add(ans);
					}
				}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return answerlist;
	}

	@Override
	public List<QuoraSession> getquestiondetails(Connection c1, String id)
	{
		List<QuoraSession> querylist = new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement("Select c_question_topic,c_question_description,c_Name,i_question_id from question_table where i_question_id =?");
				  )
			{
				p1.setInt(1,Integer.parseInt(id));
					try(ResultSet r1=p1.executeQuery();
					  )
				{
					while(r1.next())
					{
						QuoraSession q1 = new QuoraSession();
						q1.setTopicname(r1.getString("c_question_topic"));
						q1.setTdescription(r1.getString("c_question_description"));
						q1.setUsername(r1.getString("c_Name"));
						q1.setQueryId(r1.getInt("i_question_id"));
						querylist.add(q1);
					}
				}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return querylist;
	}
}
