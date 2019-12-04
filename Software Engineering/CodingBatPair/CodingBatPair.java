// Authors: Alperen UGUS and Murat TUTER

// evenlySpaced exercise

	public boolean evenlySpaced(int a, int b, int c) {
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

// plusOut exercise

	public static String plusOut(String str, String word) {
		StringBuilder result = new StringBuilder(str.length());
		int index = str.indexOf(word);
		int i = 0;

		while (index != -1) {
			while (i < index) {
				result.append('+');
				i++;
			}
			result.append(word);
			i = index + word.length();
			index = str.indexOf(word, i);
		}
		for (; i < str.length(); i++) {
			result.append('+');
		}

		return result.toString();

		/*
		Expected This Run   
		plusOut("12xy34", "xy") → "++xy++"	"++xy++"	OK	
		plusOut("12xy34", "1") → "1+++++"	"1+++++"	OK	
		plusOut("12xy34xyabcxy", "xy") → "++xy++xy+++xy"	"++xy++xy+++xy"	OK	
		plusOut("abXYabcXYZ", "ab") → "ab++ab++++"	"ab++ab++++"	OK	
		plusOut("abXYabcXYZ", "abc") → "++++abc+++"	"++++abc+++"	OK	
		plusOut("abXYabcXYZ", "XY") → "++XY+++XY+"	"++XY+++XY+"	OK	
		plusOut("abXYxyzXYZ", "XYZ") → "+++++++XYZ"	"+++++++XYZ"	OK	
		plusOut("--++ab", "++") → "++++++"	"++++++"	OK	
		plusOut("aaxxxxbb", "xx") → "++xxxx++"	"++xxxx++"	OK	
		plusOut("123123", "3") → "++3++3"	"++3++3"	OK	
		other tests OK
		*/

	}


// countClumps exercise

	public int countClumps(int[] nums) {
		int count = 0;
		int i = 0;
		boolean same = false;

		while (i < nums.length - 1) {
			if (!same && nums[i] == nums[i + 1]) {
				count++;
				same = true;
			} else if (nums[i] != nums[i + 1]) {
				same = false;
			}
			i++;

		}
		return count;

		/*
		Expected This Run   
			countClumps([1, 2, 2, 3, 4, 4]) → 2	2	OK	
			countClumps([1, 1, 2, 1, 1]) → 2	2	OK	
			countClumps([1, 1, 1, 1, 1]) → 1	1	OK	
			countClumps([1, 2, 3]) → 0	0	OK	
			countClumps([2, 2, 1, 1, 1, 2, 1, 1, 2, 2]) → 4	4	OK	
			countClumps([0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]) → 4	4	OK	
			countClumps([0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]) → 5	5	OK	
			countClumps([0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]) → 5	5	OK	
			countClumps([]) → 0	0	OK	
			other tests OK	
		*/

	}
	

// fix34 exercise

	public int[] fix34(int[] nums) {

		int index;

		for (int i = 0; i < nums.length; i++) {
			if (nums[i] == 3) {
				for(int j = 0; j < nums.length ; j++) {
					if(nums[j] == 4 && nums[i + 1] != 4 && nums[ j - 1] != 3) {
						int temp = nums[i + 1];
						nums[i + 1] = 4;
						nums[j] = temp;
					}
				}
			}

		}
		
		return nums;

		/*
		Expected this run
		fix34([1, 3, 1, 4]) → [1, 3, 4, 1]	[1, 3, 4, 1]	OK	
		fix34([1, 3, 1, 4, 4, 3, 1]) → [1, 3, 4, 1, 1, 3, 4]	[1, 3, 4, 1, 1, 3, 4]	OK	
		fix34([3, 2, 2, 4]) → [3, 4, 2, 2]	[3, 4, 2, 2]	OK	
		fix34([3, 2, 3, 2, 4, 4]) → [3, 4, 3, 4, 2, 2]	[3, 4, 3, 4, 2, 2]	OK	
		fix34([2, 3, 2, 3, 2, 4, 4]) → [2, 3, 4, 3, 4, 2, 2]	[2, 3, 4, 3, 4, 2, 2]	OK	
		fix34([5, 3, 5, 4, 5, 4, 5, 4, 3, 5, 3, 5]) → [5, 3, 4, 5, 5, 5, 5, 5, 3, 4, 3, 4]	[5, 3, 4, 5, 5, 5, 5, 5, 3, 4, 3, 4]	OK	
		fix34([3, 1, 4]) → [3, 4, 1]	[3, 4, 1]	OK	
		fix34([3, 4, 1]) → [3, 4, 1]	[3, 4, 1]	OK	
		fix34([1, 1, 1]) → [1, 1, 1]	[1, 1, 1]	OK	
		fix34([1]) → [1]	[1]	OK	
		fix34([]) → []	[]	OK	
		fix34([7, 3, 7, 7, 4]) → [7, 3, 4, 7, 7]	[7, 3, 4, 7, 7]	OK	
		fix34([3, 1, 4, 3, 1, 4]) → [3, 4, 1, 3, 4, 1]	[3, 4, 1, 3, 4, 1]	OK	
		fix34([3, 1, 1, 3, 4, 4]) → [3, 4, 1, 3, 4, 1]	[3, 4, 1, 3, 4, 1]	OK	
		other tests OK
		*/

	}
