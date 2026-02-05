//`timescale 1ns/1ps
module tb_Ccircuito;
  real I;
  real vout;
  logic clk;
parameter real Ts = 4e-9; // Time step of 4 ns
parameter real C = 100e-9; // Capacitance of 100 nF
  // Instanciamos el módulo
  circuio_c dut (
    .vout(vout),
    .I_probe(I),
    .clk(clk)
  );


  // Generación del reloj de muestreo
  //initial begin
  //  clk = 0;
  //  forever #2 clk = ~clk; // periodo de 2 ns
  //end

  initial begin
    // Formato: unidad (-9 = ns), decimales, sufijo, ancho mínimo
    $timeformat(-9, 0, "", 10); 
end

  // Estímulos para I
  initial begin
    $monitor ("%0t|Clock = %5.f| Corriente_Entrada=%.9f| Voltaje_Salida=%.9f",$time,clk,I,vout);
    I = 1.0e-6; // 1 uA
    #50_020 ;
    //I = 0.0;
    #50_000 ;
    //I = -1.0e-6; // suponiendo que el capacitor puede descargar con corriente negativa
    #50_000 $finish;
  end

  integer file;
initial begin
    file = $fopen("simulation_results.csv", "w");
    $fdisplay(file, "time,i,vout"); // Encabezado
    
    forever begin//@(posedge clk) begin // Cada que cambie una señal
        #(Ts*1s)
         $fdisplay(file, "%t,%f,%f", $realtime, I, vout); // se deja un delay pequeño para asegurar que los valores se hayan actualizado
    end
end

final begin
    $fclose(file);
end
endmodule
