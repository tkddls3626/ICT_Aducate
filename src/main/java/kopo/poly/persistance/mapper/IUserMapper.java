package kopo.poly.persistance.mapper;

import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserMapper {
    int InsertUserInfo(UserInfoDTO uDTO) throws Exception;

    UserInfoDTO ChkUserInfo(UserInfoDTO uDTO) throws Exception;

    int getUserDelete(UserInfoDTO uDTO) throws Exception;

    UserInfoDTO getUserDetail(UserInfoDTO uDTO) throws Exception;

    int getUserUpdate(UserInfoDTO uDTO) throws Exception;
}
