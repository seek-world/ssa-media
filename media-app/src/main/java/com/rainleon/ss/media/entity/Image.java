package com.rainleon.ss.media.entity;

import lombok.*;

/**
 * Created by rainleon on 2017/4/19.
 * Desc:
 */
@Getter
@Setter
public class Image extends Media {

    private String fileLocation; // 文件存储路径
    private String fileHeight; // 文件高度
    private String fileWidth;  // 文件宽度
    private String fileDesc; // 描述
    private String fileName;  // 文件名
    private String fileType; // 文件类型 jpg,png,gif

    private String sourceFrom; // 来源
    private String sourceLocation; // 源路径
    private String sourceDevice; // 设备 iphone6 d3200
    private String sourceDirector; // 拍摄者

    private ImageExif imageExif; // 从图片提取的扩展信息
}
