
entity main is
    port (
        clk_i: in bit;
        rst_i: in bit;
        led_driver_o: out bit_vector(3 downto 0);
        led_driver2_o: out bit_vector(3 downto 0));
end entity main;

architecture ArchMain of main is

    component CPU_1 is
        port (
            clk_i: in bit;
            rst_i: in bit;
            paddr_o: out bit_vector(15 downto 0);
            pdata_o: out bit_vector(3 downto 0);
            pdata_i: in bit_vector(3 downto 0);
            pmem_rd_o: out bit;
            portaddr_o: out bit_vector(7 downto 0);
            portdata_o: out bit_vector(3 downto 0);
            portdata_i: in bit_vector(3 downto 0);
            portrd_o: out bit;
            portwr_o: out bit;
            portready_i: in bit);
    end component CPU_1;

    component pMem is
        port (
            addr_i: in bit_vector(15 downto 0);
            data_o: out bit_vector(3 downto 0);
            rd_i: in bit);
    end component pMem;

    component LedPort is
        generic (PORT_ADDR: bit_vector(7 downto 0) := x"FF");
        port (
            clk_i: in bit;
            rst_i: in bit;
            addr_i: in bit_vector(7 downto 0);
            data_i: in bit_vector(3 downto 0);
            wr_i: in bit;
            led_driver_o: out bit_vector(3 downto 0));
    end component LedPort;

    signal clk: bit;
    signal rst: bit;
    signal paddr: bit_vector(15 downto 0);
    signal pdata: bit_vector(3 downto 0);
    signal pmem_rd: bit;

    signal portaddr: bit_vector(7 downto 0);
    signal PortDataOut: bit_vector(3 downto 0);
    signal portwr: bit;

    signal led_sig_0: bit_vector(3 downto 0);
    signal led_sig_1: bit_vector(3 downto 0);

begin

    SIG_BLOCK: block
    begin
        clk <= clk_i;
        rst <= rst_i;
        led_driver_o <= led_sig_0;
        led_driver2_o <= led_sig_1;
    end block SIG_BLOCK;

    CPU_INST: CPU_1
        port map (
            clk_i => clk,
            rst_i => rst,
            paddr_o => paddr,
            pdata_o => open,
            pdata_i => pdata,
            pmem_rd_o => pmem_rd,
            portaddr_o => portaddr,
            portdata_o => PortDataOut,
            portdata_i => x"0",
            portrd_o => open,
            portwr_o => portwr,
            portready_i => '1');

    PMEM_INST: pMem
        port map (
            addr_i => paddr,
            data_o => pdata,
            rd_i => pmem_rd);

    LED_PORT_INST_0: LedPort
        generic map (PORT_ADDR => x"FF")
        port map (
            clk_i => clk,
            rst_i => rst,
            addr_i => portaddr,
            data_i => PortDataOut,
            wr_i => portwr,
            led_driver_o => led_sig_0);

    LED_PORT_INST_1: LedPort
        generic map (PORT_ADDR => x"FE")
        port map (
            clk_i => clk,
            rst_i => rst,
            addr_i => portaddr,
            data_i => PortDataOut,
            wr_i => portwr,
            led_driver_o => led_sig_1);

end architecture ArchMain;

