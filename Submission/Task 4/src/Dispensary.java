import java.util.HashMap;

public class Dispensary {
	private final HashMap<Strain, Integer> aInventory;

	public Dispensary() {
		aInventory = new HashMap<>();
	}

	public void add(Strain pStrain, int pAmount) {
		if (!aInventory.containsKey(pStrain)) {
			aInventory.put(pStrain, pAmount);
		} else {
			Integer previousStock = aInventory.get(pStrain);
			Integer newStock = previousStock + pAmount;
			aInventory.replace(pStrain, newStock);
		}
	}

	public void remove(Strain pStrain, int pAmount) throws NotEnoughWeedException {
		if (!aInventory.containsKey(pStrain)) return;
		Integer previousStock = aInventory.get(pStrain);
		if (pAmount > previousStock) throw new NotEnoughWeedException("Not enough stock to remove that much from!");
		Integer newStock = previousStock - pAmount;
		aInventory.replace(pStrain, newStock);
	}

	@Override
	public String toString() {
		return "Dispensary{" +
				"aInventory=" + aInventory +
				'}';
	}
}
