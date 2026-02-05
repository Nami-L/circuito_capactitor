// Descripcion de un cricuito simple con capacitancia

`timescale 1ns/1ps
module circuio_c(vout,I,clk);
output real vout;
input real I;
input clk;

real f;
//EStados de memoria
real v_prev; // v(t-1)
real i_prev; // i[t-1]



parameter real TS = 4e-9; // Time step of 4 ns
parameter real C = 100e-9; // Capacitance of 100 nF

initial begin
 f =(1.0)/ TS; 
 vout= 0.0;   
    v_prev= 0.0;
    i_prev= 0.0;
end

always @(posedge clk) begin // el reloj controla la actualizacion del voltaje y es de 2 ns abajo y 2 ns arriba
    // calcular el nuevo voltaje v[t] = v[t-1] + (i[t] + i[t-1] ) / 2*f*C
    vout = v_prev + (I + i_prev) / (2.0 * f * C);

    v_prev = vout; // actualizar v(t)= v[t-1]
    i_prev = I; // actualizar i(t)= i[t-1]
end



endmodule