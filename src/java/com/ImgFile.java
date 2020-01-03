package com;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Aniket C
 */
public class ImgFile {
    
    public String change(String file, String email)
    {
        String name=file;
        String name1=name.substring(name.indexOf('.'), name.length());
        System.out.println(name1);
        name=email+name1;
        return name;
    }
    
    public String changeDate(String date)
    {
        String d=date;
        String d1=d.substring(d.indexOf('2'),d.indexOf('-'));
        return d1;
    }
    public String college(String colege)
    {
        String col=colege;
        String returnCol=col;
        
            returnCol=col.substring(col.charAt(0),col.charAt(15));
        
        return returnCol;
    }
    
}


