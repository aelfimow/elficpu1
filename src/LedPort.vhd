
entity LedPort is
    generic (PORT_ADDR: bit_vector(7 downto 0) := x"FF");
    port (
        clk_i: in bit;
        rst_i: in bit;
        addr_i: in bit_vector(7 downto 0);
        data_i: in bit_vector(3 downto 0);
        wr_i: in bit;
        led_driver_o: out bit_vector(3 downto 0));
end entity LedPort;

architecture ArchLedPort of LedPort is
    signal clk: bit;
    signal rst: bit;
    signal led_sig: bit_vector(3 downto 0);
    signal data: bit_vector(3 downto 0);
    signal addr: bit_vector(7 downto 0);
    signal wr: bit;
begin

    SIG_BLOCK: block
    begin
        clk <= clk_i;
        rst <= rst_i;
        led_driver_o <= led_sig;
        addr <= addr_i;
        wr <= wr_i;
        data <= data_i;
    end block SIG_BLOCK;

    process(clk, rst)
    begin
        if clk = '1' and clk'event then
            if rst = '1' then
                led_sig <= (others => '0');
            elsif wr = '1' then
                if addr = PORT_ADDR then
                    led_sig <= data;
                else
                    led_sig <= led_sig;
                end if;
            else
                led_sig <= led_sig;
            end if;
        end if;
    end process;

end architecture ArchLedPort;

