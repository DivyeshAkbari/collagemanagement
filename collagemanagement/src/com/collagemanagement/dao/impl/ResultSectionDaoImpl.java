package com.collagemanagement.dao.impl;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.Marks;
import com.collagemanagement.bean.Paper;
import com.collagemanagement.bean.Papertype;
import com.collagemanagement.bean.Result;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.ResultSectionDao;

public class ResultSectionDaoImpl implements ResultSectionDao
{
	@Override
	public List<Subject> getSubjectDetails(Connection c1,String streamid, String semid,int i) 
	{
		List<Subject> Subjectlist=new ArrayList<>();
		PreparedStatement p1 = null;
		try
		{
				if(i==1)
				{
					 p1=c1.prepareStatement("Select i_Subject_id,c_subject_name from subject_table where i_stream_id=? AND i_Semester_id=? AND i_differenciate=?");
					 p1.setInt(3,0);
				}
				else
				{
					p1=c1.prepareStatement("Select c_subject_name from subject_table where i_stream_id=? AND i_Semester_id=?");
				}
				
				System.out.println("Streamid is "+streamid);
				p1.setInt(1, Integer.parseInt(streamid));
				p1.setInt(2, Integer.parseInt(semid));
					
				try(ResultSet r1=p1.executeQuery();)
				{
					while(r1.next())
					{
						Subject s1=new Subject();
						//s1.setSubjectId(r1.getInt("i_Subject_id"));
						s1.setSubjectName(r1.getString("c_subject_name"));
						Subjectlist.add(s1);
					}
				}
				p1.close();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return Subjectlist;
	}
	@Override
	public List<Marks> getMarksDetails(Connection c1,int id, String semid) 
	{
		List<Marks> Markslist=new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement("Select i_marks_value from marks_table where i_user_id=? AND i_Semester_id=?");
			)
		{
			p1.setInt(1, id);
			p1.setInt(2, Integer.parseInt(semid));
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					Marks m1=new Marks();
					m1.setMarksvalue(r1.getInt("i_marks_value"));
					Markslist.add(m1);
				}
			}
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Markslist;
	}

	@Override
	public List<Semester> fetchSemvalue(Connection c1, int id)
	{
		List<Semester> Semlist=new ArrayList<>();
		
		try (	PreparedStatement p1=c1.prepareStatement(" Select i_Semester_id,i_semester_value from semester_table where i_stream_id=?");
			  )		
		{
			p1.setInt(1, id);
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					Semester m1=new Semester();
					m1.setSemid(r1.getInt("i_Semester_id"));
					m1.setSemvalue(r1.getInt("i_semester_value"));
					Semlist.add(m1);
				}
			}
		}
		
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Semlist;
	}

	@Override
	public User getEmailid(Connection c1,User u1) 
	{
		String tempemail;
		User user=new User();
		try(PreparedStatement p1=c1.prepareStatement("Select c_email,i_user_id from user_table where c_email=? ");)
		{
			
			p1.setString(1, u1.getEmail());
			try(ResultSet r1=p1.executeQuery();)
			{
				if(r1.next())
				{
					tempemail=r1.getString("c_email");
					if(tempemail.equalsIgnoreCase(u1.getEmail()))
					{
						user.setId(r1.getInt("i_user_id"));
						return user;
					}
					else
					{
						return null;
					}
				}	
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Result getStatusDetails(Connection c1, int id,String semid) 
	{
		Result r2=new Result();
		try(PreparedStatement p1=c1.prepareStatement("Select c_Status from result_table where i_user_id=? AND i_Semester_id=?");
			   )
		{
			p1.setInt(1, id);
			p1.setInt(2, Integer.parseInt(semid));
			
			try(ResultSet r1=p1.executeQuery();)
			{
				if(r1.next())
				{
					r2.setStatus(r1.getString("c_Status"));
				}
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r2;
	}

	@Override
	public int getStreamId(Connection c1, String sem,int i) 
	{
		try
		{
			PreparedStatement p1=null;
			if(i==1)
			{
				p1=c1.prepareStatement("Select i_stream_id from semester_table where i_Semester_id=?");
				p1.setInt(1, Integer.parseInt(sem));
			}
			else
			{
				p1=c1.prepareStatement("Select i_stream_id from paper_table where i_Paper_id=?");
				p1.setInt(1, Integer.parseInt(sem));
			}
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				if(r1.next())
				{
					int streamid=r1.getInt("i_stream_id");
					return streamid;
				}
			}	
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Subject> GetSubjectDetails(Connection c1, String sem)
	{
		List<Subject> subjectlist=new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement("Select i_Subject_id,c_subject_name from subject_table where i_stream_id=?");)
		{
			p1.setInt(1, Integer.parseInt(sem));
			
			try(ResultSet r1=p1.executeQuery();)
			{
				while(r1.next())
				{
					Subject subject=new Subject();
					subject.setSubjectId(r1.getInt("i_Subject_id"));
					subject.setSubjectName(r1.getString("c_subject_name"));
					subjectlist.add(subject);
				}
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectlist;
	}

	@Override
	public int setPaperDetails(Connection c1, Paper p1)
	{
		int insertedRaw=0;
		try(PreparedStatement p2=c1.prepareStatement("insert into paper_table (i_stream_id,i_Semester_id,i_papertype_id,i_year,PDF,i_status) values (?,?,?,?,?,?)");)
		{
			
			p2.setInt(1, p1.getStreamid());
			p2.setInt(2, p1.getSemesterid());
			//p2.setInt(3, p1.getSubjectid());
			p2.setInt(3, Integer.parseInt(p1.getType()));
			p2.setInt(4, p1.getYear());
			p2.setBlob(5, p1.getPDF());
			p2.setInt(6, 1);
			
			 insertedRaw=p2.executeUpdate();
			return insertedRaw;
			
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List<Semester> getSemvalue(Connection c1, int id) 
	{
		List<Semester> Semlist=new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement(" select semester_table.i_Semester_id,semester_table.i_semester_value \r\n" + 
				"from semester_table \r\n" + 
				"inner join  result_table \r\n" + 
				"on result_table.i_Semester_id=semester_table.i_Semester_id\r\n" + 
				"where  i_user_id=?");
			  )
		{
			p1.setInt(1, id);
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					Semester m1=new Semester();
					m1.setSemid(r1.getInt("i_Semester_id"));
					m1.setSemvalue(r1.getInt("i_semester_value"));
					Semlist.add(m1);
				}
			}
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Semlist;
	}
	@Override
	public List<Paper> getYearDetails(Connection c1, Paper p1)
	{
		List<Paper> paper=new ArrayList<>();
		
		try(PreparedStatement p2=c1.prepareStatement("Select i_year from paper_table where i_stream_id=? AND i_Semester_id=? AND i_papertype_id=?");
			  )
		{
			p2.setInt(1, p1.getStreamid());
			p2.setInt(2, p1.getSemesterid());
			p2.setInt(3, Integer.parseInt(p1.getType()));
			
			try(ResultSet r1=p2.executeQuery();)
			{
				while(r1.next())
				{
					Paper p3=new Paper();
					p3.setYear(r1.getInt("i_year"));
					paper.add(p3);
					
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return paper;
	}
	@Override
	public int getPaperID(Connection c1, Paper paper)
	{
		try(PreparedStatement p1=c1.prepareStatement("Select i_Paper_id from paper_table where i_stream_id=? AND i_Semester_id=? AND i_year=? AND i_papertype_id=?");
			 )
		{
			p1.setInt(1, paper.getStreamid());
			p1.setInt(2, paper.getSemesterid());
			p1.setInt(3, paper.getYear());
			p1.setInt(4, Integer.parseInt(paper.getType()));
			
			try(ResultSet r1=p1.executeQuery();)
			{
				if(r1.next())
				{
					int paperid=r1.getInt("i_Paper_id");
					return paperid;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List<Papertype> getPapertype(Connection c1)
	{
		List<Papertype> paperlist=new ArrayList<>();
		
		try(PreparedStatement p1=c1.prepareStatement("Select * from papertype_table");
			  )
		{
			
			try(ResultSet r1=p1.executeQuery();)
			{
				while(r1.next())
				{
					Papertype p2=new Papertype();
					p2.setPapertypeid(r1.getInt("i_papertype_id"));
					p2.setPaperType(r1.getString("c_type"));
					paperlist.add(p2);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paperlist;
	}
	@Override
	public InputStream fetchPaper(Connection c1, int id) 
	{
		InputStream inputStream = null;
		try(PreparedStatement statement = c1.prepareStatement("Select PDF from  paper_table where i_Paper_id=?");
			 )
		{
					statement.setInt(1, id);

					ResultSet result = statement.executeQuery();
					if (result.next()) 
					{
						// gets file name and file blob data
						// String fileName = result.getString("file_name");
						Blob blob = result.getBlob("PDF");
						inputStream = blob.getBinaryStream();
					}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inputStream;	
	}
	@Override
	public int validatePaper(Connection c1, Paper paper) 
	{
		try(PreparedStatement p1=c1.prepareStatement("select i_Paper_id from paper_table where i_stream_id=? And i_Semester_id=? And i_year=? And i_papertype_id=?");)
		{
			p1.setInt(1, paper.getStreamid());
			p1.setInt(2, paper.getSemesterid());
			p1.setInt(3, paper.getYear());
			p1.setInt(4, Integer.parseInt(paper.getType()));
			
			try(ResultSet r1=p1.executeQuery();)
			{
				if(r1.next())
				{
					int id=r1.getInt("i_Paper_id");
					System.out.println("Id is "+id);
					if(id>0)
					{
						return 1;
					}
					else
					{
						return 0;
					}
				}
			}
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List<Paper> getPaperData(Connection c1, String streamid)
	{
		List<Paper> paperlist=new ArrayList<>();
		
		try(PreparedStatement p1=c1.prepareStatement("Select * from paper_table where i_stream_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(streamid));
			
			try(ResultSet r1=p1.executeQuery();
				 )
			{
				while(r1.next())
				{
					Paper p2=new Paper();
					p2.setPaperid(r1.getInt("i_Paper_id"));
					
					int streamid1=r1.getInt("i_stream_id");
					
						try(PreparedStatement p3=c1.prepareStatement("Select c_stream from stream_table where i_stream_id=?");
							 )
						{
							p3.setInt(1, streamid1);
							
							try(ResultSet r2=p3.executeQuery();
								 )
							{
								if(r2.next())
								{
									p2.setStreamname(r2.getString("c_stream"));
								}
							}
						}
						
						int semid=r1.getInt("i_Semester_id");
						try(PreparedStatement p4=c1.prepareStatement("select i_semester_value from semester_table where i_Semester_id=? AND i_stream_id=?");
							  )
						{
							p4.setInt(1, semid);
							p4.setInt(2, Integer.parseInt(streamid));
							
							try(ResultSet r3=p4.executeQuery();
								  )
							{
								if(r3.next())
								{
									p2.setSemesterid(r3.getInt("i_semester_value"));
								}
							}
						}
						
						p2.setYear(r1.getInt("i_year"));
						
						int papertypeid=r1.getInt("i_papertype_id");
						try(PreparedStatement p5=c1.prepareStatement("Select c_type from papertype_table where i_papertype_id=?");
							  )
						{
							p5.setInt(1, papertypeid);
							try(ResultSet r4=p5.executeQuery();
								  )
							{
								if(r4.next())
								{
									p2.setPapertype(r4.getString("c_type"));
								}
							}
						}
						
						paperlist.add(p2);
					}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paperlist;
	}
	@Override
	public Paper getpaperDetails(Connection c1, String id)
	{
		Paper p2=new Paper();
		try(PreparedStatement p1=c1.prepareStatement("Select * from paper_table where i_Paper_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(id));
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				if(r1.next())
				{
					
					
					int streamid1=r1.getInt("i_stream_id");
					
					try(PreparedStatement p3=c1.prepareStatement("Select c_stream from stream_table where i_stream_id=?");
						 )
					{
						p3.setInt(1, streamid1);
						
						try(ResultSet r2=p3.executeQuery();
							 )
						{
							if(r2.next())
							{
								p2.setStreamname(r2.getString("c_stream"));
							}
						}
					}
					
					int semid=r1.getInt("i_Semester_id");
					try(PreparedStatement p4=c1.prepareStatement("select i_semester_value from semester_table where i_Semester_id=? AND i_stream_id=?");
						  )
					{
						p4.setInt(1, semid);
						p4.setInt(2,streamid1);
						
						try(ResultSet r3=p4.executeQuery();
							  )
						{
							if(r3.next())
							{
								p2.setSemesterid(r3.getInt("i_semester_value"));
							}
						}
					}
					
					p2.setYear(r1.getInt("i_year"));
					
					int papertypeid=r1.getInt("i_papertype_id");
					try(PreparedStatement p5=c1.prepareStatement("Select c_type from papertype_table where i_papertype_id=?");
						  )
					{
						p5.setInt(1, papertypeid);
						try(ResultSet r4=p5.executeQuery();
							  )
						{
							if(r4.next())
							{
								p2.setPapertype(r4.getString("c_type"));
							}
						}
					}
				}
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p2;
	}
	@Override
	public int updatePDF(Connection c1, Paper paper)
	{
		try(PreparedStatement p1=c1.prepareStatement("Update paper_table set PDF=? where i_Paper_id=?");
			  )
		{
			p1.setBlob(1, paper.getPDF());
			p1.setInt(2, paper.getPaperid());
			return p1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int setSubject(Connection c1, Subject s1)
	{
		try(PreparedStatement p1=c1.prepareStatement("Insert into subject_table (c_subject_name,"
				+ "i_stream_id,i_Semester_id,i_subject_credit,i_differenciate) values(?,?,?,?,?)");
			  )
		{
			p1.setString(1, s1.getSubjectName());
			p1.setInt(2, Integer.parseInt(s1.getStream()));
			p1.setInt(3,Integer.parseInt(s1.getSem()));
			p1.setInt(4, Integer.parseInt(s1.getSubjectcredit()));
			p1.setInt(5,s1.getSubjecttype());
			
			return p1.executeUpdate();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List<Subject> selectSubject(Connection c1, String stream, String semester)
	{
		List<Subject> Subjectlist=new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement("Select * from subject_table where i_stream_id=? AND i_Semester_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(stream));
			p1.setInt(2, Integer.parseInt(semester));
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					Subject s1=new Subject();
					s1.setSubjectName(r1.getString("c_subject_name"));
					s1.setSubjectId(r1.getInt("i_Subject_id"));
					
					Subjectlist.add(s1);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Subjectlist;
	}
	@Override
	public int removeSubject(Connection c1, String id) 
	{
		try(PreparedStatement p1=c1.prepareStatement("Delete * from subject_table where i_Subject_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(id));
			return p1.executeUpdate();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int deletSubjectFromAssFacultyTable(Connection c1, String id)
	{
		
		try(PreparedStatement p1=c1.prepareStatement("Delete * from ass_faculty_table where i_Subject_id=? ");
			  )
		{
			
			p1.setInt(1, Integer.parseInt(id));
			return p1.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int deletSubjectFromfaculty_subject_table(Connection c1, String id) 
	{
		try(PreparedStatement p1=c1.prepareStatement("Delete * from faculty_subject_table where i_Subject_id=? ");
			  )
		{
			p1.setInt(1, Integer.parseInt(id));
			return p1.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int deletdeletSubjectFromfaculty_notes_table(Connection c1, String id)
	{
		try(PreparedStatement p1=c1.prepareStatement("Delete * from faculty_notes_table where i_Subject_id=? ");
				  )
			{
				p1.setInt(1, Integer.parseInt(id));
				return p1.executeUpdate();
			}
		catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return 0;
	}
	@Override
	public int clearnotice_table(Connection c1)
	{
		try(PreparedStatement p1=c1.prepareStatement("delete * from notice_table");
			 )
		{
			return p1.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int clearass_faculty_table(Connection c1) 
	{
		try(PreparedStatement p1=c1.prepareStatement("delete * from ass_faculty_table");
			  )
		{
			return p1.executeUpdate();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int clearass_student_table(Connection c1) 
	{
		try(PreparedStatement p1=c1.prepareStatement("delete * from ass_student_table");
				  )
			{
				return p1.executeUpdate();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
					e.printStackTrace();
			}
		
		return 0;
	}
	@Override
	public int clearfaculty_notes_table(Connection c1)
	{
		try(PreparedStatement p1=c1.prepareStatement("delete * from ass_student_table");
				  )
			{
				return p1.executeUpdate();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
					e.printStackTrace();
			}
		
		return 0;
	}
}
