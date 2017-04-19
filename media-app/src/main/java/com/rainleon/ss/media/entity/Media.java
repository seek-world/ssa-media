package com.rainleon.ss.media.entity;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

/**
 * Created by rainleon on 2017/4/19.
 * Desc:
 */
@Getter
@Setter
public class Media {

    private Long id;
    private String name;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String sha1;
    private Integer status;



}
