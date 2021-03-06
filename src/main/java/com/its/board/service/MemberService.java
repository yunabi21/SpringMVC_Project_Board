package com.its.board.service;

import com.its.board.dto.MemberDTO;
import com.its.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {

  @Autowired
  private MemberRepository memberRepository;

  public boolean save(MemberDTO memberDTO) throws IOException {
    System.out.println("MemberService.save");

    saveFile(memberDTO);

    int saveResult = memberRepository.save(memberDTO);
    return saveResult > 0;
  }

  public MemberDTO login(MemberDTO memberDTO) {
    System.out.println("MemberService.login");
    return memberRepository.login(memberDTO);
  }

  public MemberDTO findByMemberId(String boardWriter) {
    System.out.println("MemberService.findByMemberId");
    return memberRepository.findByMemberId(boardWriter);
  }

  public MemberDTO findById(Long id) {
    System.out.println("MemberService.findById");
    return memberRepository.findById(id);
  }

  public void update(MemberDTO memberDTO) throws IOException {
    System.out.println("MemberService.update");

    saveFile(memberDTO);
    memberRepository.update(memberDTO);
  }

  private void saveFile(MemberDTO memberDTO) throws IOException {
    System.out.println("MemberService.saveFile");

    MultipartFile memberProfile = memberDTO.getMemberProfile();
    String memberProfileFileName = memberProfile.getOriginalFilename();
    memberProfileFileName = System.currentTimeMillis() + "-" + memberProfileFileName;
    String savePath = "D:\\project_img\\profile\\" + memberProfileFileName;

    if (!memberProfile.isEmpty()) {
      memberDTO.setMemberProfileFileName(memberProfileFileName);
      memberProfile.transferTo(new File(savePath));
    }
  }

  public List<MemberDTO> findAll() {
    System.out.println("MemberService.findAll");
    return memberRepository.findAll();
  }

  public void delete(Long id) {
    System.out.println("MemberService.delete");
    memberRepository.delete(id);
  }

  public boolean duplicateCheck(String memberId) {
    System.out.println("MemberService.duplicateCheck");
    return memberRepository.duplicateCheck(memberId) == null;
  }
}
