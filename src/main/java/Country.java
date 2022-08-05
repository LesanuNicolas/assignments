import lombok.*;
import javax.persistence.*;

@Table(name = "countries")
@Entity
@Data
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "country_id", nullable = false)
    private Long id;

    @Column(name = "country_name", nullable = false)
    private String name;

    @Column(name = "population", nullable = false)
    private Integer population;

    @Column(name = "area")
    private Double area;
}
