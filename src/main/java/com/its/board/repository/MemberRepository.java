package com.its.board.repository;

import com.its.board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

  public MemberDTO findByMemberId(String boardWriter) {
    System.out.println("MemberRepository.findByMemberId");
    return sql.selectOne("Member.findByMemberId", boardWriter);
  }

  public MemberDTO findById(Long id) {
    System.out.println("MemberRepository.findById");
    return sql.selectOne("Member.findById", id);
  }

  public void update(MemberDTO memberDTO) {
    System.out.println("MemberRepository.update");
    sql.update("Member.update", memberDTO);
  }

  public List<MemberDTO> findAll() {
    return sql.selectList("Member.findAll");
  }
}
