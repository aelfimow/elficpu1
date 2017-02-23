entity pMem is
    port (
        addr_i: in bit_vector(15 downto 0);
        data_o: out bit_vector(3 downto 0);
        rd_i: in bit);
end entity pMem;

architecture ArchPMem of pMem is
    signal data: bit_vector(3 downto 0);
    signal addr: bit_vector(15 downto 0);
    signal rd: bit;
begin

    SIG_BLOCK: block
    begin
        data_o <= data;
        addr <= addr_i;
        rd <= rd_i;
    end block SIG_BLOCK;

    process(addr, rd)
    begin
        case addr(7 downto 0) is
            when "00000000" =>
                data <= x"1";
                null;
            when "00000001" =>
                data <= x"5";
                null;
            when "00000010" =>
                data <= x"2";
                null;
            when "00000011" =>
                data <= x"A";
                null;
            when "00000100" =>
                data <= x"3";
                null;
            when "00000101" =>
                data <= x"F";
                null;
            when "00000110" =>
                data <= x"F";
                null;
            when "00000111" =>
                data <= x"4";
                null;
            when "00001000" =>
                data <= x"E";
                null;
            when "00001001" =>
                data <= x"F";
                null;
            when "00001010" =>
                data <= x"5";
                null;
            when "00001011" =>
                data <= x"0";
                null;
            when "00001100" =>
                data <= x"0";
                null;
            when "00001101" =>
                data <= x"0";
                null;
            when "00001110" =>
                data <= x"0";
                null;
            when "00001111" =>
                data <= x"6";
                null;
            when "00010000" =>
                data <= x"7";
                null;
            when "00010001" =>
                data <= x"F";
                null;
            when "00010010" =>
                data <= x"0";
                null;
            when "00010011" =>
                data <= x"0";
                null;
            when "00010100" =>
                data <= x"0";
                null;
            when "00010101" =>
                data <= x"5";
                null;
            when "00010110" =>
                data <= x"0";
                null;
            when "00010111" =>
                data <= x"0";
                null;
            when "00011000" =>
                data <= x"0";
                null;
            when "00011001" =>
                data <= x"0";
                null;
            when "00011010" =>
                data <= x"6";
                null;
            when "00011011" =>
                data <= x"7";
                null;
            when "00011100" =>
                data <= x"A";
                null;
            when "00011101" =>
                data <= x"1";
                null;
            when "00011110" =>
                data <= x"0";
                null;
            when "00011111" =>
                data <= x"0";
                null;
            when "00100000" =>
                data <= x"5";
                null;
            when "00100001" =>
                data <= x"0";
                null;
            when "00100010" =>
                data <= x"0";
                null;
            when "00100011" =>
                data <= x"0";
                null;
            when "00100100" =>
                data <= x"0";
                null;
            when "00100101" =>
                data <= x"6";
                null;
            when "00100110" =>
                data <= x"7";
                null;
            when "00100111" =>
                data <= x"5";
                null;
            when "00101000" =>
                data <= x"2";
                null;
            when "00101001" =>
                data <= x"0";
                null;
            when "00101010" =>
                data <= x"0";
                null;
            when "00101011" =>
                data <= x"5";
                null;
            when "00101100" =>
                data <= x"0";
                null;
            when "00101101" =>
                data <= x"0";
                null;
            when "00101110" =>
                data <= x"0";
                null;
            when "00101111" =>
                data <= x"0";
                null;
            when "00110000" =>
                data <= x"6";
                null;
            when "00110001" =>
                data <= x"7";
                null;
            when "00110010" =>
                data <= x"0";
                null;
            when "00110011" =>
                data <= x"3";
                null;
            when "00110100" =>
                data <= x"0";
                null;
            when "00110101" =>
                data <= x"0";
                null;
            when "00110110" =>
                data <= x"5";
                null;
            when "00110111" =>
                data <= x"0";
                null;
            when "00111000" =>
                data <= x"0";
                null;
            when "00111001" =>
                data <= x"0";
                null;
            when "00111010" =>
                data <= x"0";
                null;
            when "00111011" =>
                data <= x"6";
                null;
            when "00111100" =>
                data <= x"7";
                null;
            when "00111101" =>
                data <= x"B";
                null;
            when "00111110" =>
                data <= x"3";
                null;
            when "00111111" =>
                data <= x"0";
                null;
            when "01000000" =>
                data <= x"0";
                null;
            when "01000001" =>
                data <= x"5";
                null;
            when "01000010" =>
                data <= x"0";
                null;
            when "01000011" =>
                data <= x"0";
                null;
            when "01000100" =>
                data <= x"0";
                null;
            when "01000101" =>
                data <= x"0";
                null;
            when "01000110" =>
                data <= x"6";
                null;
            when "01000111" =>
                data <= x"7";
                null;
            when "01001000" =>
                data <= x"6";
                null;
            when "01001001" =>
                data <= x"4";
                null;
            when "01001010" =>
                data <= x"0";
                null;
            when "01001011" =>
                data <= x"0";
                null;
            when "01001100" =>
                data <= x"5";
                null;
            when "01001101" =>
                data <= x"0";
                null;
            when "01001110" =>
                data <= x"0";
                null;
            when "01001111" =>
                data <= x"0";
                null;
            when "01010000" =>
                data <= x"0";
                null;
            when "01010001" =>
                data <= x"6";
                null;
            when "01010010" =>
                data <= x"7";
                null;
            when "01010011" =>
                data <= x"1";
                null;
            when "01010100" =>
                data <= x"5";
                null;
            when "01010101" =>
                data <= x"0";
                null;
            when "01010110" =>
                data <= x"0";
                null;
            when "01010111" =>
                data <= x"5";
                null;
            when "01011000" =>
                data <= x"0";
                null;
            when "01011001" =>
                data <= x"0";
                null;
            when "01011010" =>
                data <= x"0";
                null;
            when "01011011" =>
                data <= x"0";
                null;
            when "01011100" =>
                data <= x"6";
                null;
            when "01011101" =>
                data <= x"7";
                null;
            when "01011110" =>
                data <= x"C";
                null;
            when "01011111" =>
                data <= x"5";
                null;
            when "01100000" =>
                data <= x"0";
                null;
            when "01100001" =>
                data <= x"0";
                null;
            when "01100010" =>
                data <= x"5";
                null;
            when "01100011" =>
                data <= x"0";
                null;
            when "01100100" =>
                data <= x"0";
                null;
            when "01100101" =>
                data <= x"0";
                null;
            when "01100110" =>
                data <= x"0";
                null;
            when "01100111" =>
                data <= x"6";
                null;
            when "01101000" =>
                data <= x"7";
                null;
            when "01101001" =>
                data <= x"7";
                null;
            when "01101010" =>
                data <= x"6";
                null;
            when "01101011" =>
                data <= x"0";
                null;
            when "01101100" =>
                data <= x"0";
                null;
            when "01101101" =>
                data <= x"5";
                null;
            when "01101110" =>
                data <= x"0";
                null;
            when "01101111" =>
                data <= x"0";
                null;
            when "01110000" =>
                data <= x"0";
                null;
            when "01110001" =>
                data <= x"0";
                null;
            when "01110010" =>
                data <= x"6";
                null;
            when "01110011" =>
                data <= x"7";
                null;
            when "01110100" =>
                data <= x"2";
                null;
            when "01110101" =>
                data <= x"7";
                null;
            when "01110110" =>
                data <= x"0";
                null;
            when "01110111" =>
                data <= x"0";
                null;
            when "01111000" =>
                data <= x"4";
                null;
            when "01111001" =>
                data <= x"F";
                null;
            when "01111010" =>
                data <= x"F";
                null;
            when "01111011" =>
                data <= x"3";
                null;
            when "01111100" =>
                data <= x"E";
                null;
            when "01111101" =>
                data <= x"F";
                null;
            when "01111110" =>
                data <= x"5";
                null;
            when "01111111" =>
                data <= x"0";
                null;
            when "10000000" =>
                data <= x"0";
                null;
            when "10000001" =>
                data <= x"0";
                null;
            when "10000010" =>
                data <= x"0";
                null;
            when "10000011" =>
                data <= x"6";
                null;
            when "10000100" =>
                data <= x"7";
                null;
            when "10000101" =>
                data <= x"3";
                null;
            when "10000110" =>
                data <= x"8";
                null;
            when "10000111" =>
                data <= x"0";
                null;
            when "10001000" =>
                data <= x"0";
                null;
            when "10001001" =>
                data <= x"5";
                null;
            when "10001010" =>
                data <= x"0";
                null;
            when "10001011" =>
                data <= x"0";
                null;
            when "10001100" =>
                data <= x"0";
                null;
            when "10001101" =>
                data <= x"0";
                null;
            when "10001110" =>
                data <= x"6";
                null;
            when "10001111" =>
                data <= x"7";
                null;
            when "10010000" =>
                data <= x"E";
                null;
            when "10010001" =>
                data <= x"8";
                null;
            when "10010010" =>
                data <= x"0";
                null;
            when "10010011" =>
                data <= x"0";
                null;
            when "10010100" =>
                data <= x"5";
                null;
            when "10010101" =>
                data <= x"0";
                null;
            when "10010110" =>
                data <= x"0";
                null;
            when "10010111" =>
                data <= x"0";
                null;
            when "10011000" =>
                data <= x"0";
                null;
            when "10011001" =>
                data <= x"6";
                null;
            when "10011010" =>
                data <= x"7";
                null;
            when "10011011" =>
                data <= x"9";
                null;
            when "10011100" =>
                data <= x"9";
                null;
            when "10011101" =>
                data <= x"0";
                null;
            when "10011110" =>
                data <= x"0";
                null;
            when "10011111" =>
                data <= x"5";
                null;
            when "10100000" =>
                data <= x"0";
                null;
            when "10100001" =>
                data <= x"0";
                null;
            when "10100010" =>
                data <= x"0";
                null;
            when "10100011" =>
                data <= x"0";
                null;
            when "10100100" =>
                data <= x"6";
                null;
            when "10100101" =>
                data <= x"7";
                null;
            when "10100110" =>
                data <= x"4";
                null;
            when "10100111" =>
                data <= x"A";
                null;
            when "10101000" =>
                data <= x"0";
                null;
            when "10101001" =>
                data <= x"0";
                null;
            when "10101010" =>
                data <= x"5";
                null;
            when "10101011" =>
                data <= x"0";
                null;
            when "10101100" =>
                data <= x"0";
                null;
            when "10101101" =>
                data <= x"0";
                null;
            when "10101110" =>
                data <= x"0";
                null;
            when "10101111" =>
                data <= x"6";
                null;
            when "10110000" =>
                data <= x"7";
                null;
            when "10110001" =>
                data <= x"F";
                null;
            when "10110010" =>
                data <= x"A";
                null;
            when "10110011" =>
                data <= x"0";
                null;
            when "10110100" =>
                data <= x"0";
                null;
            when "10110101" =>
                data <= x"5";
                null;
            when "10110110" =>
                data <= x"0";
                null;
            when "10110111" =>
                data <= x"0";
                null;
            when "10111000" =>
                data <= x"0";
                null;
            when "10111001" =>
                data <= x"0";
                null;
            when "10111010" =>
                data <= x"6";
                null;
            when "10111011" =>
                data <= x"7";
                null;
            when "10111100" =>
                data <= x"A";
                null;
            when "10111101" =>
                data <= x"B";
                null;
            when "10111110" =>
                data <= x"0";
                null;
            when "10111111" =>
                data <= x"0";
                null;
            when "11000000" =>
                data <= x"5";
                null;
            when "11000001" =>
                data <= x"0";
                null;
            when "11000010" =>
                data <= x"0";
                null;
            when "11000011" =>
                data <= x"0";
                null;
            when "11000100" =>
                data <= x"0";
                null;
            when "11000101" =>
                data <= x"6";
                null;
            when "11000110" =>
                data <= x"7";
                null;
            when "11000111" =>
                data <= x"5";
                null;
            when "11001000" =>
                data <= x"C";
                null;
            when "11001001" =>
                data <= x"0";
                null;
            when "11001010" =>
                data <= x"0";
                null;
            when "11001011" =>
                data <= x"5";
                null;
            when "11001100" =>
                data <= x"0";
                null;
            when "11001101" =>
                data <= x"0";
                null;
            when "11001110" =>
                data <= x"0";
                null;
            when "11001111" =>
                data <= x"0";
                null;
            when "11010000" =>
                data <= x"6";
                null;
            when "11010001" =>
                data <= x"7";
                null;
            when "11010010" =>
                data <= x"0";
                null;
            when "11010011" =>
                data <= x"D";
                null;
            when "11010100" =>
                data <= x"0";
                null;
            when "11010101" =>
                data <= x"0";
                null;
            when "11010110" =>
                data <= x"5";
                null;
            when "11010111" =>
                data <= x"0";
                null;
            when "11011000" =>
                data <= x"0";
                null;
            when "11011001" =>
                data <= x"0";
                null;
            when "11011010" =>
                data <= x"0";
                null;
            when "11011011" =>
                data <= x"6";
                null;
            when "11011100" =>
                data <= x"7";
                null;
            when "11011101" =>
                data <= x"B";
                null;
            when "11011110" =>
                data <= x"D";
                null;
            when "11011111" =>
                data <= x"0";
                null;
            when "11100000" =>
                data <= x"0";
                null;
            when "11100001" =>
                data <= x"5";
                null;
            when "11100010" =>
                data <= x"0";
                null;
            when "11100011" =>
                data <= x"0";
                null;
            when "11100100" =>
                data <= x"0";
                null;
            when "11100101" =>
                data <= x"0";
                null;
            when "11100110" =>
                data <= x"6";
                null;
            when "11100111" =>
                data <= x"7";
                null;
            when "11101000" =>
                data <= x"6";
                null;
            when "11101001" =>
                data <= x"E";
                null;
            when "11101010" =>
                data <= x"0";
                null;
            when "11101011" =>
                data <= x"0";
                null;
            when "11101100" =>
                data <= x"8";
                null;
            when "11101101" =>
                data <= x"4";
                null;
            when "11101110" =>
                data <= x"0";
                null;
            when "11101111" =>
                data <= x"0";
                null;
            when "11110000" =>
                data <= x"0";
                null;
            when "11110001" =>
                data <= x"0";
                null;
            when "11110010" =>
                data <= x"0";
                null;
            when "11110011" =>
                data <= x"0";
                null;
            when "11110100" =>
                data <= x"0";
                null;
            when "11110101" =>
                data <= x"0";
                null;
            when "11110110" =>
                data <= x"0";
                null;
            when "11110111" =>
                data <= x"0";
                null;
            when "11111000" =>
                data <= x"0";
                null;
            when "11111001" =>
                data <= x"0";
                null;
            when "11111010" =>
                data <= x"0";
                null;
            when "11111011" =>
                data <= x"0";
                null;
            when "11111100" =>
                data <= x"0";
                null;
            when "11111101" =>
                data <= x"0";
                null;
            when "11111110" =>
                data <= x"0";
                null;
            when "11111111" =>
                data <= x"0";
                null;
        end case;
    end process;
end architecture ArchPMem;

