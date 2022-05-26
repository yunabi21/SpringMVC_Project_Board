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
    memberDTO.setMemberProfileFileName(memberProfileFileName);
    String savePath = "D:\\project_img\\" + memberProfileFileName;

    if (!memberProfile.isEmpty()) {
      memberProfile.transferTo(new File(savePath));
    }

    int saveResult = memberRepository.save(memberDTO);
    return saveResult > 0;
  }

  public MemberDTO login(MemberDTO memberDTO) {
    return memberRepository.login(memberDTO);
  }
}
