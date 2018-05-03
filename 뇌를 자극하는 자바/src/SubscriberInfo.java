public class SubscriberInfo {

		
		String name, id, password;
		String phoneNo, address;
		
		public SubscriberInfo(String name, String id, String password) {
			this.name = name;
			this.id = id;
			this.password = password;
		}
		
	    public SubscriberInfo(String name, String id, String password, String phoneNo, String address) {
			this.name = name;
			this.id = id;
			this.password = password;
			this.phoneNo = phoneNo;
			this.address = address;
		}
	
		public void changePassword(String password) {
			this.password = password;
		}
		
		public void setPhoneNo(String phoneNo) {
			this.phoneNo = phoneNo;
		}
		
		public void setAddress(String address) {
			this.address = address;
		}
		
	}


