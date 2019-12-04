
// evenlySpaced exercise 

public class CodingBatPair {

	public static boolean evenlySpaced(int a, int b, int c) {
		int big;
		int medium;
		int small;

		if (a < b && a < c) {
			small = a;
			if (b < c) {
				medium = b;
				big = c;
			}

			else {
				medium = c;
				big = b;
			}
		}

		else if (b < a && b < c) {
			small = b;
			if (a < c) {
				medium = a;
				big = c;
			} else {
				medium = c;
				big = a;
			}
		} else {
			small = c;
			if (a < b) {
				medium = a;
				big = b;
			} else {
				medium = b;
				big = a;
			}
		}
		
		if(big - medium == medium - small) return true;
		else return false;
		
		/*
		Expected This Run   
		evenlySpaced(2, 4, 6) → true	true	OK	
		evenlySpaced(4, 6, 2) → true	true	OK	
		evenlySpaced(4, 6, 3) → false	false	OK	
		evenlySpaced(6, 2, 4) → true	true	OK	
		evenlySpaced(6, 2, 8) → false	false	OK	
		evenlySpaced(2, 2, 2) → true	true	OK	
		evenlySpaced(2, 2, 3) → false	false	OK	
		evenlySpaced(9, 10, 11) → true	true	OK	
		evenlySpaced(10, 9, 11) → true	true	OK	
		evenlySpaced(10, 9, 9) → false	false	OK	
		evenlySpaced(2, 4, 4) → false	false	OK	
		evenlySpaced(2, 2, 4) → false	false	OK	
		evenlySpaced(3, 6, 12) → false	false	OK	
		evenlySpaced(12, 3, 6) → false	false	OK	
		other tests OK
		*/

	}

	public static void main(String[] args) {
		System.out.println(evenlySpaced(2, 4, 6));
		System.out.println(evenlySpaced(4, 6, 2));
		System.out.println(evenlySpaced(4, 6, 3));

	}

}
