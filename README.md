# Matlab_for_receiver_line

# OFDM Receiver for Digital Communication System

Welcome to the OFDM Receiver repository, which is a part of the broader OFDM-based Digital Communication System project. This MATLAB project focuses specifically on the receiver side of the communication system, showcasing the processes of demodulation, symbol recovery, error correction, and mitigation of impairments introduced during transmission.

## Features

- **OFDM Demodulation:** Demodulate the received OFDM signal to recover complex symbols.
- **Symbol Demapping:** Demap complex symbols back to the transmitted data.
- **Pilot Removal:** Remove pilot symbols to extract the original data.
- **Hamming Decoding:** Decode Hamming-encoded data to correct errors.
- **Bit Error Rate (BER) Calculation:** Evaluate the system's performance after receiving the data.

## Usage

1. Clone the parent [OFDM-based Digital Communication System repository](link-to-main-repo) to your local machine.
2. Navigate to the `receiver` folder.
3. Open MATLAB and configure system parameters in `receiver_main.m` if necessary.
4. Run the `receiver_main.m` script to execute the receiver side of the OFDM communication system.
5. The script will display the Bit Error Rate (BER) to assess the quality of the received data.

## Contents

- `receiver_main.m`: Main script for the OFDM receiver.
- `ofdm_demodulation.m`: OFDM demodulation function.
- `demap_symbols.m`: Demapping symbols back to data function.
- `remove_pilots.m`: Pilot removal function.
- `hamming_decode.m`: Hamming decoding function.
- `calculate_ber.m`: Bit Error Rate calculation function.

## Related Project

This receiver side repository is part of the broader [OFDM-based Digital Communication System project](link-to-main-repo), which covers both the transmitter and receiver sides of the communication system.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This project is meant for educational purposes and serves as a simplified simulation of an OFDM communication system's receiver side. It does not represent a production-ready solution.

Feel free to explore, experiment, and adapt the code to your needs. If you find this project useful, consider giving it a star on GitHub!
