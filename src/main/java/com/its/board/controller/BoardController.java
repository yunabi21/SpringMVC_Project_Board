package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

  @Autowired
  private BoardService boardService;

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
  public String save() {
    return "/board/save";
  }
}
