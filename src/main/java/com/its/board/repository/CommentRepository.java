package com.its.board.repository;

import com.its.board.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {

  @Autowired
  private SqlSessionTemplate sql;


  public void save(CommentDTO commentDTO) {
    System.out.println("CommentRepository.save");
    int a = sql.insert("Comment.save", commentDTO);
    System.out.println(a);
  }

  public List<CommentDTO> list(Long boardId) {
    System.out.println("CommentRepository.list");
    return sql.selectList("Comment.list", boardId);
  }
}
