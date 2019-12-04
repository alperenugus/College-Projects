import java.util.ArrayList;
import java.util.List;

public class PlusOut {

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
	}

	public static void main(String[] args) {
		System.out.println(plusOut("12xy34xyabcxy", "xy"));

	}

}
