package frank.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {

    private Long id;

    private String username;

    private String password;

    private String nickname;

    private String avatar;

}