package com.collagemanagement.service.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Marks;
import com.collagemanagement.bean.Paper;
import com.collagemanagement.bean.Papertype;
import com.collagemanagement.bean.Result;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao.impl.ResultSectionDaoImpl;
import com.collagemanagement.dao1.ResultSectionDao;
import com.collagemanagement.service1.ResultSectionService;

public class ResultSectionServiceImpl implements ResultSectionService
{
	ResultSectionDao Dao=new ResultSectionDaoImpl();
	public static Connection getconnection()
	{
		Connection c1=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/educhamp_schema","root","root");
		}
		catch(SQLException  |ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return c1;
	}
	@Override
	public List<Subject> fetachSubjectDetails(String streamid, String semid,int i) 
	{
		
		try(Connection c1=getconnection();
			 )
		{
			return Dao.getSubjectDetails(c1,streamid,semid,i);
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Marks> fatchMarksDetails(int id, String semid)
	{
		try(Connection c1=getconnection();
			  )
		{
			return Dao.getMarksDetails(c1,id,semid);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Semester> getSemvalue(int id)
	{
		try(Connection c1=getconnection();
			  )
		{
			return Dao.fetchSemvalue(c1,id);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public User fetchEmailid(User u1) 
	{ 
		User user=null;
		try(Connection c1=getconnection();
			 )
		{
			 user=Dao.getEmailid(c1,u1);
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public Result fetchStatusDetails(int id,String semid)
	{
		try(Connection c1=getconnection();
			  )
		{
			return Dao.getStatusDetails(c1,id,semid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int fetchStreamId(String sem,int i)
	{
		try(Connection c1=getconnection();)
		{
			return Dao.getStreamId(c1,sem,i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List<Subject> fetchSubjectDetails(String sem)
	{
		try(Connection c1=getconnection();)
		{
			return Dao.GetSubjectDetails(c1,sem);
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String InsertPaperDetails(Paper p1) 
	{
		try(Connection c1=getconnection();)
		{
			int i1=Dao.setPaperDetails(c1,p1);
			if(i1>0)
			{
				return "Inserted";
			}
			else
			{
				return "Not";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Semester> fetchSemvalue(int id) 
	{
		try(Connection c1=getconnection();
				  )
			{
				return Dao.getSemvalue(c1,id);
			}
		catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;	
	}
	@Override
	public List<Paper> fetchYearDetails(Paper p1) 
	{
		try(Connection c1=getconnection();
			 )
		{
			return Dao.getYearDetails(c1,p1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int fetchPaperID(Paper paper)
	{
		try(Connection c1=getconnection();
			  )
		{
			return Dao.getPaperID(c1,paper);
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List<Papertype> fetchPapertype() 
	{
		try(Connection c1=getconnection();)
		{
			return Dao.getPapertype(c1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public InputStream getPDf(int id) 
	{
		try(Connection c1=getconnection();)
		{
			return Dao.fetchPaper(c1,id);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String validatePaperYear(Paper paper)
	{
		try(Connection c1=getconnection();
			)
		{
			int i1=Dao.validatePaper(c1,paper);
			if(i1>0)
			{
				return "found";
			}
			else
			{
				return "not";
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Paper> fetchPaperData(String streamid)
	{
		try(Connection c1=getconnection();
			  )
		{
			return Dao.getPaperData(c1,streamid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Paper fetchPaperDetails(String id)
	{
		try(Connection c1=getconnection();
			 )
		{
			return Dao.getpaperDetails(c1,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String changePDF(Paper paper) 
	{
		try(Connection c1=getconnection();
			  )
		{
			int i1=Dao.updatePDF(c1,paper);
			if(i1>0)
			{
				return "Yupoo";
			}
			else
			{
				return "Nope";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String insertSubject(Subject s1)
	{
		try(Connection c1=getconnection();
			  )
		{
			int i1=Dao.setSubject(c1,s1);
			if(i1>0)
			{
				return "Yupoo";
			}
			else
			{
				return "not";
			}
				
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Subject> fetchSubject(String stream, String semester) {
		// TODO Auto-generated method stub
		
		try(Connection c1=getconnection();
			  )
		{
			return Dao.selectSubject(c1,stream,semester);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	@Override
	public String deletSubject(String id) 
	{
		try(Connection c1=getconnection();
			  )
		{
			int i1=Dao.removeSubject(c1,id);
			int i2=Dao.deletSubjectFromAssFacultyTable(c1,id);
			int i3=Dao.deletSubjectFromfaculty_subject_table(c1,id);
			int i4=Dao.deletdeletSubjectFromfaculty_notes_table(c1,id);
			
			if(i4>0)
			{
				System.out.println("subject deleted from faculty_notes_table");
			}
			else
			{
				System.out.println("subject  not deleted from faculty_notes_table");
			}
			if(i3>0)
			{
				System.out.println("subject deleted from faculty_subject_table" );
			}
			else
			{
				System.out.println("subject Not deleted from faculty_subject_table" );
			}
			if(i2>0)
			{
				System.out.println("subject deleted from ass_faculty_table");
			}
			else
			{
				System.out.println("subject Not  deleted from ass_faculty_table");
			}
			if(i1>0)
			{
				return "done";
			}
			else
			{
				return "no";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String  deletnotice_table()
	{
		try(Connection c1=getconnection();
			  )
		{
			int i1=Dao.clearnotice_table(c1);
			if(i1>0)
			{
				return "Notice table has been cleared";
			}
			else
			{
				return "not";
			}
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String deletass_faculty_table()
	{
		try(Connection c1=getconnection();
			 )
		{
			int i1=Dao.clearass_faculty_table(c1);
			if(i1>0)
			{
				return "ass_faculty_table has been cleared";
			}
			else
			{
				return "not";
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		return null;
		}
	}
	@Override
	public String deletass_student_table()
	{
		
		try(Connection c1=getconnection();
				 )
			{
				int i1=Dao.clearass_student_table(c1);
				if(i1>0)
				{
					return "ass_student_table has been cleared";
				}
				else
				{
					return "not";
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			return null;
			}
	}
	@Override
	public String deletfaculty_notes_table()
	{
		try(Connection c1=getconnection();
			 )
		{
			int i1=Dao.clearfaculty_notes_table(c1);
			if(i1>0)
			{
				return "faculty_notes_table has been cleared";
			}
			else
			{
				return "not";
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		return null;
		}
	}
}
