package kopo.poly.service;

import kopo.poly.dto.NoticeDTO;

import java.util.List;

public interface INoticeService {

    int InsertNoticeInfo(NoticeDTO pDTO) throws Exception;

    List<NoticeDTO> getNoticeList() throws Exception;

    NoticeDTO getNoticeDetail(NoticeDTO pDTO) throws Exception;

    int getNoticeDelete(NoticeDTO pDTO) throws Exception;

    NoticeDTO noticeUpdate(NoticeDTO nDTO) throws Exception;

    int getNoticeUpdate(NoticeDTO nDTO) throws Exception;
}
