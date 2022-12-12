library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
port (    A   : in std_logic_vector(31 downto 0);
       B   : in std_logic_vector(31 downto 0);
       Carryin   : in std_logic;
       ALUCntl   : in std_logic_vector(3 downto 0);
       ALUout   : out std_logic_vector(31 downto 0);
       Zero   : out std_logic;
       Overflow: out std_logic;
       Cout: out std_logic
   );
end ALU;

architecture arch of ALU is

signal result : std_logic_vector(32 downto 0);

signal a32, b32 : std_logic_vector(32 downto 0);

begin

   a32 <= '0' & A;
   b32 <= '0' & B;

   process (a32, b32, Carryin, ALUCntl)

   begin

   case (ALUCntl) is
      
       when "0000" => result <= a32 AND b32;
       when "0001" => result <= a32 OR b32;
       when "0011" => result <= a32 XOR b32;
       when "0010" => result <= a32 + b32 + Carryin;
       when "0110" => result <= a32 - b32 - Carryin;
       when "1100" => result <= a32 NOR b32;
       when others => null;

   end case;

   end process;

   ALUout <= result (31 downto 0);
   Zero <= '1' when (result = 0) else '0';
   Cout <= result(32);
   Overflow <= '1' when ((A(31) = '1' and B(31) = '1' and result(31) = '0') or (A(31) = '0' and B(31) = '0' and result(31) = '1')) else '0';


end arch;

