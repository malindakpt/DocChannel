package com.mkpt;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/**
 * Created by MalindaK on 7/16/2016.
 */
public class FileResizer {

    private static int IMG_WIDTH = 800   ;
    private static int IMG_HEIGHT = 600;
    
    public static void resize(BufferedImage originalImage){
        
        
    }

    public static InputStream resize(InputStream stream,String name) {
        try {
            BufferedImage originalImage = ImageIO.read(stream);
            BufferedImage image = null;
            int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
            ByteArrayOutputStream os=null;
        //    String cat = name.split(".")[1];

            if(type == 5) {//jpg
                image = resizeImage(originalImage, type);
                os = new ByteArrayOutputStream();
                ImageIO.write(image,"jpg", os);
//                ImageIO.write(resizeImageJpg, "jpg", image);
            }else if(type==6) {//png
                image = resizeImage(originalImage, type);
                os = new ByteArrayOutputStream();
                ImageIO.write(image,"png", os);
//                ImageIO.write(resizeImagePng, "png", new File("d:\\image\\newImg.jpg"));
            }


            InputStream fis = new ByteArrayInputStream(os.toByteArray());
            return fis;
        } catch (Exception e) {
            e.printStackTrace();
        };
        return null;
    }


    private static BufferedImage resizeImage(BufferedImage originalImage, int type){

        int width= originalImage.getWidth();
        int height= originalImage.getHeight();

        IMG_HEIGHT=IMG_WIDTH*height/width;

        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();

        return resizedImage;
    }
}
