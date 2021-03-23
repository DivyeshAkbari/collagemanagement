package com.collagemanagement.Result.Servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.collagemanagement.bean.Marks;

public class ReadExcelFileDemo1 implements Runnable
{
	public InputStream excelfile;
	public ReadExcelFileDemo1(InputStream excelfile)
	{
		this.excelfile=excelfile;
	}
	
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
	public void run() 
	{
		int Streamid=0;
		int semid=0;
		int studentID=0;
		int year=0;
		int sum=0;
		int count=0;
		int subjectcredit=0;
		int sum1=0;
		
		
		
		Map<Integer ,Integer> subjectidcolomidmap=new HashedMap<>();
		try 
		{
			//FileInputStream fis = new FileInputStream(new File("S:Book1.xlsx"));
			//FileInputStream fis = new FileInputStream(file);   //obtaining bytes from the file  
			//creating Workbook instance that refers to .xlsx file  
			//XSSFWorkbook wb = new XSSFWorkbook(fis);
			XSSFWorkbook wb2 = new XSSFWorkbook(OPCPackage.open(excelfile));
			XSSFSheet sheet = wb2.getSheetAt(0); // creating a Sheet object to retrieve object
			Iterator<Row> itr = sheet.iterator(); // iterating over excel file
			
			while (itr.hasNext()) 
			{	
				
				
				
				//System.out.println("ITR "+itr);
				Row row = itr.next();
				
				System.out.println("Row Number is "+row.getRowNum());
				Iterator<Cell> cellIterator = row.cellIterator(); // iterating over each column
				
				int p=0;
				//System.out.println("Pela while loop ni andar "+i);
				while (cellIterator.hasNext())
				{
					//int streami=0;
					int i=0;
					//System.out.println("Cell Iterator"+cellIterator);
					Cell cell = cellIterator.next();
					System.out.println("cell is "+cell);
					switch (cell.getCellTypeEnum())
					{
					
					case STRING:
						if(row.getRowNum()==0 && cell.getColumnIndex()==0)
						{
							System.out.println("yes yes yes ");
							String streamname=cell.getStringCellValue();
							//TODO Get Stream  id From the stream name from databse 
							
							try(Connection connection =getconnection();
									
								PreparedStatement p1=connection.prepareStatement("Select i_stream_id from stream_table where c_stream=?");
								  )
							{
								System.out.println("Stream name is "+streamname);
								p1.setString(1, streamname);
								System.out.println("Try ma aavi gaya ");
								//int subjectid=0;
								try(ResultSet resultset1=p1.executeQuery();
									  )
								{
									System.out.println("Result set ma pan aavi gaya");
									System.out.println("Result set is "+resultset1);
												
									while(resultset1.next())
									{
										System.out.println("ye hee ");
										 Streamid=resultset1.getInt("i_stream_id");
										System.out.println("Stream id is "+Streamid);
									}
								}
								catch(Exception e)
								{
									e.printStackTrace();
								}
							}
						}
							
						if(row.getRowNum()==1 && cell.getColumnIndex()>0)
						{
							String subjectname=cell.getStringCellValue();
							count++;
							//TODO Get subject id from databse using subject name
							
							try(Connection connection =getconnection();
								PreparedStatement p1=connection.prepareStatement("Select i_Subject_id,i_subject_credit from subject_table where c_subject_name=? AND i_stream_id=? AND i_Semester_id=?");
								  )
							{
								p1.setString(1, subjectname);
								p1.setInt(2, Streamid);
								p1.setInt(3, semid);
								int subjectid=0;
								
								
								try(ResultSet resultset=p1.executeQuery();
									  )
								{
									while(resultset.next())
									{
										subjectid=resultset.getInt("i_Subject_id");
										subjectcredit=resultset.getInt("i_subject_credit");
										sum1=sum1+subjectcredit;
										
										System.out.println("Subject  id is "+subjectid);
										System.out.println("Subject Credit is "+subjectcredit);
										System.out.println("Sum1 is "+sum1);
									}
								}
								subjectidcolomidmap.put(cell.getColumnIndex(), subjectid);
								
							}
						}
							 //aa databse mathi aavse
						
							
							//	p=1;
						break;
					case NUMERIC: // field that represents number cell type
						if(row.getRowNum()==0 && cell.getColumnIndex()==2)
						{
							int  Semester=(int) cell.getNumericCellValue();
							//TODO Get String Semesterid From the  from databse using stream id  	
							
							semid=0;  //aa databse mathi
							//select semester id from sem table where streamid = && sem value =Semester 
							
							System.out.println("Semester is "+Semester);
							
							try(Connection connection =getconnection();
									PreparedStatement p1=connection.prepareStatement("Select i_Semester_id from semester_table where i_stream_id=? AND i_semester_value=?");
								  )
							{
								p1.setInt(1, Streamid);
								p1.setInt(2, Semester);
								
								System.out.println("Stream id is "+Streamid);
								System.out.println("Semester id is "+Semester);
								
								try(ResultSet resultset=p1.executeQuery();
									  )
								{
									while(resultset.next())
									{
										System.out.println("Yuppoo");
										semid=resultset.getInt("i_Semester_id");
										System.out.println("Sem   id is "+semid);
									}
								}
							}	
						}
					
						if(row.getRowNum()>1 && cell.getColumnIndex()==0)
						{
							long  enrollmentnumber=(long) cell.getNumericCellValue();
							
							//TODO Get studnet  id from databse using Enrollment  number
							
							//int  studentID=0; //data base mathi aavse
							 try(Connection connection =getconnection();
									PreparedStatement p1=connection.prepareStatement("Select i_user_id from user_table where i_user_id=?");
								   )
								{
									p1.setLong(1, enrollmentnumber);
									
									System.out.println("Try ni andar studentid vala ma ");
									
								//	int subjectid;
									
									System.out.println("User id is"+enrollmentnumber);
									try(ResultSet resultset2=p1.executeQuery();
										  )
									{
										System.out.println("Resultset ni andar studentid vala ma ");
										while(resultset2.next())
										{
											 studentID=resultset2.getInt("i_user_id");
											System.out.println("Student  id is "+ studentID);
										}
									}
								}
							} 
						
						if(row.getRowNum()==0 && cell.getColumnIndex()==1)
						{
							year=(int)cell.getNumericCellValue();
							System.out.println("is year "+year);
						}
						
						if(row.getRowNum()>1  && cell.getColumnIndex()>0)
						{
							int  marksvalue=(int) cell.getNumericCellValue();
							
							Marks marks=new Marks();
							
							marks.setMarksvalue(marksvalue);
							sum=sum+marksvalue;
							marks.setSemId(semid);
							marks.setStudentId(studentID);
							System.out.println("AAya student id aa che "+marks.getStudentId());
							marks.setSubjectId(subjectidcolomidmap.get(cell.getColumnIndex()));
							
							
							try(Connection c1=getconnection();
									PreparedStatement p1=c1.prepareStatement("insert into marks_table (i_user_id,i_Semester_id,i_Subject_id,i_marks_value) values (?,?,?,?)");
								  )
							{
								p1.setInt(1, marks.getStudentId());
								p1.setInt(2, marks.getSemId());
								p1.setInt(3, marks.getSubjectId());
								p1.setInt(4,marks.getMarksvalue());
								
								int i1=p1.executeUpdate();
								
								if(i1>0)
								{
									System.out.println("Marks Inserted");
								}
								else
								{
									System.out.println("Marks not inserted");
								}	
							}	
						}
						
						 System.out.print(cell.getNumericCellValue() + "\t\t");
						
					default:
						break;
					}
				}
				
				if(studentID!=0)
				{
							System.out.println("Subject credit sum is "+sum1);
							try(Connection c1=getconnection();
							PreparedStatement p1=c1.prepareStatement("insert into result_table (c_Result_date,i_user_id,i_Semester_id,c_Status) values (?,?,?,?)");
							)
					{
								p1.setInt(1, year);
								p1.setInt(2,studentID);
								p1.setInt(3,semid);
								
								if(sum/count>=33)
								{
									p1.setString(4,"PASS");
								}
								else
								{
									p1.setString(4,"FAIL");
								}
								
								int i1=p1.executeUpdate();
		
								if(i1>0)
								{
									System.out.println("Result Data inserted Successfully");
								}
								else
								{
									System.out.println("Not ");
								}
					}
				}
				System.out.println("");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		//return result1;
	}
}