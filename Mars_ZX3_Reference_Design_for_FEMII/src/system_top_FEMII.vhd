---------------------------------------------------------------------------------------------------
--  Project          : Mars ZX3 Vivado Reference Design
--  File description : Top Level file for Mars PM3
--  File name        : system_top.vhd
--  Author           : Christoph Glattfelder
---------------------------------------------------------------------------------------------------
--  Copyright (c) 2014 by Enclustra GmbH, Switzerland
--  All rights reserved.
---------------------------------------------------------------------------------------------------
--  Description:
--    This is a top-level file for the Mars ZX3 Vivado reference design. 
--    
--    
---------------------------------------------------------------------------------------------------
--  File history:
--
--  Version | Date     | Author             | Remarks
--  -----------------------------------------------------------------------------------------------
--  1.0     | 21.01.14 | Ch. Glattfelder    | First released version
--          |          |                    |
---------------------------------------------------------------------------------------------------


library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity system_top is
	port (
		DDR_addr			: inout std_logic_vector ( 14 downto 0 );
		DDR_ba				: inout std_logic_vector ( 2 downto 0 );
		DDR_cas_n			: inout std_logic;
		DDR_ck_n			: inout std_logic;
		DDR_ck_p			: inout std_logic;
		DDR_cke				: inout std_logic;
		DDR_cs_n			: inout std_logic;
		DDR_dm				: inout std_logic_vector ( 3 downto 0 );
		DDR_dq				: inout std_logic_vector ( 31 downto 0 );
		DDR_dqs_n			: inout std_logic_vector ( 3 downto 0 );
		DDR_dqs_p			: inout std_logic_vector ( 3 downto 0 );
		DDR_odt				: inout std_logic;
		DDR_ras_n			: inout std_logic;
		DDR_reset_n			: inout std_logic;
		DDR_we_n			: inout std_logic;
		gpio_io_o           : inout std_logic_vector ( 7 downto 0 );
		FIXED_IO_ddr_vrn	: inout std_logic;
		FIXED_IO_ddr_vrp	: inout std_logic;
		FIXED_IO_mio		: inout std_logic_vector ( 53 downto 0 );
		FIXED_IO_ps_clk		: inout std_logic;
		FIXED_IO_ps_porb	: inout std_logic;
		FIXED_IO_ps_srstb	: inout std_logic;

		Eth_Rst_N			: inout	std_logic;
		Usb_Rst_N			: inout	std_logic;

		UART0_TX			: out 	std_logic; 
		UART0_RX 			: in 	std_logic;

		I2C0_SDA			: inout std_logic; 
		I2C0_SCL			: inout std_logic; 
		I2C0_INT_N_pin		: in 	std_logic; 
		
		Rev5				: in	std_logic;
		Rev4				: in	std_logic;

		Led_N 				: out	std_logic_vector(3 downto 0);
		
		-- unused pins, set to high impedance
		Vref0				: inout std_logic; 
		Vref1				: inout std_logic; 
		CLK33				: inout std_logic;
		NAND_WP				: inout std_logic;
		PWR_GOOD_R			: inout std_logic;
        DDR3_VSEL           : inout std_logic;
		
		ETH_Link			: inout std_logic;
		ETH_MDC				: inout std_logic; 
		ETH_MDIO			: inout std_logic; 
		ETH_RX_CLK			: inout std_logic; 
		ETH_RX_CTL			: inout std_logic; 
		ETH_RXD				: inout std_logic_vector(3 downto 0);
		ETH_TX_CLK			: inout std_logic; 
		ETH_TX_CTL			: inout std_logic; 
		ETH_TXD				: inout std_logic_vector(3 downto 0);
		



		--------------------------------------------------
        -- FEM-II specific signals
        --------------------------------------------------
        --LEDs
        ZY_A_LED              : out std_logic;
        ZY_B_LED              : out std_logic;
        
        --IIC interface
        I2C1_SDA			: inout std_logic; 
        I2C1_SCL            : inout std_logic; 
        I2C1_INT_N_pin        : in     std_logic; 
                     
        --chip 2 chip 1v8
        ZY_2_V7_CK          : out std_logic;
        ZY_2_V7_D           : out std_logic_vector(8 downto 0);
        V7_2_ZY_CK          : in std_logic;
        V7_2_ZY_D           : in std_logic_vector(8 downto 0); 
                
        -- Control Register signals
        F_CLK_SEL           : out std_logic;
        FSEL_1_DE           : out std_logic;
        FSEL_0_DE           : out std_logic;   
        QSFP_I2C_SEL0       : out std_logic;        
        LPMODE0             : out std_logic;
        MODPRSL0            : out std_logic;
        LPMODE1             : out std_logic;
        MODPRSL1            : out std_logic;
        P1V0_EN_ZYNC        : out std_logic;
                        
        --RESET SIGNALS
        V7_PRG_ZY           : out    std_logic;
        V7_INIT_B           : out    std_logic;
        RESETL1             : out    std_logic;
        RESETL0             : out    std_logic;
        ZYNC_FW_RST_N       : out    std_logic;
        ZYNC_F_RST          : out    std_logic;
                        
        --Status Register Signals
        P3V3_PGOOD           : in std_logic;
        P5V0_PGOOD           : in std_logic;
        P1V0_PGOOD           : in std_logic;
        P2V0_PGOOD           : in std_logic;
        P1V8_PGOOD           : in std_logic;
        P1V5_PGOOD           : in std_logic;
        P1V2_PGOOD           : in std_logic;
        P1V8_MGT_PGOOD       : in std_logic;
        DDR3_TERM_PGOOD     : in std_logic;
        QDR_TERM_PGOOD      : in std_logic;
        P1V0_MGT_PGOOD       : in std_logic; -- 1v8
        DONE                : IN std_logic;
            spi_0_io0_io : inout STD_LOGIC;
            spi_0_io1_io : inout STD_LOGIC;
            spi_0_io2_io : inout STD_LOGIC;
            spi_0_io3_io : inout STD_LOGIC;
            spi_0_sck_io : inout STD_LOGIC;
            spi_0_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 )               
                                
        -------------------------------------------------------------------------------------------
        --ZYNC_SD_CLK         : in std_logic;
        --ZYNC_SD_CMD         : in std_logic;        
        --ZYNC_SD_DAT0         : in std_logic;
        --ZYNC_SD_DAT1         : in std_logic;
        --ZYNC_SD_DAT2         : in std_logic;
        --ZYNC_SD_DAT3         : in std_logic                
		
		
	);
