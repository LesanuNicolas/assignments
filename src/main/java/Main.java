import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class Main {

    public static void main(String[] args) throws SQLException, IOException {
        Configurations configurations = new Configurations();
        Connection con = configurations.getDBConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "demo");
//        configurations.getLiquibaseScripts(con);
        CountryService countryService = new CountryService();
        CityService cityService = new CityService();
        cityService.getCityData(con, countryService.getCountryData(con));
    }
}
