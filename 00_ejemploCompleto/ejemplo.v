module ejemplo();

// SOP del ejemplo de la guía

  reg A, B;
  wire w1, w2, w3, out;


  not kurt0(w1, A);
  and kurt1(w2, w1, B);
  and sec20(w3, A, B);
  or  U1(out, w2, w3);

  initial begin
    $display("A B | Y");
    $display("-------");
    $monitor("%b %b | %b", A, B, out);
    A = 0; B = 0;
    #1 B = 1;
    #1 A = 1; B = 0;
    #1 B = 1;
    #1 $finish;
  end

  initial 
    begin
      $dumpfile("ejemplo_tb.vcd"); 
      $dumpvars(0, ejemplo);
    end 

endmodule	
