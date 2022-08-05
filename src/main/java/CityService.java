import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CityService {
    public List<City> getCityData(Connection con, List<Country> countries) throws IOException, SQLException {
        String url = "https://en.wikipedia.org/wiki/List_of_largest_cities";
        Document pageToScrape = Jsoup.connect(url).get();
        Element tableElement = pageToScrape.select("table").get(1);
        List<String> cityName = getRowsForColumnCityName(0, tableElement, new ArrayList<>());
        List<String> cityCountry = getRowsForColumn(0, tableElement, new ArrayList<>());

        List<String> cityPopulation = getRowsForColumn(1, tableElement, new ArrayList<>());
        List<String> cityDensity = getRowsForColumn(5, tableElement, new ArrayList<>());
        List<City> cities = new ArrayList<>();
            for (int i = 0; i < 81; i++) {
                    City city = new City();
                city.setName(cityName.get(i));
                if (cityPopulation.get(i) != null && cityPopulation.get(i).length() > 0 && !cityPopulation.get(i).equals("—")) {
                    city.setPopulation(Integer.parseInt(cityPopulation.get(i)));
                } else {
                    city.setPopulation(null);
                }
                if (cityDensity.get(i) != null && cityDensity.get(i).length() > 0 && !cityDensity.get(i).equals("—")) {
                    String s = StringUtils.substringBefore(cityDensity.get(i),  " ");
                    city.setDensity(Double.parseDouble(s));
                } else {
                    city.setDensity(null);
                }
                PreparedStatement ps = con.prepareStatement("insert into cities(country_id, name, population, density) values(" + city.getCountryId() + "," + "'" + city.getName().replace("'", "''") + "'" + "," + city.getPopulation() + "," + city.getDensity() + ")");
                ps.executeUpdate();
                PreparedStatement ids = con.prepareStatement("UPDATE cities c\n" +
                        "SET country_id = co.country_id\n" +
                        "FROM countries co\n" +
                        "where co.country_name = '" + cityCountry.get(i) + "' and c.name = '" + city.getName().replace("'", "''") + "'");
                ids.executeUpdate();
                cities.add(city);
        }
        return cities;
    }

    public List<String> getRowsForColumn(Integer column, Element tableElement, List<String> countryData) {
        int row;
        for (row = 3; row < 84; row++) {
            String tr = tableElement.select("tr").get(row).select("td").get(column).text().replace(",", "");
            countryData.add(tr);
        }
        return countryData;
    }

    public List<String> getRowsForColumnCityName(Integer column, Element tableElement, List<String> countryData) {
        int row;
        for (row = 3; row < 84; row++) {
            String tr = tableElement.select("tr").get(row).select("th").get(column).text().replace(",", "");
            countryData.add(tr);
        }
        return countryData;
    }
}
