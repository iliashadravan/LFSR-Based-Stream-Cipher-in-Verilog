🔐 Stream Cipher Design Using LFSR (Verilog)
📌 Project Overview

This project implements a simple stream cipher using multiple Linear Feedback Shift Registers (LFSRs) in Verilog.
The design generates a keystream using three independent LFSRs and performs both encryption and decryption using XOR logic.

The functionality is verified through simulation in ModelSim.

🧠 Design Architecture

The system consists of the following modules:

1️⃣ LFSR Modules

Three independent LFSRs with different lengths and tap polynomials:

5-bit LFSR

7-bit LFSR

9-bit LFSR

Each LFSR:

Loads a non-zero seed on reset

Generates a pseudo-random output bit

Uses XOR feedback based on its tap polynomial

2️⃣ Keystream Generator

The outputs of the three LFSRs are combined using XOR logic to produce the final keystream:

keystream = lfsr5_out ^ lfsr7_out ^ lfsr9_out

3️⃣ Encryption & Decryption

Encryption:

ciphertext = plaintext ^ keystream


Decryption:

decrypted = ciphertext ^ keystream


Since XOR is reversible:

plaintext = (plaintext ^ keystream) ^ keystream

🧪 Testbench

The testbench:

Generates a clock (10ns period)

Applies non-zero seeds

Encrypts an 8-bit message

Decrypts it

Checks if decrypted output matches original plaintext

Displays PASS/FAIL result

Simulation results confirm correct functionality.

📊 Simulation

Simulation was performed using ModelSim.

Waveforms verify:

Proper LFSR shifting

Correct keystream generation

Successful encryption and decryption

decrypted == plaintext

(Screenshot of waveform included in repository)

📂 Project Structure
lfsr.v
cipher.v
tb_cipher.v
README.md
waveform.png

🚀 Tools Used

Verilog (Verilog-2001)

ModelSim (Simulation)

🎯 Key Concepts Demonstrated

Linear Feedback Shift Registers (LFSR)

Stream Cipher design

XOR-based encryption

Modular hardware design

Digital simulation and waveform verification

✅ Result

The system successfully encrypts and decrypts data using a generated keystream.
Simulation confirms correct and error-free operation.# LFSR-Based-Stream-Cipher-in-Verilog
