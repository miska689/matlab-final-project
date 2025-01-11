### Documentație detaliată a circuitului bazat pe NE555

Acest circuit utilizează un timer NE555 configurat ca multivibrator astabil pentru a genera un semnal PWM (modulare a lățimii impulsurilor). Circuitul controlează ciclul de funcționare (duty cycle) prin intermediul potențiometrului de 50kΩ. Iată detalierea funcționării:

---

### 1. **Descrierea circuitului**
- **Componenta principală**: Timerul NE555 este utilizat în mod astabil pentru a genera un semnal de ceas continuu (semnal oscilant) pe ieșire (Pin 3).
- **Alimentare**: Circuitul este alimentat cu 12V.
- **Rezistorul și potențiometrul**: Rezistența fixă de 1kΩ și potențiometrul de 50kΩ reglează frecvența și ciclul de funcționare.
- **Diodele**: Diodele controlează încărcarea și descărcarea condensatorului de 0.1µF, afectând timpul de înalt și jos al semnalului PWM.

---

### 2. **Funcționarea circuitului**
Circuitul funcționează astfel:
- **Încărcarea condensatorului**:
  - Când Pin 3 este în stare joasă, condensatorul de 0.1µF se încarcă prin rezistorul de 1kΩ, potențiometrul de 50kΩ și dioda orientată în sens direct.
  - Timpul necesar pentru încărcare determină durata semnalului înalt (high) pe Pin 3.

- **Descărcarea condensatorului**:
  - Când Pin 3 trece în stare înaltă, condensatorul se descarcă prin potențiometrul de 50kΩ și cealaltă diodă orientată invers.
  - Timpul de descărcare determină durata semnalului jos (low) pe Pin 3.

---

### 3. **Rolul componentelor**
1. **NE555**:
   - Pin 8 și Pin 4: Alimentarea pozitivă (+12V).
   - Pin 1: Masa circuitului.
   - Pin 2 și Pin 6: Configurația astabilă (feedback între ieșire și intrarea de declanșare/resetare a temporizatorului).
   - Pin 3: Ieșirea semnalului oscilant.
   - Pin 7: Terminalul de descărcare pentru condensator.

2. **Condensatorii**:
   - 0.1µF: Reglează ciclul de funcționare și contribuie la stabilitatea temporizării.
   - 0.01µF: Stabilizează funcționarea circuitului NE555 (reducerea zgomotului de pe Pin 5).

3. **Rezistoare și potențiometru**:
   - Ajustează timpii de încărcare/descărcare, modificând frecvența și duty cycle-ul semnalului PWM.

4. **Diode**:
   - Controlează fluxul de curent separat pentru încărcare și descărcare, făcând posibilă ajustarea independentă a ciclului de funcționare.

---

### 4. **Formula de calcul**
Frecvența și ciclul de funcționare sunt calculate astfel:
1. **Frecvența**:
   \[
   f = \frac{1.44}{(R_1 + 2 \cdot R_2) \cdot C}
   \]
   Unde:
   - \( R_1 \) = 1kΩ (rezistor fix),
   - \( R_2 \) = rezistența totală a potențiometrului,
   - \( C \) = 0.1µF (condensatorul principal).

2. **Timpul înalt (\( T_H \))**:
   \[
   T_H = 0.693 \cdot (R_1 + R_2) \cdot C
   \]

3. **Timpul jos (\( T_L \))**:
   \[
   T_L = 0.693 \cdot R_2 \cdot C
   \]

4. **Duty Cycle (\( D \))**:
   \[
   D = \frac{T_H}{T_H + T_L} \cdot 100\%
   \]

---

### 5. **Exemplu de calcul**
Să presupunem că potențiometrul este reglat la 25kΩ:
1. Frecvența:
   \[
   f = \frac{1.44}{(1k + 2 \cdot 25k) \cdot 0.1\mu F} = 1.44 / 5.1ms \approx 282Hz
   \]

2. Duty cycle:
   - Timpul înalt (\( T_H \)):
     \[
     T_H = 0.693 \cdot (1k + 25k) \cdot 0.1\mu F = 1.8ms
     \]
   - Timpul jos (\( T_L \)):
     \[
     T_L = 0.693 \cdot 25k \cdot 0.1\mu F = 1.73ms
     \]
   - Duty cycle:
     \[
     D = \frac{1.8}{1.8 + 1.73} \cdot 100\% \approx 51\%
     \]

---

### 6. **Aplicații practice**
1. **Controlul motoarelor**: PWM-ul generat poate fi folosit pentru controlul vitezei motoarelor DC.
2. **Iluminare LED**: Reglarea intensității luminii prin modularea curentului.
3. **Circuite oscilatoare**: Generare de semnale cu frecvențe reglabile.

---

Dacă ai nevoie de mai multe detalii sau ajustări pentru calcule specifice, spune-mi!