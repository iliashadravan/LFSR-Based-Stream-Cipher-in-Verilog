# LFSR-Based Stream Cipher in Verilog

## Overview
This project implements a simple stream cipher using three Linear Feedback Shift Registers (5-bit, 7-bit, and 9-bit) in Verilog.

The outputs of the LFSRs are XORed to generate a keystream:

keystream = lfsr5 ^ lfsr7 ^ lfsr9

Encryption and decryption are performed using XOR:

ciphertext = plaintext ^ keystream  
decrypted  = ciphertext ^ keystream

## Simulation
The design is verified in ModelSim using a testbench that:
- Generates a 10ns clock
- Applies non-zero seeds
- Encrypts and decrypts an 8-bit message
- Confirms decrypted == plaintext

## Files
- lfsr.v  
- cipher.v  
- tb_cipher.v  

## Tools
- Verilog (Verilog-2001)
- ModelSim
