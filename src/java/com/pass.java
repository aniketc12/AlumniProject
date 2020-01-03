/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author Aniket C
 */
public class pass {
    public int encrypt(int a)
    {
        int b=0;
        b=a*138;
        b=b+942;
        return b;
    }
    
    public int decrypt(int a)
    {
        int b=0;
        b=a-942;
        b=a/138;
        return b;
        
    }
    
}
