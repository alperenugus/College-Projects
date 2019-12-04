
public class CountClumps {

	public static int countClumps(int[] nums) {
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
		return count;
	}

	public static void main(String[] args) {
		int[] a = {1, 1, 1, 1, 1, 2, 2};
		System.out.println(countClumps(a));
		

	}

}
