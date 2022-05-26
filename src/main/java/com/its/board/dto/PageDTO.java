package com.its.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO {
  private int page;
  private int startPage;
  private int endPage;
  private int maxPage;
}
