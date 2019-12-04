public class Fix34 {

	public static int[] fix34(int[] nums) {

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
	
	public static void main(String[] args) {
		
		int[] a = {3, 2, 2, 4};
		fix34(a);
		
		for(int i = 0; i < a.length ; i++) {
			System.out.print(a[i] + " ");
		}

	}

}
