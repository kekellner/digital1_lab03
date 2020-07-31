module prueba();

  wire w1,w2,out;
  reg  A,B,C;

  not U1(w1, A);
  and U2(w2, w1, B);
  or  U3(out, w1, w2, C);

  initial begin
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", A, B, C, out);
    A = 0; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 B = 1; C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 A = 1; B = 0; C = 1;
    #1 A = 1; B = 1; C = 0;
    #1 A = 1; B = 1; C = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile("prueba_tb.vcd");
    $dumpvars(0, prueba);
  end
endmodule