end system_top;

architecture structure of system_top is

	component MarsZX3 is
		port (
			DDR_cas_n			: inout std_logic;
			DDR_cke				: inout std_logic;
			DDR_ck_n			: inout std_logic;
			DDR_ck_p			: inout std_logic;
			DDR_cs_n			: inout std_logic;
			DDR_reset_n			: inout std_logic;
			DDR_odt				: inout std_logic;
			DDR_ras_n			: inout std_logic;
			DDR_we_n			: inout std_logic;
			DDR_ba				: inout std_logic_vector ( 2 downto 0 );
			DDR_addr			: inout std_logic_vector ( 14 downto 0 );
			DDR_dm				: inout std_logic_vector ( 3 downto 0 );
			DDR_dq				: inout std_logic_vector ( 31 downto 0 );
			DDR_dqs_n			: inout std_logic_vector ( 3 downto 0 );
			DDR_dqs_p			: inout std_logic_vector ( 3 downto 0 );
			FIXED_IO_mio		: inout std_logic_vector ( 53 downto 0 );
			FIXED_IO_ddr_vrn	: inout std_logic;
			FIXED_IO_ddr_vrp	: inout std_logic;
			FIXED_IO_ps_srstb	: inout std_logic;
			FIXED_IO_ps_clk		: inout std_logic;
			FIXED_IO_ps_porb	: inout std_logic;
			gpio_tri_o			: out std_logic_vector ( 7 downto 0 );
			UART_0_txd			: out std_logic;
			UART_0_rxd			: in std_logic;
			SDIO0_CDN           : in  STD_LOGIC;
            SDIO0_WP            : in  STD_LOGIC;
			IIC_0_sda_i			: in std_logic;
			IIC_0_sda_o			: out std_logic;
			IIC_0_sda_t			: out std_logic;
			IIC_0_scl_i			: in std_logic;
			IIC_0_scl_o			: out std_logic;
			IIC_0_scl_t			: out std_logic;
			IIC_1_sda_i			: in std_logic;
            IIC_1_sda_o         : out std_logic;
            IIC_1_sda_t         : out std_logic;
            IIC_1_scl_i         : in std_logic;
            IIC_1_scl_o         : out std_logic;
            IIC_1_scl_t         : out std_logic;
			RESET_N				: out std_logic;
			status_i            : in std_logic_vector(11 downto 0);
			control_o           : out std_logic_vector(8 downto 0);
			c2c_data_in         : in std_logic_vector(8 downto 0);
			c2c_data_out        : out std_logic_vector(8 downto 0);
			c2c_clk_in          : in std_logic;
			c2c_clk_out         : out std_logic;
			FCLK_CLK1			: out std_logic;
			gpio_reset_resetn : in STD_LOGIC;
            reset_gpio_wo : out STD_LOGIC_VECTOR ( 5 downto 0 );
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
            SPI_0_ss_t : out STD_LOGIC
		);
	end component MarsZX3;

  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
    
	signal IIC_0_sda_i 		: std_logic;
	signal IIC_0_sda_o 		: std_logic;
	signal IIC_0_sda_t 		: std_logic;
	signal IIC_0_scl_i 		: std_logic;
	signal IIC_0_scl_o 		: std_logic;
	signal IIC_0_scl_t 		: std_logic;
	
	signal IIC_1_sda_i 		: std_logic;
    signal IIC_1_sda_o      : std_logic;
    signal IIC_1_sda_t      : std_logic;
    signal IIC_1_scl_i      : std_logic;
    signal IIC_1_scl_o      : std_logic;
    signal IIC_1_scl_t      : std_logic;
	
	signal I2C0_INT_N		: std_logic;

	signal Clk				: std_logic;
	signal Rst				: std_logic := '0';
	signal Rst_N 			: std_logic := '1';
	signal ETH_RST			: std_logic := '0';
	
	signal RstCnt			: unsigned (15 downto 0) := (others => '0'); -- 1ms reset for Ethernet PHY
	
	signal LedCount			: unsigned (23 downto 0);
	signal GPIO				: std_logic_vector (7 downto 0);
	
	signal SDIO0_CDN_s      : std_logic := '0';
    signal SDIO0_WP_s       : std_logic := '0';
    signal control_reg      : std_logic_vector (8 downto 0);

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
    signal reset_gpio_out : std_logic_vector(5 downto 0);
    signal reset_gpio_wo : std_logic_vector(5 downto 0);
    signal reset_reg_resetn_int : std_logic;
	signal ResetCounter : unsigned (23 downto 0) := (others => '0');
