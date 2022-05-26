package com.its.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
  private Long id;
  private String boardTitle;
  private String boardWriter;
  private String boardContents;
  private int boardHits;
  private Timestamp boardCreatedDate;
  private MultipartFile boardFile;
  private String boardFileName;
}
