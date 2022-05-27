package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private MemberService memberService;

  @GetMapping("/save")
  public String saveForm() {
    return "/member/save";
  }

  @PostMapping("/save")
  public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
    System.out.println("MemberController.save");
    System.out.println("memberDTO = " + memberDTO);

    boolean saveResult = memberService.save(memberDTO);
    if (saveResult) {
      System.out.println("회원가입 성공");
      return "/member/login";
    } else {
      System.out.println("회원가입 실패");
      return "index";
    }
  }

  @GetMapping("/login")
  public String login() {
    System.out.println("MemberController.login");
    return "/member/login";
  }

  @PostMapping("/login")
  public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
    System.out.println("MemberController.login");
    System.out.println("memberDTO = " + memberDTO);

    MemberDTO loginMemberDTO = memberService.login(memberDTO);
    if (loginMemberDTO != null) {
      System.out.println("로그인 성공");

      session.setAttribute("loginId", loginMemberDTO.getId());
      session.setAttribute("loginMemberId", loginMemberDTO.getMemberId());
      return "index";
    } else {
      System.out.println("로그인 실패");
      return "/member/login";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    System.out.println("MemberController.logout");

    session.invalidate();
    return "index";
  }

  @GetMapping("/findById")
  public MemberDTO findById(@RequestParam("boardWriter") String boardWriter) {
    System.out.println("MemberController.findById");
    return memberService.findById(boardWriter);
  }
}
