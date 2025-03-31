	component system is
		port (
			clk_clk                     : in  std_logic                     := 'X';             -- clk
			hex_0_conduit_end_hex       : out std_logic_vector(6 downto 0);                     -- hex
			reset_reset_n               : in  std_logic                     := 'X';             -- reset_n
			switch_0_conduit_end_export : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                     => CONNECTED_TO_clk_clk,                     --                  clk.clk
			hex_0_conduit_end_hex       => CONNECTED_TO_hex_0_conduit_end_hex,       --    hex_0_conduit_end.hex
			reset_reset_n               => CONNECTED_TO_reset_reset_n,               --                reset.reset_n
			switch_0_conduit_end_export => CONNECTED_TO_switch_0_conduit_end_export  -- switch_0_conduit_end.export
		);

