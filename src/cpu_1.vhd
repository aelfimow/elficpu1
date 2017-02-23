library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity CPU_1 is
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
end entity CPU_1;

architecture ARCH_CPU_1 of CPU_1 is

    constant OP_NOP: bit_vector(3 downto 0) := x"0";
    constant OP_LOAD_REG_A: bit_vector(3 downto 0) := x"1";
    constant OP_LOAD_REG_B: bit_vector(3 downto 0) := x"2";
    constant OP_HALT: bit_vector(3 downto 0) := x"F";
    constant OP_OUT_REG_A: bit_vector(3 downto 0) := x"3";
    constant OP_OUT_REG_B: bit_vector(3 downto 0) := x"4";
    constant OP_INIT_CNT: bit_vector(3 downto 0) := x"5";
    constant OP_DEC_CNT: bit_vector(3 downto 0) := x"6";
    constant OP_JNZ_ADDR: bit_vector(3 downto 0) := x"7";
    constant OP_JMP_ADDR: bit_vector(3 downto 0) := x"8";

    type cpu_state is (
        CPU_RESET,
        CPU_HALT,
        CPU_DECODE,
        CPU_FETCH_CONST_A,
        CPU_FETCH_CONST_B,
        CPU_FETCH_PORT_ADDR_L,
        CPU_FETCH_PORT_ADDR_H,
        CPU_PORT_WRITE_A,
        CPU_PORT_WRITE_B,
        CPU_FETCH_ADDR_0,
        CPU_FETCH_ADDR_1,
        CPU_FETCH_ADDR_2,
        CPU_FETCH_ADDR_3,
        CPU_FETCH_CNT_0,
        CPU_FETCH_CNT_1,
        CPU_FETCH_CNT_2,
        CPU_FETCH_CNT_3,
        CPU_EXEC_JNZ,
        CPU_EXEC_JMP,
        CPU_EXEC_DEC_CNT,
        CPU_EXEC_LOAD_CNT,
        CPU_PORT_WAIT,
        CPU_FETCH_OP);

    signal state: cpu_state;

    signal clk: bit;
    signal rst: bit;

    signal pdata_wr: bit_vector(3 downto 0);
    signal pdata_rd: bit_vector(3 downto 0);
    signal RegI: bit_vector(3 downto 0);
    signal pmem_rd: bit;
    signal RegPC: bit_vector(15 downto 0);
    signal TmpAddr: bit_vector(15 downto 0);
    signal paddr_inc: bit_vector(15 downto 0);

    signal RegA: bit_vector(3 downto 0);
    signal RegB: bit_vector(3 downto 0);

    signal portaddr: bit_vector(7 downto 0);
    signal TmpPortAddr: bit_vector(7 downto 0);
    signal portready: bit;
    signal PortDataOut: bit_vector(3 downto 0);
    signal portdata_rd: bit_vector(3 downto 0);

    signal RegCnt: bit_vector(15 downto 0);
    signal RegCntDec: bit_vector(15 downto 0);
    signal TmpCnt: bit_vector(15 downto 0);

