public class Driver {

	public static void main(String[] args) throws NotEnoughWeedException {
		Dispensary d = new Dispensary();
		Strain s1 = new Strain("Sour Diesel", 16.51);
		Strain s2 = new Strain("Purple Kush", 15.51);
		d.add(s1, 5);
		d.add(s2, 10);
		d.remove(s1, 2);
		d.remove(s2, 5);
	}
}
