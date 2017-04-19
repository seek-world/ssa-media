package com.rainleon.ss.media.utility;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.rainleon.ss.media.entity.ImageExif;

import java.io.File;

/**
 * Created by rainleon on 2017/4/20.
 * Desc: 图片Exif信息提取
 */
public class ImageUtils {

    public static void main(String[] args) throws Exception {
//        File jpegFile = new File("/Users/rain/Pictures/IMG_6638.JPG");
//        File jpegFile = new File("/Users/rain/Pictures/IMG_6428.png");

        getImageExif("/Users/rain/Pictures/IMG_6428.png");
        System.err.println("--------------------------");
        getImageExif("/Users/rain/Pictures/IMG_6638.JPG");

    }


    public static ImageExif getImageExif(String filePath){
        ImageExif.ImageExifBuilder builder = ImageExif.builder();
        try {
            File jpegFile = new File(filePath);
            Metadata metadata = ImageMetadataReader.readMetadata(jpegFile);
            for (Directory directory : metadata.getDirectories()) {
                for (Tag tag : directory.getTags()) {
                    System.out.format("[%s] - %s = %s \n",
                            directory.getName(), tag.getTagName(), tag.getDescription());
                }
                if (directory.hasErrors()) {
                    for (String error : directory.getErrors()) {
                        System.err.format("ERROR: %s \n", error);
                    }
                }
            }
            return builder.build();
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
}
