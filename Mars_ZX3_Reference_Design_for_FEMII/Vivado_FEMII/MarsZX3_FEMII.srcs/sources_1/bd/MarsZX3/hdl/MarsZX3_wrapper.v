//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Tue Oct  2 12:47:12 2018
//Host        : te7aegdev08.te.rl.ac.uk running 64-bit CentOS Linux release 7.5.1804 (Core)
//Command     : generate_target MarsZX3_wrapper.bd
//Design      : MarsZX3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MarsZX3_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK1,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    RESET_N,
    UART_0_rxd,
    UART_0_txd,
    c2c_clk_in,
    c2c_clk_out,
    c2c_data_in,
    c2c_data_out,
    control_o,
    gpio_reset_resetn,
    gpio_tri_o,
    iic_0_scl_io,
    iic_0_sda_io,
    iic_1_scl_io,
    iic_1_sda_io,
    reset_gpio_wo,
    spi_0_io0_io,
    spi_0_io1_io,
    spi_0_io2_io,
    spi_0_io3_io,
    spi_0_sck_io,
    spi_0_ss_io,
    status_i);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  output FCLK_CLK1;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output RESET_N;
  input UART_0_rxd;
  output UART_0_txd;
  input c2c_clk_in;
  output c2c_clk_out;
  input [8:0]c2c_data_in;
  output [8:0]c2c_data_out;
  output [8:0]control_o;
  input gpio_reset_resetn;
  output [7:0]gpio_tri_o;
  inout iic_0_scl_io;
  inout iic_0_sda_io;
  inout iic_1_scl_io;
  inout iic_1_sda_io;
  output [5:0]reset_gpio_wo;
  inout spi_0_io0_io;
  inout spi_0_io1_io;
  inout spi_0_io2_io;
  inout spi_0_io3_io;
  inout spi_0_sck_io;
  inout [0:0]spi_0_ss_io;
  input [11:0]status_i;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FCLK_CLK1;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire RESET_N;
  wire UART_0_rxd;
  wire UART_0_txd;
  wire c2c_clk_in;
  wire c2c_clk_out;
  wire [8:0]c2c_data_in;
  wire [8:0]c2c_data_out;
  wire [8:0]control_o;
  wire gpio_reset_resetn;
  wire [7:0]gpio_tri_o;
  wire iic_0_scl_i;
  wire iic_0_scl_io;
  wire iic_0_scl_o;
  wire iic_0_scl_t;
  wire iic_0_sda_i;
  wire iic_0_sda_io;
  wire iic_0_sda_o;
  wire iic_0_sda_t;
  wire iic_1_scl_i;
  wire iic_1_scl_io;
  wire iic_1_scl_o;
  wire iic_1_scl_t;
  wire iic_1_sda_i;
  wire iic_1_sda_io;
  wire iic_1_sda_o;
  wire iic_1_sda_t;
  wire [5:0]reset_gpio_wo;
  wire spi_0_io0_i;
  wire spi_0_io0_io;
  wire spi_0_io0_o;
  wire spi_0_io0_t;
  wire spi_0_io1_i;
  wire spi_0_io1_io;
  wire spi_0_io1_o;
  wire spi_0_io1_t;
  wire spi_0_io2_i;
  wire spi_0_io2_io;
  wire spi_0_io2_o;
  wire spi_0_io2_t;
  wire spi_0_io3_i;
  wire spi_0_io3_io;
  wire spi_0_io3_o;
  wire spi_0_io3_t;
  wire spi_0_sck_i;
  wire spi_0_sck_io;
  wire spi_0_sck_o;
  wire spi_0_sck_t;
  wire [0:0]spi_0_ss_i_0;
  wire [0:0]spi_0_ss_io_0;
  wire [0:0]spi_0_ss_o_0;
  wire spi_0_ss_t;
  wire [11:0]status_i;

  MarsZX3 MarsZX3_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK1(FCLK_CLK1),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO_tri_o(gpio_tri_o),
        .IIC_0_scl_i(iic_0_scl_i),
        .IIC_0_scl_o(iic_0_scl_o),
        .IIC_0_scl_t(iic_0_scl_t),
        .IIC_0_sda_i(iic_0_sda_i),
        .IIC_0_sda_o(iic_0_sda_o),
        .IIC_0_sda_t(iic_0_sda_t),
        .IIC_1_scl_i(iic_1_scl_i),
        .IIC_1_scl_o(iic_1_scl_o),
        .IIC_1_scl_t(iic_1_scl_t),
        .IIC_1_sda_i(iic_1_sda_i),
        .IIC_1_sda_o(iic_1_sda_o),
        .IIC_1_sda_t(iic_1_sda_t),
        .RESET_N(RESET_N),
        .SPI_0_io0_i(spi_0_io0_i),
        .SPI_0_io0_o(spi_0_io0_o),
        .SPI_0_io0_t(spi_0_io0_t),
        .SPI_0_io1_i(spi_0_io1_i),
        .SPI_0_io1_o(spi_0_io1_o),
        .SPI_0_io1_t(spi_0_io1_t),
        .SPI_0_io2_i(spi_0_io2_i),
        .SPI_0_io2_o(spi_0_io2_o),
        .SPI_0_io2_t(spi_0_io2_t),
        .SPI_0_io3_i(spi_0_io3_i),
        .SPI_0_io3_o(spi_0_io3_o),
        .SPI_0_io3_t(spi_0_io3_t),
        .SPI_0_sck_i(spi_0_sck_i),
        .SPI_0_sck_o(spi_0_sck_o),
        .SPI_0_sck_t(spi_0_sck_t),
        .SPI_0_ss_i(spi_0_ss_i_0),
        .SPI_0_ss_o(spi_0_ss_o_0),
        .SPI_0_ss_t(spi_0_ss_t),
        .UART_0_rxd(UART_0_rxd),
        .UART_0_txd(UART_0_txd),
        .c2c_clk_in(c2c_clk_in),
        .c2c_clk_out(c2c_clk_out),
        .c2c_data_in(c2c_data_in),
        .c2c_data_out(c2c_data_out),
        .control_o(control_o),
        .gpio_reset_resetn(gpio_reset_resetn),
        .reset_gpio_wo(reset_gpio_wo),
        .status_i(status_i));
  IOBUF iic_0_scl_iobuf
       (.I(iic_0_scl_o),
        .IO(iic_0_scl_io),
        .O(iic_0_scl_i),
        .T(iic_0_scl_t));
  IOBUF iic_0_sda_iobuf
       (.I(iic_0_sda_o),
        .IO(iic_0_sda_io),
        .O(iic_0_sda_i),
        .T(iic_0_sda_t));
  IOBUF iic_1_scl_iobuf
       (.I(iic_1_scl_o),
        .IO(iic_1_scl_io),
        .O(iic_1_scl_i),
        .T(iic_1_scl_t));
  IOBUF iic_1_sda_iobuf
       (.I(iic_1_sda_o),
        .IO(iic_1_sda_io),
        .O(iic_1_sda_i),
        .T(iic_1_sda_t));
  IOBUF spi_0_io0_iobuf
       (.I(spi_0_io0_o),
        .IO(spi_0_io0_io),
        .O(spi_0_io0_i),
        .T(spi_0_io0_t));
  IOBUF spi_0_io1_iobuf
       (.I(spi_0_io1_o),
        .IO(spi_0_io1_io),
        .O(spi_0_io1_i),
        .T(spi_0_io1_t));
  IOBUF spi_0_io2_iobuf
       (.I(spi_0_io2_o),
        .IO(spi_0_io2_io),
        .O(spi_0_io2_i),
        .T(spi_0_io2_t));
  IOBUF spi_0_io3_iobuf
       (.I(spi_0_io3_o),
        .IO(spi_0_io3_io),
        .O(spi_0_io3_i),
        .T(spi_0_io3_t));
  IOBUF spi_0_sck_iobuf
       (.I(spi_0_sck_o),
        .IO(spi_0_sck_io),
        .O(spi_0_sck_i),
        .T(spi_0_sck_t));
  IOBUF spi_0_ss_iobuf_0
       (.I(spi_0_ss_o_0),
        .IO(spi_0_ss_io[0]),
        .O(spi_0_ss_i_0),
        .T(spi_0_ss_t));
endmodule
