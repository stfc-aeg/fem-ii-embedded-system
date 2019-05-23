--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
--Date        : Fri Sep  7 10:32:02 2018
--Host        : te7aegdev08.te.rl.ac.uk running 64-bit CentOS Linux release 7.5.1804 (Core)
--Command     : generate_target c2c_top_wrapper.bd
--Design      : c2c_top_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2c_top_wrapper is
  port (
    DDR3_PGADD : out STD_LOGIC_VECTOR ( 2 downto 0 );
--    DDR3_addr : out STD_LOGIC_VECTOR ( 12 downto 0 );
--    DDR3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
--    DDR3_cas_n : out STD_LOGIC;
--    DDR3_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
--    DDR3_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
--    DDR3_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
--    DDR3_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
--    DDR3_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_ras_n : out STD_LOGIC;
--    DDR3_reset_n : out STD_LOGIC;
--    DDR3_we_n : out STD_LOGIC;
--    SYS_CLK_clk_n : in STD_LOGIC;
--    SYS_CLK_clk_p : in STD_LOGIC;
    axi_c2c_selio_rx_clk_in : in STD_LOGIC;
    axi_c2c_selio_rx_data_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    axi_c2c_selio_tx_clk_out : out STD_LOGIC;
    axi_c2c_selio_tx_data_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    led_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    led_d : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi_0_io0_io : inout STD_LOGIC;
    spi_0_io1_io : inout STD_LOGIC;
    spi_0_io2_io : inout STD_LOGIC;
    spi_0_io3_io : inout STD_LOGIC;
    spi_0_sck_io : inout STD_LOGIC;
    spi_0_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 )
  );
end c2c_top_wrapper;

