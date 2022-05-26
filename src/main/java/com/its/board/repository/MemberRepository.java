package com.its.board.repository;

import com.its.board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {

  @Autowired
  private SqlSessionTemplate sql;

  public int save(MemberDTO memberDTO) {
    System.out.println("MemberRepository.save");
    return sql.insert("Member.save", memberDTO);
  }

  public MemberDTO login(MemberDTO memberDTO) {
    System.out.println("MemberRepository.login");
    return sql.selectOne("Member.login", memberDTO);
  }
}
