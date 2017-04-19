package com.rainleon.ss.media.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by rainleon on 2017/4/20.
 * Desc:
 */
@Getter
@Setter
@Builder
public class ImageExif {

    private String locationX; // 经度
    private String locationY; // 纬度
    private String createTime;
    private String color;
    private String focus; // 焦距

    private String mode;
    private String camera;

}
