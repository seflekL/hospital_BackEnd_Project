package pojos;

import java.io.Serializable;

public class VisitorsPojo implements Serializable {
	private String visitorsPurpose;
	private String description;

	public void setVisitorsPurpose(String visitorsPurpose){
		this.visitorsPurpose = visitorsPurpose;
	}

	public String getVisitorsPurpose(){
		return visitorsPurpose;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return description;
	}

	@Override
 	public String toString(){
		return 
			"VisitorsPojo{" + 
			"visitors_purpose = '" + visitorsPurpose + '\'' + 
			",description = '" + description + '\'' + 
			"}";
		}

	public VisitorsPojo(String visitorsPurpose, String description) {
		this.visitorsPurpose = visitorsPurpose;
		this.description = description;
	}

	public VisitorsPojo() {
	}
}