package frank.mapper;

import frank.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    User selectByPrimaryKey(Long id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    // 单个参数时，MyBatis 的 xml 中配置 parameterType 就可以，如果有多个参数，需要使用 @Param
    User login(@Param("username") String username, @Param("password") String password);
}