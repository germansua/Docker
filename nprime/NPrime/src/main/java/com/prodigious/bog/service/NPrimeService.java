package com.prodigious.bog.service;

import org.springframework.web.bind.annotation.*;

import java.util.stream.IntStream;

@RestController
@RequestMapping("api")
public class NPrimeService {

    @RequestMapping(method = RequestMethod.GET, value = "nprime/{n}")
    public int getPrime(@PathVariable int n) {
        if (n < 1) return 0;
        return IntStream
                .iterate(2, i -> i + 1)
                .filter(i -> isPrime(i))
                .limit(n)
                .skip(n - 1)
                .findFirst()
                .getAsInt();
    }

    private boolean isPrime(int n) {
        if (n < 2) return false;
        return isPrimeAux(n, 2);
    }

    private boolean isPrimeAux(int n, int acc) {
        if (n == acc) return true;
        else if (n % acc == 0) return false;
        else return isPrimeAux(n, acc + 1);
    }
}
