public class Strain {
	private String aName;
	private double aThc;

	public Strain(String pName, double pThc) {
		this.aName = pName;
		this.aThc = pThc;
	}

	@Override
	public String toString() {
		return "Strain{" +
				"aName='" + aName + '\'' +
				", aThc=" + aThc +
				'}';
	}
}
