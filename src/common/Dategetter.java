package common;

import java.sql.Date;

public class Dategetter {
	@SuppressWarnings("deprecation")
	public static Date toDate(String yyyy_mm_dd) throws DateformatException {
		Date date = null;
		String year, month, day;
		//System.out.println("hello");
		int ye, mo, da, next, last;
		if (yyyy_mm_dd == null) {
			throw new DateformatException("null string");
		}
		yyyy_mm_dd.trim();
		int length = yyyy_mm_dd.length();
		if (length < 7) {
			throw new DateformatException("string length is less than required");
		}
		char c1, c2;
		c1 = yyyy_mm_dd.charAt(4);
		c2 = yyyy_mm_dd.charAt(length - 5);
		//System.out.println(c1);
		if (c1 < '0' || c1 > '9') {
			year = yyyy_mm_dd.substring(0, 4);
			//System.out.println(c1);
			if (year.indexOf(c1) == -1) {
				ye = Integer.parseInt(year);
				//System.out.println(ye);
				ye -= 1900;
				if (ye < 0) {
					throw new DateformatException("year not matched");
				}
				next = yyyy_mm_dd.indexOf(c1, 5);
				month = yyyy_mm_dd.substring(5, next);
				mo = Integer.parseInt(month);
				//System.out.println(mo);
				mo = mo -1;
				if (mo > 12) {
					throw new DateformatException("month not matched");
				}
				last = yyyy_mm_dd.lastIndexOf(c1);
				if (next != last) {
					throw new DateformatException("Invalid String");
				}
				day = yyyy_mm_dd.substring(next + 1);
				da = Integer.parseInt(day);
				if (da < 0 && da > 31) {
					throw new DateformatException("Invalid String");
				}
				date = new Date(ye, mo, da);
				return date;
			}
			}
		if (c2 < '0' || c2 > '9') {
			year = yyyy_mm_dd.substring(length-4, length-1);
//System.out.println(c2);
			if (year.indexOf(c2) == -1) {
				ye = Integer.parseInt(year);
				ye -= 1900;
				if (ye < 0) {
					throw new DateformatException("year not matched");
				}
				next = yyyy_mm_dd.lastIndexOf(c2, 4);
				month = yyyy_mm_dd.substring(next + 1,4);
				mo = Integer.parseInt(month);
				mo--;
				if (mo > 12) {
					throw new DateformatException("month not matched");
				}
				last = yyyy_mm_dd.indexOf(c2);
				if (next != last) {
					throw new DateformatException("Invalid String");
				}
				day = yyyy_mm_dd.substring(0,next - 1);
				da = Integer.parseInt(day);
				if (da < 0 && da > 31) {
					throw new DateformatException("Invalid String");
				}
				date = new Date(ye, mo, da);
				return date;
			}
			}
		return date;
	}
}
