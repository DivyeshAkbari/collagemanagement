package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.Notice;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.AdminPanelDao;

public class AdminPanelDaoImpl implements AdminPanelDao {

	@Override
	public int fetchuserdetails(Connection connection) {

		String s1 = "STUDENT";
		String s2 = "male";

		int count = 0;

		try (PreparedStatement p1 = connection.prepareStatement(
				"Select c_gender from user_table where c_roll='" + s1 + "' AND c_gender='" + s2 + "'");) {
			try (ResultSet r1 = p1.executeQuery();) {
				while (r1.next()) {
					count++;

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return count;
	}

	@Override
	public int getTotalStudent(Connection connection) {
		// TODO Auto-generated method stub

		String s1 = "STUDENT";
		int count = 0;
		try (PreparedStatement p1 = connection
				.prepareStatement("SELECT i_user_id FROM user_table where c_roll='" + s1 + "'");) {

			try (ResultSet resultSet = p1.executeQuery()) {
				while (resultSet.next()) {
					count++;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int getTotalTeacher(Connection connection) {
		// TODO Auto-generated method stub

		String s1 = "FACULTY";
		int count1 = 0;
		try (PreparedStatement p1 = connection
				.prepareStatement("SELECT i_user_id FROM user_table where c_roll='" + s1 + "'");) {

			try (ResultSet resultSet = p1.executeQuery()) {
				while (resultSet.next()) {
					count1++;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count1;
	}

	@Override
	public int getTotalEarning(Connection connection) {
		// TODO Auto-generated method stub

		int sum = 0;
		try (PreparedStatement p1 = connection.prepareStatement("SELECT c_amount FROM student_fees_table");) {

			try (ResultSet resultSet = p1.executeQuery()) {
				while (resultSet.next()) {
					sum = sum + Integer.parseInt(resultSet.getString("c_amount"));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}

	@Override
	public int getFemaleStudent(Connection connection) {
		// TODO Auto-generated method stub

		String s1 = "STUDENT";
		String s2 = "female";

		int count = 0;

		try (PreparedStatement p1 = connection.prepareStatement(
				"Select c_gender from user_table where c_roll='" + s1 + "' AND c_gender='" + s2 + "'");) {
			try (ResultSet r1 = p1.executeQuery();) {
				while (r1.next()) {
					count++;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return count;
	}

	@Override
	public int getFemaleTeacher(Connection connection) {
		// TODO Auto-generated method stub

		String s1 = "FACULTY";
		String s2 = "female";

		int count = 0;

		try (PreparedStatement p1 = connection.prepareStatement(
				"Select c_gender from user_table where c_roll='" + s1 + "' AND c_gender='" + s2 + "'");) {
			try (ResultSet r1 = p1.executeQuery();) {
				while (r1.next()) {
					count++;

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return count;
	}

	@Override
	public int getmaleTeacher(Connection connection) {
		// TODO Auto-generated method stub

		String s1 = "FACULTY";
		String s2 = "male";

		int count = 0;

		try (PreparedStatement p1 = connection.prepareStatement(
				"Select c_gender from user_table where c_roll='" + s1 + "' AND c_gender='" + s2 + "'");) {
			try (ResultSet r1 = p1.executeQuery();) {
				while (r1.next()) {
					count++;

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return count;
	}

	@Override
	public List<FeesDetails> fetchSplinechartDetail(Connection connection) {
		// TODO Auto-generated method stub

		List<FeesDetails> chartlist = null;
		try (PreparedStatement preparedStatement = connection
				.prepareStatement("select d_payment_date,c_amount from student_fees_table")) {

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					FeesDetails feesDetails = new FeesDetails();

					String date = resultSet.getString("d_payment_date");

					String date1[] = date.split(" ");

					String date2[] = date1[0].split("-");

					String date3 = date2[0];

					feesDetails.setPaymentdate(date3);

					feesDetails.setAmount(resultSet.getString("c_amount"));

					System.out.println("Year from dao " + date3);

					chartlist.add(feesDetails);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chartlist;
	}

	@Override
	public int addNotice(Connection connection, Notice notice) {
		// TODO Auto-generated method stub

		int insertedRaws = 0;
		try (PreparedStatement p1 = connection.prepareStatement(
				"insert into notice_table(c_notice_title,c_notice_details,c_notice_date) values(?,?,?)");) {
			/* System Date **/

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(dtf.format(now));

			p1.setString(1, notice.getNoticetitle());
			p1.setString(2, notice.getNoticedetails());
			p1.setString(3, dtf.format(now));

			insertedRaws = p1.executeUpdate();

			if (insertedRaws == 1) {
				System.out.println("Notice Registered Successfully");
			} else {
				System.out.println("Notice Registered Failed");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertedRaws;
	}

	@Override
	public List<Notice> getNotice(Connection connection) {
		// TODO Auto-generated method stub

		List<Notice> noticelist = new ArrayList<>();

		try (PreparedStatement p1 = connection.prepareStatement("select * from notice_table");) {

			System.out.println("In dao");

			try (ResultSet resultSet = p1.executeQuery())
			{
				while (resultSet.next())
				{
					Notice notice = new Notice();
					
					notice.setNoticeId(resultSet.getInt("i_notice_id"));
					notice.setNoticetitle(resultSet.getString("c_notice_title"));
					notice.setNoticedetails(resultSet.getString("c_notice_details"));

					System.out.println("Details" + resultSet.getString("c_notice_details"));

					
					  String date = resultSet.getString("c_notice_date");
					  
					  String date1[] = date.split(" ");
					  
					  String date2[] = date1[0].split("/");
					  
						/*
						 * String year = date2[0]; String month = date2[1]; String date = date2[2];
						 * 
						 * notice.setNoticedate(date3);
						 * 
						 * System.out.println("Date "+date3);
						 */

					noticelist.add(notice);

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return noticelist;
	}
	
	@Override
	public int deletenoticeDetails(Connection connection, String noticeid) {
		// TODO Auto-generated method stub
		try(PreparedStatement p1 = connection.prepareStatement("delete from notice_table where i_notice_id=?");)
		{
			p1.setInt(1,Integer.parseInt(noticeid));
			
			return p1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
		
	}

	@Override
	public List<Stream> getStreamname(Connection connection) {
		// TODO Auto-generated method stub
		
		List<Stream> courseList = new ArrayList<>();
		try(PreparedStatement preparedStatement = connection.prepareStatement("select * from stream_table");)
		{
			System.out.println("In dao");
			
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				System.out.println("2nd try");
				while(resultSet.next())
				{
					System.out.println("while loop start");
					Stream stream = new Stream();
					stream.setStreamname(resultSet.getString("c_stream"));
					System.out.println("Stream"+resultSet.getString("c_stream"));
					courseList.add(stream);
					System.out.println("while loop end");
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return courseList;
	}
}