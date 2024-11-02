package tw.idv.jay.game.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Scanner;

public class GoodGame {
	static BigDecimal bigDecimal = new BigDecimal((int) (Math.random() * 90) + 11);
	static BigDecimal bigDecimalAdd;
	static BigDecimal bigDecimalAddAns = new BigDecimal(bigDecimal.toString());
	static ArrayList<ArrayList<String>> arrAll = new ArrayList<>();
	static int rows = (int) (Math.random() * 10) + 3;
	static int cols = (int) (Math.random() * 3) + 3;
	static String[] elements = { "+", "-", "*", "/", "?","?" };


	public static void main(String[] args) {
		for (int i = 0; i < rows; i++) {
			ArrayList<String> row = new ArrayList<>();
			for (int j = 0; j < cols; j++) {
				int randomIndex = (int) (Math.random() * elements.length);
				if (randomIndex < 2) {
					row.add(elements[randomIndex] + ((int) (Math.random() * 100) + 1));
				} else if (randomIndex < 4) {
					row.add(elements[randomIndex] + ((int) (Math.random() * 3) + 2));
				} else {
					row.add(elements[randomIndex]);
				}
			}
			arrAll.add(row);
		}
//		System.out.println(arrAll);

		ArrayList<ArrayList<String>> newArrAll = new ArrayList<>();
		for (int i = 0; i < arrAll.size(); i++) {

			ArrayList<ArrayList<String>> resultArrAlli = new ArrayList<>();
			int[] recordArrii = new int[arrAll.get(i).size()];
			arrange(arrAll.get(i), resultArrAlli, recordArrii);
//			System.err.println("ANS: " + resultArrAlli);

			ArrayList<String> bestArri = findTheBest(resultArrAlli);
//			System.err.println("bestArri: " + bestArri);
			if(!bestArri.isEmpty()) {
			newArrAll.add(bestArri);}
		}

		while (true) {
			if (bigDecimal.compareTo(BigDecimal.ZERO) <= 0) {
				System.err.println("You're dead");
				break;
			}
			System.err.println("Enter 1,2.. your damage:" + bigDecimal);
			if (newArrAll.get(0).isEmpty()) {
				newArrAll.remove(0);
			}
			for (ArrayList<String> column : newArrAll) {// turn 90. is difficult
				for (String row : column) {
					System.out.print(row + " ");
				}
				System.out.println();
			}

			Scanner scanner = new Scanner(System.in);

			if (scanner.hasNextInt()) {
				int x = scanner.nextInt() - 1;
				if (x < newArrAll.get(0).size() && x >= 0) {
					char operator = newArrAll.get(0).get(x).charAt(0);
					switch (operator) {
					case '+': {
						BigDecimal newBig = new BigDecimal(newArrAll.get(0).get(x).replace("+", ""));
						bigDecimal = bigDecimal.add(newBig);
						newArrAll.get(0).remove(x);
						break;
					}
					case '-': {
						BigDecimal newBig = new BigDecimal(newArrAll.get(0).get(x).replace("-", ""));
						bigDecimal = bigDecimal.subtract(newBig);
						newArrAll.get(0).remove(x);
						break;
					}
					case '*': {
						BigDecimal newBig = new BigDecimal(newArrAll.get(0).get(x).replace("*", ""));
						bigDecimal = bigDecimal.multiply(newBig);
						newArrAll.get(0).remove(x);
						break;
					}
					case '/': {
						BigDecimal newBig = new BigDecimal(newArrAll.get(0).get(x).replace("/", ""));
						bigDecimal = bigDecimal.divide(newBig, 0, RoundingMode.HALF_UP);
						newArrAll.get(0).remove(x);
						break;
					}
					default: {
						BigDecimal newBig = new BigDecimal(newArrAll.get(0).get(x));
						if (bigDecimal.compareTo(newBig) < 0) {
							bigDecimal = BigDecimal.ZERO;
							break;
						}
						bigDecimal = bigDecimal.add(newBig);
						newArrAll.get(0).remove(x);
						break;
					}
					}
				}

			}
		}

	}

	static ArrayList<String> oneOfArrAllii = new ArrayList<>();

	private static void arrange(ArrayList<String> arrAlli, ArrayList<ArrayList<String>> resultArrAlli,
			int[] recordArrii) {
		if (oneOfArrAllii.size() == arrAlli.size()) {

			resultArrAlli.add(new ArrayList<>(oneOfArrAllii));
			// System.err.println(resultArrAlli);
			return;
		}
		for (int i = 0; i < arrAlli.size(); i++) {

			if (recordArrii[i] < 1) {
				oneOfArrAllii.add(arrAlli.get(i));
				recordArrii[i] = recordArrii[i] + 1;
				// System.out.println(Arrays.toString(recordArrii));
				arrange(arrAlli, resultArrAlli, recordArrii);
				recordArrii[i] = recordArrii[i] - 1;
				oneOfArrAllii.remove(arrAlli.get(i));
			}
		}

		return;
		// for(arrAlli)

	}

	private static ArrayList<String> findTheBest(ArrayList<ArrayList<String>> arrange) {
		ArrayList<String> arrayList = new ArrayList<>();
		BigDecimal bigest = new BigDecimal(0);

		for (ArrayList<String> column : arrange) {
			bigDecimalAdd = new BigDecimal(bigDecimalAddAns.toString());

			int index = -1;
			for (String row : column) {
				index++;
				if (bigDecimalAdd.compareTo(BigDecimal.ZERO) <= 0) {
//					System.err.println("You're dead");
					break;
				}
				if (true) {
					char operator = row.charAt(0);
					switch (operator) {
					case '+': {
						BigDecimal newBig = new BigDecimal(row.replace("+", ""));
						bigDecimalAdd = bigDecimalAdd.add(newBig);
						break;
					}
					case '-': {
						BigDecimal newBig = new BigDecimal(row.replace("-", ""));
						bigDecimalAdd = bigDecimalAdd.subtract(newBig);
						break;
					}
					case '*': {
						BigDecimal newBig = new BigDecimal(row.replace("*", ""));
						bigDecimalAdd = bigDecimalAdd.multiply(newBig);
						break;
					}
					case '/': {
						BigDecimal newBig = new BigDecimal(row.replace("/", ""));
						bigDecimalAdd = bigDecimalAdd.divide(newBig, 0, RoundingMode.HALF_UP);
						break;
					}
					default: {
						BigDecimal newBig = new BigDecimal(bigDecimalAdd.subtract(new BigDecimal("1")).toString());
						column.set(index, newBig.toString());
						bigDecimalAdd = bigDecimalAdd.add(newBig);
						break;
					}
					}
				}

			}

			if (bigDecimalAdd.compareTo(bigest) > 0) {
				bigest = bigDecimalAdd;
				arrayList = column;
//				System.out.println("bigest: " + bigest + " arrayList: " + arrayList);
			}
		}
		if(bigest.compareTo(BigDecimal.ZERO)>0) {
		bigDecimalAddAns = new BigDecimal(bigest.toString());}
		return arrayList;
	}

}