architecture STRUCTURE of c2c_top_wrapper is
  component c2c_top is
  port (
--    DDR3_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
--    DDR3_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
--    DDR3_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
--    DDR3_addr : out STD_LOGIC_VECTOR ( 12 downto 0 );
--    DDR3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
--    DDR3_ras_n : out STD_LOGIC;
--    DDR3_cas_n : out STD_LOGIC;
--    DDR3_we_n : out STD_LOGIC;
--    DDR3_reset_n : out STD_LOGIC;
--    DDR3_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
--    DDR3_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
--    DDR3_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
--    SYS_CLK_clk_p : in STD_LOGIC;
--    SYS_CLK_clk_n : in STD_LOGIC;
    SPI_0_io0_i : in STD_LOGIC;
    SPI_0_io0_o : out STD_LOGIC;
    SPI_0_io0_t : out STD_LOGIC;
    SPI_0_io1_i : in STD_LOGIC;
    SPI_0_io1_o : out STD_LOGIC;
    SPI_0_io1_t : out STD_LOGIC;
    SPI_0_io2_i : in STD_LOGIC;
    SPI_0_io2_o : out STD_LOGIC;
    SPI_0_io2_t : out STD_LOGIC;
    SPI_0_io3_i : in STD_LOGIC;
    SPI_0_io3_o : out STD_LOGIC;
    SPI_0_io3_t : out STD_LOGIC;
    SPI_0_sck_i : in STD_LOGIC;
    SPI_0_sck_o : out STD_LOGIC;
    SPI_0_sck_t : out STD_LOGIC;
    SPI_0_ss_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPI_0_ss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    SPI_0_ss_t : out STD_LOGIC;
    axi_c2c_selio_rx_clk_in : in STD_LOGIC;
    axi_c2c_selio_rx_data_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    axi_c2c_selio_tx_clk_out : out STD_LOGIC;
    axi_c2c_selio_tx_data_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    DDR3_PGADD : out STD_LOGIC_VECTOR ( 2 downto 0 );
    led_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    led_d : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c2c_top;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal spi_0_io0_i : STD_LOGIC;
  signal spi_0_io0_o : STD_LOGIC;
  signal spi_0_io0_t : STD_LOGIC;
  signal spi_0_io1_i : STD_LOGIC;
  signal spi_0_io1_o : STD_LOGIC;
  signal spi_0_io1_t : STD_LOGIC;
  signal spi_0_io2_i : STD_LOGIC;
  signal spi_0_io2_o : STD_LOGIC;
  signal spi_0_io2_t : STD_LOGIC;
  signal spi_0_io3_i : STD_LOGIC;
  signal spi_0_io3_o : STD_LOGIC;
  signal spi_0_io3_t : STD_LOGIC;
  signal spi_0_sck_i : STD_LOGIC;
  signal spi_0_sck_o : STD_LOGIC;
  signal spi_0_sck_t : STD_LOGIC;
  signal spi_0_ss_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_0_ss_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_0_ss_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_0_ss_t : STD_LOGIC;
begin
c2c_top_i: component c2c_top
     port map (
      DDR3_PGADD(2 downto 0) => DDR3_PGADD(2 downto 0),
--      DDR3_addr(12 downto 0) => DDR3_addr(12 downto 0),
--      DDR3_ba(2 downto 0) => DDR3_ba(2 downto 0),
--      DDR3_cas_n => DDR3_cas_n,
--      DDR3_ck_n(0) => DDR3_ck_n(0),
--      DDR3_ck_p(0) => DDR3_ck_p(0),
--      DDR3_cke(0) => DDR3_cke(0),
--      DDR3_cs_n(0) => DDR3_cs_n(0),
--      DDR3_dm(7 downto 0) => DDR3_dm(7 downto 0),
--      DDR3_dq(63 downto 0) => DDR3_dq(63 downto 0),
--      DDR3_dqs_n(7 downto 0) => DDR3_dqs_n(7 downto 0),
--      DDR3_dqs_p(7 downto 0) => DDR3_dqs_p(7 downto 0),
--      DDR3_odt(0) => DDR3_odt(0),
--      DDR3_ras_n => DDR3_ras_n,
--      DDR3_reset_n => DDR3_reset_n,
--      DDR3_we_n => DDR3_we_n,
      SPI_0_io0_i => spi_0_io0_i,
      SPI_0_io0_o => spi_0_io0_o,
      SPI_0_io0_t => spi_0_io0_t,
      SPI_0_io1_i => spi_0_io1_i,
      SPI_0_io1_o => spi_0_io1_o,
      SPI_0_io1_t => spi_0_io1_t,
      SPI_0_io2_i => spi_0_io2_i,
      SPI_0_io2_o => spi_0_io2_o,
      SPI_0_io2_t => spi_0_io2_t,
      SPI_0_io3_i => spi_0_io3_i,
      SPI_0_io3_o => spi_0_io3_o,
      SPI_0_io3_t => spi_0_io3_t,
      SPI_0_sck_i => spi_0_sck_i,
      SPI_0_sck_o => spi_0_sck_o,
      SPI_0_sck_t => spi_0_sck_t,
      SPI_0_ss_i(0) => spi_0_ss_i_0(0),
      SPI_0_ss_o(0) => spi_0_ss_o_0(0),
      SPI_0_ss_t => spi_0_ss_t,
--      SYS_CLK_clk_n => SYS_CLK_clk_n,
--      SYS_CLK_clk_p => SYS_CLK_clk_p,
      axi_c2c_selio_rx_clk_in => axi_c2c_selio_rx_clk_in,
      axi_c2c_selio_rx_data_in(8 downto 0) => axi_c2c_selio_rx_data_in(8 downto 0),
      axi_c2c_selio_tx_clk_out => axi_c2c_selio_tx_clk_out,
      axi_c2c_selio_tx_data_out(8 downto 0) => axi_c2c_selio_tx_data_out(8 downto 0),
      led_c(0) => led_c(0),
      led_d(0) => led_d(0)
    );
spi_0_io0_iobuf: component IOBUF
     port map (
      I => spi_0_io0_o,
      IO => spi_0_io0_io,
      O => spi_0_io0_i,
      T => spi_0_io0_t
    );
spi_0_io1_iobuf: component IOBUF
     port map (
      I => spi_0_io1_o,
      IO => spi_0_io1_io,
      O => spi_0_io1_i,
      T => spi_0_io1_t
    );
spi_0_io2_iobuf: component IOBUF
     port map (
      I => spi_0_io2_o,
      IO => spi_0_io2_io,
      O => spi_0_io2_i,
      T => spi_0_io2_t
    );
spi_0_io3_iobuf: component IOBUF
     port map (
      I => spi_0_io3_o,
      IO => spi_0_io3_io,
      O => spi_0_io3_i,
      T => spi_0_io3_t
    );
spi_0_sck_iobuf: component IOBUF
     port map (
      I => spi_0_sck_o,
      IO => spi_0_sck_io,
      O => spi_0_sck_i,
      T => spi_0_sck_t
    );
spi_0_ss_iobuf_0: component IOBUF
     port map (
      I => spi_0_ss_o_0(0),
      IO => spi_0_ss_io(0),
      O => spi_0_ss_i_0(0),
      T => spi_0_ss_t
    );
end STRUCTURE;