begin


	------------------------------------------------------------------------------------------------
	--	Processing System
	------------------------------------------------------------------------------------------------

	i_system : MarsZX3
		port map (
			DDR_addr			=> DDR_addr,
			DDR_ba				=> DDR_ba,
			DDR_cas_n			=> DDR_cas_n,
			DDR_ck_n			=> DDR_ck_n,
			DDR_ck_p			=> DDR_ck_p,
			DDR_cke				=> DDR_cke,
			DDR_cs_n			=> DDR_cs_n,
			DDR_dm				=> DDR_dm,
			DDR_dq				=> DDR_dq,
			DDR_dqs_n			=> DDR_dqs_n,
			DDR_dqs_p			=> DDR_dqs_p,
			DDR_odt				=> DDR_odt,
			DDR_ras_n			=> DDR_ras_n,
			DDR_reset_n			=> DDR_reset_n,
			DDR_we_n			=> DDR_we_n,
			FCLK_CLK1			=> Clk,
			FIXED_IO_ddr_vrn	=> FIXED_IO_ddr_vrn,
			FIXED_IO_ddr_vrp	=> FIXED_IO_ddr_vrp,
			FIXED_IO_mio		=> FIXED_IO_mio,
			FIXED_IO_ps_clk		=> FIXED_IO_ps_clk,
			FIXED_IO_ps_porb	=> FIXED_IO_ps_porb,
			FIXED_IO_ps_srstb	=> FIXED_IO_ps_srstb,
			RESET_N				=> Rst_N,
			UART_0_rxd			=> UART0_RX,
			UART_0_txd			=> UART0_TX,
			SDIO0_CDN           => SDIO0_CDN_s,
            SDIO0_WP            => SDIO0_WP_s,
			gpio_tri_o			=> GPIO,
			IIC_0_sda_i 		=> IIC_0_sda_i,
			IIC_0_sda_o  		=> IIC_0_sda_o,
			IIC_0_sda_t  		=> IIC_0_sda_t,
			IIC_0_scl_i  		=> IIC_0_scl_i,
			IIC_0_scl_o  		=> IIC_0_scl_o,
			IIC_0_scl_t  		=> IIC_0_scl_t,
			IIC_1_sda_i 		 => IIC_1_sda_i,
            IIC_1_sda_o          => IIC_1_sda_o,
            IIC_1_sda_t          => IIC_1_sda_t,
            IIC_1_scl_i          => IIC_1_scl_i,
            IIC_1_scl_o          => IIC_1_scl_o,
            control_o            => control_reg,
            c2c_data_out         => ZY_2_V7_D,
            c2c_clk_out          => ZY_2_V7_CK,
            c2c_data_in          => V7_2_ZY_D,
            c2c_clk_in           => V7_2_ZY_CK,
            status_i            => DONE&P1V0_MGT_PGOOD&QDR_TERM_PGOOD&DDR3_TERM_PGOOD&P1V8_MGT_PGOOD&P1V2_PGOOD&P1V5_PGOOD&P1V8_PGOOD&P2V0_PGOOD&P1V0_PGOOD&P5V0_PGOOD&P3V3_PGOOD,
            IIC_1_scl_t          => IIC_1_scl_t,
            gpio_reset_resetn => NOT reset_reg_resetn_int, -- this is the NOT of this signal as active low
            reset_gpio_wo => reset_gpio_wo,  
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
          SPI_0_ss_t => spi_0_ss_t
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
        
	-- supply voltage for thh DDR3 memory
    DDR3_VSEL       <= '0'; -- 1.35V
--  DDR3_VSEL       <= 'Z'; -- 1.5V

	-- tristate buffer 0
	I2C0_SDA	<= IIC_0_sda_o when IIC_0_sda_t = '0' else 'Z';
	IIC_0_sda_i <= I2C0_SDA;
	I2C0_SCL	<= IIC_0_scl_o when IIC_0_scl_t = '0' else 'Z';
	IIC_0_scl_i <= I2C0_SCL;

	-- tristate buffer 1
	I2C1_SDA	<= IIC_1_sda_o when IIC_1_sda_t = '0' else 'Z';
	IIC_1_sda_i <= I2C1_SDA;
	I2C1_SCL	<= IIC_1_scl_o when IIC_1_scl_t = '0' else 'Z';
	IIC_1_scl_i <= I2C1_SCL;
	------------------------------------------------------------------------------------------------
	-- I2C INT inversion
	------------------------------------------------------------------------------------------------
	I2C0_INT_N <= I2C0_INT_N_pin when Rev5 = '0' else not(I2C0_INT_N_pin);

	------------------------------------------------------------------------------------------------
	--	Clock and Reset
	------------------------------------------------------------------------------------------------ 
	   
	--  reset 1ms reset for Ethernet PHY
   	process (Clk)
   	begin
		if rising_edge (Clk) then
   			if (not RstCnt) = 0 then
   				Rst			<= '0';
   			else
   				Rst			<= '1';
   				RstCnt		<= RstCnt + 1;
	   		end if;
   		end if;
   	end process;

    ETH_RST_N <= '0' when Rst = '1' else 'Z';
    USB_RST_N <= '0' when Rst = '1' else 'Z';
    
	------------------------------------------------------------------------------------------------
	-- Blinking LED counter
	------------------------------------------------------------------------------------------------
   
    process (Clk)
    begin
    	if rising_edge (Clk) then
    		if Rst = '1' then
    			LedCount	<= (others => '0');
    		else
    			LedCount <= LedCount + 1;
    		end if;
    	end if;
    end process;
    

    Led_N(3) <= not LedCount(23);
    Led_N(2) <= not GPIO(2);
    Led_N(1) <= not GPIO(1);
    Led_N(0) <= not GPIO(0);


-- ***** FEM-II ******
    
    ZY_A_LED <= LedCount(23);
    ZY_B_LED <= not LedCount(23);


--add the regsister assignments lfter basic system set up

 -- *** Control Register bis assignments for register control ***
    FSEL_1_DE <= control_reg(0);
    FSEL_0_DE <= control_reg(1);  
    F_CLK_SEL <= control_reg(2);
    QSFP_I2C_SEL0 <= control_reg(3);
    LPMODE0 <= control_reg(4);
    MODPRSL0 <= control_reg(5);
    LPMODE1 <= control_reg(6);
    MODPRSL1 <= control_reg(7);
    P1V0_EN_ZYNC <= control_reg(8); 
 --   P1V0_EN_ZYNC <= 'Z' when GPIO(0) = '0' else '0';
  


---- *** Reset Register bit assignments ***
          ZYNC_F_RST           <= reset_gpio_wo(0);
          ZYNC_FW_RST_N        <= reset_gpio_wo(1); -- active HIGH!!! signal
          RESETL0              <= NOT reset_gpio_wo(2); -- active low signal
          RESETL1              <= NOT reset_gpio_wo(3); -- active low signal
          V7_INIT_B            <= NOT reset_gpio_wo(4); -- active low signal
          V7_PRG_ZY            <= reset_gpio_wo(5);   
           
     
    
-- updated 07/09/2018 and tested on the FEM-II module.  The V7_PRG_ZY signal has been probed
-- and this is operating as expected giving ~400ms pulse
process (Clk)
        begin
            if rising_edge (Clk) then
                if reset_gpio_wo(5 downto 0) = "000000" then
                    ResetCounter <= (others => '0');
                    reset_reg_resetn_int <= '0';
                else
                    ResetCounter <= ResetCounter + 1;
                  
                    if ResetCounter(23 downto 4) = "11111111111111111111" then
                         reset_reg_resetn_int <= '1';                               
                    else
                         reset_reg_resetn_int <= '0';
                    end if;                        
                end if;                 
            end if;
    end process;   
	------------------------------------------------------------------------------------------------
	-- Unused pins are set to high impedance in the constraints
	------------------------------------------------------------------------------------------------
end architecture structure;


