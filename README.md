# Synchronous FIFO Design and Verification using Verilog

## Overview

This project implements and verifies a parameterized Synchronous FIFO using Verilog HDL.  
The FIFO supports synchronous read and write operations with status flags for FULL and EMPTY conditions.

The project includes:
- RTL FIFO Design
- Verilog Testbench
- 14 Functional Verification Test Cases
- Waveform Analysis
- Overflow and Underflow Validation
- Wrap-around Pointer Verification

---

## FIFO Specifications

| Parameter | Value |
|----------|-------|
| Data Width | 8-bit |
| FIFO Depth | 16 |
| Clock Type | Synchronous |
| Reset Type | Active Low Reset |

---

## FIFO Architecture

The FIFO contains:
- Memory Array
- Write Pointer
- Read Pointer
- Counter Logic
- Full Flag Logic
- Empty Flag Logic

<img width="318" height="206" alt="image" src="https://github.com/user-attachments/assets/808929d4-c71b-4eda-9eb2-9061caa975b6" />

<img width="1447" height="772" alt="image" src="https://github.com/user-attachments/assets/d88deb5d-110a-4058-9523-6dae8eeb22fa" />



---

## Features

- Parameterized FIFO Design
- Simultaneous Read/Write Support
- Overflow Protection
- Underflow Protection
- Pointer Wrap-around Handling
- Full and Empty Status Detection

---

# Verification Test Cases

## TC01 – Single Write Operation

One data element is written into FIFO.

### Observation
- wr_en becomes HIGH
- Data enters FIFO memory
- empty flag becomes LOW

### Waveform
<img width="944" height="628" alt="image" src="https://github.com/user-attachments/assets/46539835-5273-4b4c-a370-48d313627d9f" />


---

## TC02 – Single Read Operation

Previously stored data is read from FIFO.

### Observation
- rd_en becomes HIGH
- Correct data appears at output
- FIFO order maintained

### Waveform
<img width="944" height="637" alt="image" src="https://github.com/user-attachments/assets/8ef84e4f-4988-46de-951b-95d5acf36c07" />


---

## TC03 – Full Condition Test

FIFO is filled completely.

### Observation
- full flag becomes HIGH
- Additional writes are blocked

### Waveform
<img width="944" height="621" alt="image" src="https://github.com/user-attachments/assets/08da30b6-d192-4cbf-a4d1-c690736e6294" />


---

## TC04 – Empty Condition Test

FIFO contents are fully read.

### Observation
- empty flag becomes HIGH
- Additional reads are blocked

### Waveform
<img width="944" height="500" alt="image" src="https://github.com/user-attachments/assets/acf9ca27-6735-4746-ae83-231352d4c78a" />


---

## TC05 – Single Element Write/Read

Single data element is written and read.

### Observation
- Read data matches written data
- FIFO functionality verified

### Waveform
<img width="944" height="591" alt="image" src="https://github.com/user-attachments/assets/c3040136-0d64-4826-a546-7067fa0ec0cc" />


---

## TC06 – Multiple Writes Test

Sequential writes are performed.

### Observation
- Multiple data values stored successfully
- FIFO capacity handling verified

### Waveform
<img width="944" height="661" alt="image" src="https://github.com/user-attachments/assets/4627a829-44fe-40c3-936f-7bd4cdd3d752" />


---

## TC07 – Multiple Reads Test

Sequential reads are performed.

### Observation
- Data exits in FIFO order
- Read sequence matches write sequence

### Waveform
<img width="944" height="492" alt="image" src="https://github.com/user-attachments/assets/75bff1ff-2651-43ca-b959-281d68713cac" />


---

## TC08 – Wrap-around Test

Pointers wrap after reaching memory limit.

### Observation
- Circular buffer operation verified
- Data integrity maintained

### Waveform
<img width="944" height="493" alt="image" src="https://github.com/user-attachments/assets/71434f2a-c5bf-4d61-bfab-e586180b543c" />


---

## TC09 – Simultaneous Read/Write Test

Read and write occur together.

### Observation
- FIFO count remains stable
- No data corruption occurs

### Waveform
<img width="944" height="563" alt="image" src="https://github.com/user-attachments/assets/8b91601d-532d-4370-a7ec-74b2118d8bc6" />


---

## TC10 – Reset Functionality Test

FIFO reset is applied during operation.

### Observation
- Pointers reset correctly
- FIFO returns to EMPTY state

### Waveform
<img width="944" height="490" alt="image" src="https://github.com/user-attachments/assets/094b1134-fc24-4465-92bd-d6186ad14d84" />


---

## TC11 – Speed Test

Multiple read/write operations executed rapidly.

### Observation
- FIFO performs correctly at high activity
- No timing issues observed

### Waveform
<img width="944" height="488" alt="image" src="https://github.com/user-attachments/assets/1c9bb742-0c6d-44eb-aae6-3a40999cb358" />


---

## TC12 – Long Duration Test

FIFO operates continuously for long duration.

### Observation
- Stable operation verified
- No data corruption detected

### Waveform
<img width="944" height="487" alt="image" src="https://github.com/user-attachments/assets/0b6f33b3-a51e-4e8a-8202-a7e98f5f7299" />


---

## TC13 – Overflow Handling Test

Writes attempted after FIFO becomes full.

### Observation
- Extra writes ignored
- Overflow protection verified

### Waveform
<img width="944" height="501" alt="image" src="https://github.com/user-attachments/assets/e5dcb819-4c7a-4b69-91bd-0a90f1650e2e" />


---

## TC14 – Underflow Handling Test

Reads attempted when FIFO is empty.

### Observation
- Invalid reads blocked
- empty flag remains HIGH

### Waveform
<img width="944" height="447" alt="image" src="https://github.com/user-attachments/assets/3c913946-2bb2-4bb4-8f29-c80dcd599fd5" />


---

# Tools Used

- Verilog HDL
- Xilinx Vivado Simulator

---

# Conclusion

The synchronous FIFO was successfully designed and verified using comprehensive functional test cases.  
Simulation results confirm correct FIFO behavior, stable pointer operation, proper flag generation, and reliable data transfer.
