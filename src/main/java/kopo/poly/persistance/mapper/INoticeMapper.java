package kopo.poly.persistance.mapper;

import kopo.poly.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface INoticeMapper {

    int InsertNoticeInfo(NoticeDTO pDTO) throws Exception;

    List<NoticeDTO> getNoticeList() throws Exception;

    NoticeDTO getNoticeDetail(NoticeDTO pDTO) throws Exception;

    int getNoticeDelete(NoticeDTO pDTO) throws Exception;

    int getNoticeUpdate(NoticeDTO pDTO) throws Exception;

    NoticeDTO noticeUpdate(NoticeDTO nDTO) throws Exception;
}
