import pandas as pd
import matplotlib.pyplot as plt

# Cargar datos
df = pd.read_csv('/home/nami/Documents/circuito_rc/work/uvm/sim/simulation_results.csv')
# buscar columna  con el nombre tiempo
time = df['time']
# buscar la columan con l nombre vout
vout = df ['vout']*1000
#buscar la columna con el nombre i
current = df['i'] * 1e6
# Graficar
plt.figure(figsize=(10, 5)) #crear una figura de 10x5 pulgadas

plt.plot(time,vout, label='Vout (RNM Model)') #graficar vout vs tiempo
plt.title('Respuesta del Fotodiodo')
plt.xlabel('Tiempo [ns]')
plt.ylabel('Voltaje [mV]')
plt.grid(True)
plt.legend()
plt.show()