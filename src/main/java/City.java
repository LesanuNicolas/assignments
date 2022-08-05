import lombok.*;
import javax.persistence.*;

@Table(name = "cities")
@Entity
@Data
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id", nullable = false)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "country_id", referencedColumnName = "id", nullable = false)
    private Long countryId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "population", nullable = false)
    private Integer population;

    @Column(name = "density", nullable = false)
    private Double density;
}