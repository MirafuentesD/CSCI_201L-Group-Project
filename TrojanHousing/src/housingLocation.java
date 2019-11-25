
public class housingLocation {
	private int price;
	private int size;
	private String address;
	private int bedrooms;
	private int bathrooms;
	private String contactInfo;
	public housingLocation(int price, int size, String address, int bedrooms, int bathrooms, String contactInfo){
		this.price = price;
		this.size = size;
		this.address = address;
		this.bedrooms = bedrooms;
		this.bathrooms = bathrooms;
		this.contactInfo = contactInfo;
	}
	
	public int getPrice() {
		return price;
	}
	
	public int getSize() {
		return size;
	}

	public String getAddress() {
		return address;
	}

	public int getBedrooms() {
		return bedrooms;
	}

	public int getBathrooms() {
		return bathrooms;
	}

	public String getContactInfo() {
		return contactInfo;
	}
}
