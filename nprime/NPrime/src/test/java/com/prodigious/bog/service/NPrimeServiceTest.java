package com.prodigious.bog.service;

import org.junit.Assert;
import org.junit.Test;

public class NPrimeServiceTest {

    @Test
    public void getPrime() throws Exception {
        NPrimeService service = new NPrimeService();
        Assert.assertEquals(2, service.getPrime(1));
        Assert.assertEquals(3, service.getPrime(2));
        Assert.assertEquals(5, service.getPrime(3));
        Assert.assertEquals(7, service.getPrime(4));
        Assert.assertEquals(11, service.getPrime(5));
        Assert.assertEquals(13, service.getPrime(6));
        Assert.assertEquals(17, service.getPrime(7));
        Assert.assertEquals(19, service.getPrime(8));
        Assert.assertEquals(23, service.getPrime(9));
        Assert.assertEquals(541, service.getPrime(100));
    }
}