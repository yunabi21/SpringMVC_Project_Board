package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.MemberDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import com.its.board.service.CommentService;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

  @Autowired
  private BoardService boardService;

  @Autowired
  private MemberService memberService;

  @Autowired
  private CommentService commentService;

  @GetMapping("/list")
  public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                     Model model) {
    System.out.println("BoardController.list");
    System.out.println("page = " + page + ", model = " + model);

    List<BoardDTO> boardDTOList = boardService.pagingList(page);
    PageDTO pageDTO = boardService.paging(page);

    model.addAttribute("boardList", boardDTOList);
    model.addAttribute("paging", pageDTO);
    return "/board/list";
  }

  @GetMapping("/save")
  public String saveForm() {
    System.out.println("BoardController.save");
    return "/board/save";
  }

  @PostMapping("/save")
  public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
    boolean saveResult = boardService.save(boardDTO);
    if (saveResult) {
      System.out.println("글 작성 성공");
    } else {
      System.out.println("글 작성 실패");
    }
    return "redirect:/board/list";
  }

  @GetMapping("/findById")
  public BoardDTO findById(@RequestParam("id") Long id) {
    System.out.println("BoardController.findById");
    return boardService.findById(id);
  }

  @GetMapping("/detail")
  public String detail(@RequestParam("id") Long id,
                       @RequestParam("boardWriter") String boardWriter,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       Model model) {
    System.out.println("BoardController.detail");

    MemberDTO memberDTO = memberService.findByMemberId(boardWriter);
    BoardDTO boardDTO = findById(id);
    List<CommentDTO> commentDTOList = commentService.list(id);

    model.addAttribute("boardWriter", memberDTO);
    model.addAttribute("board", boardDTO);
    model.addAttribute("page", page);
    model.addAttribute("commentList", commentDTOList);
    return "/board/detail";
  }

  @GetMapping("/img")
  public String img(@RequestParam("boardFileName") String boardFileName,
                    Model model) {
    System.out.println("BoardController.img");
    System.out.println("boardFileName = " + boardFileName);

    model.addAttribute("boardFileName", boardFileName);
    return "/board/img";
  }

  @GetMapping("/update")
  public String update(@RequestParam("id") Long id, Model model) {
    System.out.println("BoardController.update");

    BoardDTO boardDTO = boardService.findById(id);
    model.addAttribute("board", boardDTO);
    return "/board/update";
  }

  @PostMapping("/update")
  public String update(@ModelAttribute BoardDTO boardDTO,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       Model model) throws IOException {
    System.out.println("BoardController.update");

    boardService.update(boardDTO);
    model.addAttribute("board", boardDTO);
    return "redirect:/board/detail?id=" + boardDTO.getId() + "&page=" + page + "&boardWriter=" + boardDTO.getBoardWriter();
  }

  @GetMapping("/delete")
  public String delete(@RequestParam("id") Long id) {
    System.out.println("BoardController.delete");

    boardService.delete(id);
    return "redirect:/board/list";
  }

  @GetMapping("/search")
  public String search(@RequestParam("searchType") String searchType,
                       @RequestParam("query") String query,
                       Model model) {
    System.out.println("BoardController.search");

    List<BoardDTO> boardDTOList = boardService.search(searchType, query);
    model.addAttribute("boardList", boardDTOList);
    return "board/list";
  }
}
