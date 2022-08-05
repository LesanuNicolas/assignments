import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountryService {
    public List<Country> getCountryData(Connection con) throws IOException, SQLException {
        String url = "https://en.wikipedia.org/wiki/List_of_countries_by_population_in_2010";
        Document pageToScrape = Jsoup.connect(url).get();
        Element tableElement = pageToScrape.select("table").get(1);
        List<String> countryNames = getRowsForColumn(1, tableElement, new ArrayList<>());
        List<String> countryPopulations = getRowsForColumn(2, tableElement, new ArrayList<>());
        List<String> countryAreas = getRowsForColumn(4, tableElement, new ArrayList<>());
        List<Country> countries = new ArrayList<>();
                    for (int i = 0; i <= 197; i++) {
                        Country country = new Country();
                        country.setName(countryNames.get(i));
                        country.setPopulation(Integer.parseInt(countryPopulations.get(i)));
                        if (countryAreas.get(i) != null && countryAreas.get(i).length() > 0) {
                            country.setArea(Double.parseDouble(countryAreas.get(i)));
                        } else {
                            country.setArea(null);
                        }
                        PreparedStatement ps= con.prepareStatement("insert into countries(country_name, population, area) values(" + "'" + country.getName().replace("'", "''") + "'" + "," + country.getPopulation() + "," + country.getArea() + ")", Statement.RETURN_GENERATED_KEYS);
                        ps.executeUpdate();
                        ResultSet rs = ps.getGeneratedKeys();
                        while (rs.next()) {
                            country.setId((long) rs.getInt(1));
                        }
                        countries.add(country);
                    }
        return countries;
    }

    public List<String> getRowsForColumn(Integer column, Element tableElement, List<String> countryData) {
        int row;
        for (row = 2; row <= 199; row++) {
        String tr = tableElement.select("tr").get(row).select("td").get(column).text().replace(",", "");
        countryData.add(tr);
        }
        return countryData;
    }
}
