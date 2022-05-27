package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
    System.out.println("BoardRepository.pagingList");
    return sql.selectList("Board.list", pagingParam);
  }

  public int boardCount() {
    System.out.println("BoardRepository.boardCount");
    return sql.selectOne("Board.count");
  }

  public int save(BoardDTO boardDTO) {
    System.out.println("BoardRepository.save");
    return sql.insert("Board.save", boardDTO);
  }
}
