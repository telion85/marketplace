package ga.heaven.marketplace.model;

import lombok.*;
import org.hibernate.annotations.Type;

import javax.persistence.*;

@Entity
@Table(name = "mp_img")
@NoArgsConstructor
@EqualsAndHashCode
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ImageModel {
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;
    
    @Lob
    @Type(type = "binary")
    private byte[] image;
    
    private Long size;
    
    private String mediaType;
    
    public String getPath() {
        return "/img/" + this.getId();
    }
}
