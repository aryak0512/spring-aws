package com.aryak.gradle;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class SampleTest {

    @Test
    void t1() {
        assertEquals(5, 2 + 3);
    }

    @Test
    void t2() {
        assertEquals(11, 8 + 3);
    }

    @Test
    void t3() {
        assertEquals(15, 12 + 3);
    }

    @Test
    void t4() {
        assertEquals(35, 32 + 3);
    }

    @Test
    void t5() {
        assertEquals(5, 32 + 3);
    }
}
