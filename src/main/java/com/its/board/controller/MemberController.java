package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private MemberService memberService;

  @GetMapping("/save")
  public String saveForm() {
    System.out.println("MemberController.saveForm");
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

  @GetMapping("/findByMemberId")
  public MemberDTO findByMemberId(@RequestParam("boardWriter") String boardWriter) {
    System.out.println("MemberController.findByMemberId");
    return memberService.findByMemberId(boardWriter);
  }

  @GetMapping("/my-page")
  public String myPage(@RequestParam("id") Long id, Model model) {
    System.out.println("MemberController.myPage");

    MemberDTO memberDTO = memberService.findById(id);
    model.addAttribute("member", memberDTO);
    return "/member/my-page";
  }

  @GetMapping("/img")
  public String img(@RequestParam("profileFileName") String profileFileName,
                    Model model) {
    System.out.println("MemberController.img");
    System.out.println("profileFileName = " + profileFileName);

    model.addAttribute("profileFileName", profileFileName);
    return "/member/img";
  }

  @PostMapping("/update")
  public String update(@ModelAttribute MemberDTO memberDTO) throws IOException {
    System.out.println("MemberController.update");
    System.out.println("memberDTO = " + memberDTO);

    memberService.update(memberDTO);
    return "index";
  }

  @GetMapping("/admin")
  public String admin(Model model) {
    System.out.println("MemberController.admin");

    List<MemberDTO> memberDTOList = memberService.findAll();
    model.addAttribute("memberList", memberDTOList);
    return "/member/admin";
  }


}
