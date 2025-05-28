package org.scoula.travel.dao;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TravelImageVO {
    private Long no;
    private String filename;
    private Long travelNo;
}