package com.collagemanagement.bean;

public class Semester
{
		private int semid;
		private int semvalue;

		public int getSemid() {
			return semid;
		}

		@Override
		public String toString() {
			return "Semester [semid=" + semid + ", semvalue=" + semvalue + "]";
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
}
