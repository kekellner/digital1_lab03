// -----------------------------------
// José Eduardo Morales y Kurt Kellner
// Basado en: http://www.asic-world.com/verilog/verilog_one_day1.html#Low_level_design
// Prueba de compuertas
// -----------------------------------
module gates();	// generar y nombrar un módulo
  
// dos diagonales para hacer comentar  una línea
  
wire out0;				// puedo ponerlos en líneas aparte
wire out1;
wire out2;
reg in1,in2,in3,in4;	// o en la misma línea

// podemos utilizar compuertas nativas   
not U1 (out0, in1);					// compuerta nombre ( salida, entrada)
and U2 (out1, in1,in2,in3,in4);		// AND de 4 entradas
xor U3 (out2, in1,in2,in3);			// XOR de 3 entradas

// initial sirve para definir eventos desde el tiempo t = 0
initial begin	// noten el uso del begin y end
  //monitor nos permite rastrear cambios en las entradas y salidas
  // %b = binario %d = decimal %h = hex  \t = tabulación
  $monitor(
  "Time%d: in1=%b in2=%b in3=%b in4=%b out0=%b out1=%b out2=%b", 
    $time, in1,in2,in3,in4,out0,out1,out2); 
  // Declaramos valores en el tiempo 0
  in1 = 0;
  in2 = 0;
  in3 = 0;
  in4 = 0;
  // Declaramos otros cambios en otros tiempo
  #1 in1 = 1;	// #1 marca un retardo de una unidad de tiempo
  #1 in2 = 1;
  #1 in3 = 1;
  #1 in4 = 1;
  #1 $finish;   // termina la simulación
end	

 
  initial 
    begin
      $dumpfile("top_tb.vcd");
      $dumpvars(1);
    end 
endmodule	//finalizar el módulo
