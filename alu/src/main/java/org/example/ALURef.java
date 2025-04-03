package org.example;

public class ALURef {

    public int refModel(ALUIO in){
        int sel = in.sel;
        int a = in.a;
        int b = in.b;
        int limit = 0xFF;
        switch (sel) {
            case 0b0000: return  (a + b) & limit;
            case 0b0001: return  (a - b) & limit;
            case 0b0010: return  (a * b) & limit;
            case 0b0011: return b != 0 ? a / b : 0;
            case 0b0100: return (a << 1) & limit;
            case 0b0101: return (a >> 1) & limit;
            case 0b0110: return ((a << 1) | (a >> 7)) & limit;
            case 0b0111: return ((a >> 1) | (a << 7)) & limit;
            case 0b1000: return a & b;
            case 0b1001: return a | b;
            case 0b1010: return a ^ b;
            case 0b1011: return ~(a | b) & limit;
            case 0b1100: return ~(a & b) & limit;
            case 0b1101: return ~(a ^ b) & limit;
            case 0b1110: return a > b ? 1 : 0;
            case 0b1111: // Equality
                return a == b ? 1 : 0;
            default:
                return (a + b) & limit;
        }
    }
}
