// Author: Alperen UGUS
// CWID: 10864101

	
// Since TreeMap uses Red-Black Tree Structure, it always inserts
// elements in a sorted manner. Because of that reason, when we 
// iterate on a TreeMap, the elements are always sorted by 
// their keys. This is not valid for HashMaps.

// Since Map itself is an interface, we cannot instantiate the type
// Map<String,String>

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class Courses {

    private HashMap<String, String> courses;
    //private TreeMap<String, String> courses;
	//private Map<String, String> courses;

	public Courses() {
		courses = new HashMap<String, String>(); 
		//courses = new TreeMap<String, String>(); 
		//courses = new Map<String, String>(); 
	}
	
	public void getEntry() {
		// Scanner Object to get input from the user
		Scanner in = new Scanner(System.in);
		String studentName = "";
		String favCourse = "";
		
		
		while(true) {
			System.out.print("Enter the student name or Q to quit: ");
			studentName = in.next();
			// Continue until the user enters 'Q' or 'q'
			if(studentName.equalsIgnoreCase("Q")) break;
			System.out.print("Enter the favorite course: ");
			favCourse = in.next();
			// Add the entries to the map
			courses.put(studentName, favCourse);
		}	
	}
	
	public void printMap() {
		Iterator iterator = courses.entrySet().iterator();
		
		// Using an iterator, iterate over the map
		while (iterator.hasNext()) { 
            Map.Entry mapElement = (Map.Entry)iterator.next(); 
            System.out.println(mapElement.getKey() + " : " + mapElement.getValue()); 
        } 
		
	}
	
	public static void main(String[] args) {
		Courses cs = new Courses();
		cs.getEntry();
		cs.printMap();
	}
	
	
	

}
