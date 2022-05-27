package com.its.board.service;

import com.its.board.dto.MemberDTO;
import com.its.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {

  @Autowired
  private MemberRepository memberRepository;

  public boolean save(MemberDTO memberDTO) throws IOException {
    System.out.println("MemberService.save");

    MultipartFile memberProfile = memberDTO.getMemberProfile();
    String memberProfileFileName = memberProfile.getOriginalFilename();
    memberProfileFileName = System.currentTimeMillis() + "-" + memberProfileFileName;
    String savePath = "D:\\project_img\\profile\\" + memberProfileFileName;

    if (!memberProfile.isEmpty()) {
      memberDTO.setMemberProfileFileName(memberProfileFileName);
      memberProfile.transferTo(new File(savePath));
    }

    int saveResult = memberRepository.save(memberDTO);
    return saveResult > 0;
  }

  public MemberDTO login(MemberDTO memberDTO) {
    System.out.println("MemberService.login");
    return memberRepository.login(memberDTO);
  }

  public MemberDTO findById(String boardWriter) {
    System.out.println("MemberService.findById");
    return memberRepository.findById(boardWriter);
  }
}
