package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

  @Autowired
  private BoardRepository boardRepository;

  private static final int PAGE_LIMIT = 5;
  private static final int BLOCK_LIMIT = 3;
  public List<BoardDTO> pagingList(int page) {
    System.out.println("BoardService.pagingList");

    int pagingStart = (page - 1) * PAGE_LIMIT;
    Map<String, Integer> pagingParam = new HashMap<>();
    pagingParam.put("start", pagingStart);
    pagingParam.put("limit", PAGE_LIMIT);
    return boardRepository.pagingList(pagingParam);
  }

  public PageDTO paging(int page) {
    System.out.println("BoardService.paging");

    int boardCount = boardRepository.boardCount();
    int startPage = ( (int) (Math.ceil( (double) page / BLOCK_LIMIT - 1))) * BLOCK_LIMIT + 1;
    int endPage = startPage + BLOCK_LIMIT - 1;
    int maxPage = (int) (Math.ceil( (double) boardCount / PAGE_LIMIT));

    if (endPage > maxPage) endPage = maxPage;

    return new PageDTO(page, startPage, endPage, maxPage);
  }

  public boolean save(BoardDTO boardDTO) throws IOException {
    System.out.println("BoardService.save");

    MultipartFile boardFile = boardDTO.getBoardFile();
    String boardFileName = boardFile.getOriginalFilename();
    boardFileName = System.currentTimeMillis() + "-" + boardFileName;
    boardDTO.setBoardFileName(boardFileName);
    String savePath = "D:\\project_img\\board\\" +  boardFileName;

    if (!boardFile.isEmpty()) boardFile.transferTo(new File(savePath));

    int saveResult = boardRepository.save(boardDTO);
    return saveResult > 0;
  }
}
