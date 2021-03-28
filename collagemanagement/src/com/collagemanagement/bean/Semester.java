package com.collagemanagement.bean;

import java.util.List;

public class Semester
{
		private int semid;
		private int semvalue;
		private List<Subject> subjects;
		
		public int getSemid() {
			return semid;
		}

		

		@Override
		public String toString() {
			return "Semester [semid=" + semid + ", semvalue=" + semvalue + ", subjects=" + subjects + "]";
		}



		public void setSemid(int semid) {
			this.semid = semid;
		}

		public int getSemvalue() {
			return semvalue;
		}

		public void setSemvalue(int semvalue) {
			this.semvalue = semvalue;
		}

		public List<Subject> getSubjects() {
			return subjects;
		}

		public void setSubjects(List<Subject> subjects) {
			this.subjects = subjects;
		}
}