begin

    INPUT_BLOCK: block
    begin
        clk <= clk_i;
        rst <= rst_i;
        pdata_rd <= pdata_i;
        portdata_rd <= portdata_i;
        portready <= portready_i;
    end block INPUT_BLOCK;

    OUTPUT_BLOCK: block
    begin
        paddr_o <= RegPC;
        pdata_o <= pdata_wr;
        pmem_rd_o <= pmem_rd;
        portaddr_o <= portaddr;
        portdata_o <= PortDataOut;
    end block OUTPUT_BLOCK;

    PADDR_INC_PROC: process(RegPC)
        variable tmp_paddr: std_logic_vector(15 downto 0);
        variable tmp_paddr_inc: unsigned(15 downto 0);
    begin
        tmp_paddr := To_StdLogicVector(RegPC);
        tmp_paddr_inc := unsigned(tmp_paddr) + 1;
        paddr_inc <= To_bitvector(std_logic_vector(tmp_paddr_inc));
    end process PADDR_INC_PROC;

    CNT_DEC_PROC: process(RegCnt)
        variable tmp_cnt: std_logic_vector(15 downto 0);
        variable tmp_cnt_dec: unsigned(15 downto 0);
    begin
        tmp_cnt := To_StdLogicVector(RegCnt);
        tmp_cnt_dec := unsigned(tmp_cnt) - 1;
        RegCntDec <= To_bitvector(std_logic_vector(tmp_cnt_dec));
    end process CNT_DEC_PROC;

    PMEM_SIG_PROC: process(state)
    begin
        case state is
            when CPU_RESET =>
                pmem_rd <= '0';
                pdata_wr <= (others => '0');
                null;
            when CPU_HALT =>
                pmem_rd <= '0';
                pdata_wr <= (others => '0');
                null;
            when CPU_DECODE =>
                pmem_rd <= '0';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_CONST_A =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_CONST_B =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_OP =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_PORT_ADDR_L =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_PORT_ADDR_H =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_ADDR_0 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_ADDR_1 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_ADDR_2 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_ADDR_3 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_CNT_0 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_CNT_1 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_CNT_2 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when CPU_FETCH_CNT_3 =>
                pmem_rd <= '1';
                pdata_wr <= (others => '0');
                null;
            when others =>
                pmem_rd <= '0';
                pdata_wr <= (others => '0');
                null;
        end case;
    end process PMEM_SIG_PROC;

    PORT_SIG_PROC: process(state)
    begin
        case state is
            when CPU_PORT_WRITE_A =>
                portwr_o <= '0';
                portrd_o <= '0';
                null;
            when CPU_PORT_WRITE_B =>
                portwr_o <= '0';
                portrd_o <= '0';
                null;
            when CPU_PORT_WAIT =>
                portwr_o <= '1';
                portrd_o <= '0';
                null;
            when others =>
                portwr_o <= '0';
                portrd_o <= '0';
                null;
        end case;
    end process PORT_SIG_PROC;

    process(clk, rst)
    begin
        if clk = '1' and clk'event then
            if rst = '1' then
                state <= CPU_RESET;
                RegA <= (others => '0');
                RegB <= (others => '0');
                RegPC <= (others => '0');
                RegI <= (others => '0');
                PortDataOut <= (others => '0');
                TmpCnt <= (others => '0');
                RegCnt <= (others => '0');
            else
                RegA <= RegA;
                RegB <= RegB;
                RegPC <= RegPC;
                RegI <= RegI;
                TmpCnt <= TmpCnt;
                RegCnt <= RegCnt;
                PortDataOut <= PortDataOut;
                case state is
                    when CPU_RESET =>
                        RegPC <= (others => '0');
                        state <= CPU_FETCH_OP;
                        null;
                    when CPU_FETCH_OP =>
                        -- fetch operation code
                        RegI <= pdata_rd;
                        state <= CPU_DECODE;
                        null;
                    when CPU_DECODE =>
                        -- decode command
                        RegPC <= paddr_inc;
                        case RegI is
                            when OP_NOP =>
                                state <= CPU_FETCH_OP;
                                null;
                            when OP_LOAD_REG_A =>
                                state <= CPU_FETCH_CONST_A;
                                null;
                            when OP_LOAD_REG_B =>
                                state <= CPU_FETCH_CONST_B;
                                null;
                            when OP_HALT =>
                                state <= CPU_HALT;
                                null;
                            when OP_OUT_REG_A =>
                                state <= CPU_FETCH_PORT_ADDR_L;
                                null;
                            when OP_OUT_REG_B =>
                                state <= CPU_FETCH_PORT_ADDR_L;
                                null;
                            when OP_INIT_CNT =>
                                state <= CPU_FETCH_CNT_0;
                                null;
                            when OP_DEC_CNT =>
                                state <= CPU_EXEC_DEC_CNT;
                                null;
                            when OP_JNZ_ADDR =>
                                state <= CPU_FETCH_ADDR_0;
                                null;
                            when OP_JMP_ADDR =>
                                state <= CPU_FETCH_ADDR_0;
                                null;
                            when others =>
                                state <= CPU_FETCH_OP;
                                null;
                        end case;
                        null;
                    when CPU_FETCH_CONST_A =>
                        -- load constant to register A
                        RegA <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_OP;
                        null;
                    when CPU_FETCH_CONST_B =>
                        -- load constant to register B
                        RegB <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_OP;
                        null;
                    when CPU_FETCH_PORT_ADDR_L =>
                        -- load low nibble of port address
                        TmpPortAddr(3 downto 0) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_PORT_ADDR_H;
                        null;
                    when CPU_FETCH_ADDR_0 =>
                        TmpAddr(3 downto 0) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_ADDR_1;
                        null;
                    when CPU_FETCH_ADDR_1 =>
                        TmpAddr(7 downto 4) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_ADDR_2;
                        null;
                    when CPU_FETCH_ADDR_2 =>
                        TmpAddr(11 downto 8) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_ADDR_3;
                        null;
                    when CPU_FETCH_ADDR_3 =>
                        TmpAddr(15 downto 12) <= pdata_rd;
                        case RegI is
                            when OP_JNZ_ADDR =>
                                state <= CPU_EXEC_JNZ;
                                null;
                            when OP_JMP_ADDR =>
                                state <= CPU_EXEC_JMP;
                                null;
                            when others =>
                                state <= CPU_RESET;
                                null;
                        end case;
                        null;
                    when CPU_FETCH_CNT_0 =>
                        TmpCnt(3 downto 0) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_CNT_1;
                        null;
                    when CPU_FETCH_CNT_1 =>
                        TmpCnt(7 downto 4) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_CNT_2;
                        null;
                    when CPU_FETCH_CNT_2 =>
                        TmpCnt(11 downto 8) <= pdata_rd;
                        RegPC <= paddr_inc;
                        state <= CPU_FETCH_CNT_3;
                        null;
                    when CPU_FETCH_CNT_3 =>
                        TmpCnt(15 downto 12) <= pdata_rd;
                        state <= CPU_EXEC_LOAD_CNT;
                        null;
                    when CPU_EXEC_JNZ =>
                        state <= CPU_FETCH_OP;
                        if RegCnt = x"0000" then
                            RegPC <= paddr_inc;
                        else
                            RegPC <= TmpAddr;
                        end if;
                        null;
                    when CPU_EXEC_JMP =>
                        RegPC <= TmpAddr;
                        state <= CPU_FETCH_OP;
                        null;
                    when CPU_EXEC_LOAD_CNT =>
                        RegCnt <= TmpCnt;
                        state <= CPU_FETCH_OP;
                        null;
                    when CPU_EXEC_DEC_CNT =>
                        RegCnt <= RegCntDec;
                        state <= CPU_FETCH_OP;
                        null;
                    when CPU_FETCH_PORT_ADDR_H =>
                        -- load high nibble of port address
                        TmpPortAddr(7 downto 4) <= pdata_rd;
                        RegPC <= paddr_inc;
                        case RegI is
                            when OP_OUT_REG_A =>
                                state <= CPU_PORT_WRITE_A;
                                null;
                            when OP_OUT_REG_B =>
                                state <= CPU_PORT_WRITE_B;
                                null;
                            when others =>
                                state <= CPU_RESET;
                                null;
                        end case;
                        null;
                    when CPU_PORT_WRITE_A =>
                        portaddr <= TmpPortAddr;
                        PortDataOut <= RegA;
                        state <= CPU_PORT_WAIT;
                        null;
                    when CPU_PORT_WRITE_B =>
                        portaddr <= TmpPortAddr;
                        PortDataOut <= RegB;
                        state <= CPU_PORT_WAIT;
                        null;
                    when CPU_PORT_WAIT =>
                        if portready = '1' then
                            portaddr <= (others => '0');
                            PortDataOut <= (others => '0');
                            state <= CPU_FETCH_OP;
                        else
                            state <= CPU_PORT_WAIT;
                        end if;
                    when CPU_HALT =>
                        RegPC <= (others => '0');
                        null;
                    when others =>
                        state <= CPU_RESET;
                        null;
                end case;
            end if;
        end if;
    end process;

end architecture ARCH_CPU_1;

