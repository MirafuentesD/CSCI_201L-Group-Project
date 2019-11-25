import org.apache.http.HttpRequest;
import org.jsoup.Jsoup;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlForm;
import com.gargoylesoftware.htmlunit.html.HtmlOption;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlSelect;
import com.gargoylesoftware.htmlunit.html.HtmlSubmitInput;
import com.gargoylesoftware.htmlunit.html.HtmlTextInput;
import com.gargoylesoftware.htmlunit.html.HtmlUnorderedList;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Random;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class webScraper {
	
	public static void main(String[] args) {
		try {
			
			String url = "https://www.socialserve.com/tenant/CA/Search.html?ch=LAX&city_id=42665&type=rental";
			
			final WebClient client = new WebClient();
			final HtmlPage page = client.getPage(url);
			System.out.println("HtmlUnit - Welcome to HtmlUnit " + page.getTitleText());
	
	        HtmlElement searchField = page.getHtmlElementById("search_form");
	        HtmlForm searchForm = (HtmlForm)searchField;
	        
	        HtmlSelect bedroomsSelect = searchForm.getSelectByName("bedroom");
	        HtmlOption bedroomsOption = bedroomsSelect.getOptionByValue("1,2,3,4,5,6,7,8");
	        
	        HtmlSelect bathsSelect = searchForm.getSelectByName("bathroom");
	        HtmlOption bathsOption = bathsSelect.getOptionByValue("1.0");
	        
	        HtmlTextInput textField = searchForm.getInputByName("zipcode");
	        textField.type("90007");
	        
	        bedroomsSelect.setSelectedAttribute(bedroomsOption, true);
	        bathsSelect.setSelectedAttribute(bathsOption, true);
	        
	        final HtmlSubmitInput button = searchForm.getInputByName("submit");	        
	        final HtmlPage resultsPage = button.click();
	        	        
	        HtmlUnorderedList results = (HtmlUnorderedList) resultsPage.getElementById("shsListingResults");
	        //System.out.println(results.asText());
	        
	        //Vector<housingLocation> locations = new Vector<housingLocation>();
	        
	        DomNodeList<HtmlElement> items = results.getElementsByTagName("li");
	        
	      
	        List<HtmlElement> bedBathList = resultsPage.getByXPath("//div[contains(@class, 'shsLPdesc')]");
			List<HtmlElement> addressList = resultsPage.getByXPath("//div[contains(@class, 'shsAddress')]");
			List<HtmlElement> priceList = resultsPage.getByXPath("//div[contains(@class, 'CostNum')]");
			List<HtmlElement> contactList = resultsPage.getByXPath("//div[contains(@class, 'shsContactPanel')]");

			 for (int i = 0; i < items.getLength() - 9; ++i) {
				 String bedBath = bedBathList.get(i).asText();
				 String address = addressList.get(i).asText();
				 String price = priceList.get(i).asText();
				 
				 int beds = Character.getNumericValue(bedBath.charAt(0));
				 int baths = Character.getNumericValue(bedBath.charAt(bedBath.indexOf("\u2022") + 2));
				 
				 String addressLines[] = address.split("\\r?\\n");
				 if (addressLines.length > 1){
					 address = (addressLines[1]).trim();
				 }
				 else {
					 address = (addressLines[0]).trim();
				 }
				 
				 price = price.replaceAll(",", "");
				 String priceFinal = "";
				 StringBuilder p = new StringBuilder(priceFinal);
				 
				 int j = price.length() -1;
				 
				 while(j >= 0)
				 {
					 if(price.charAt(j) == '$') {
						 break;
					 }
					 p.append(price.charAt(j));
					 --j;
				 }
				 price = p.reverse().toString();
				 
				 String contactInfo = contactList.get(i).asText();
				 
				 contactInfo = contactInfo.substring(0, 3) + "-" + contactInfo.substring(4, 7) +  "-" +contactInfo.substring(8, 12);
				 
				 
				 int [] rangeSize = {882, 900, 1068, 980, 1000, 1005, 970, 891};
				 int rnd = new Random().nextInt(rangeSize.length);
				 //housingLocation(int price, int size, String address, int bedrooms, int bathrooms, String contactInfo)
				 housingLocation house = new housingLocation(Integer.parseInt(price), rangeSize[rnd], address, beds, baths, contactInfo);
//				 System.out.println(house.getAddress());
//				 System.out.println(house.getPrice());
//				 System.out.println(house.getSize());
//				 System.out.println(house.getBedrooms());
//				 System.out.println(house.getBathrooms());
//				 System.out.println(house.getContactInfo());
//				 System.out.println();
//				 
				 address = address.replaceAll("\\s+","+");
//				 <script async src="https://cse.google.com/cse.js?cx=008614096280793752053:kxy99vzs1pi"></script>
//				 <div class="gcse-search"></div>
				 // Create custom google search for images
				 //API Key AIzaSyClKNGBv8RuKKSsCkMllrNkqE2bl16F0do
				 
				 URL urlGoogle = new URL("https://www.googleapis.com/customsearch/v1?key=AIzaSyClKNGBv8RuKKSsCkMllrNkqE2bl16F0do&cx=008614096280793752053:kxy99vzs1pi&searchType=image&q=" + address);
				 HttpURLConnection con = (HttpURLConnection) urlGoogle.openConnection();
		         con.setRequestProperty("Content-Type", "application/json");
				 con.setRequestMethod("GET");
//				 
//				 // GCP INSERT
				 System.out.println(con.getResponseCode());
				 System.out.println(con.getResponseMessage());
				 
				 BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	             StringBuilder sb = new StringBuilder();
	             String line;
	             while ((line = br.readLine()) != null) {
	            	 sb.append(line+"\n");
	             }	
	             br.close();
	             System.out.println(sb.toString());
	             
	             JSONObject obj = new JSONObject(sb.toString());

	             String houseJson = sb.toString();
	             
//	             String houseItems = houseJson["items"];
	             
				 // Store link as a string
			 }
			 
			 
			 
			client.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
