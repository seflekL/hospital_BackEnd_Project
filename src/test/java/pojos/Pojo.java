package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pojo {

    /*
    {

    "visitors_purpose":"purpose update",
    "description":"purpose update details"
}
     */

    private String visitors_purpose;
    private String description;
}
