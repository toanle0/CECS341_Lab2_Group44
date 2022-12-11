library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity tb is

end tb;

architecture Behavioral of tb is
-- Component Declaration
COMPONENT ALU is
           port ( A : in std_logic_vector(31 downto 0);
                   B : in std_logic_vector(31 downto 0);
                   Carryin : in std_logic;
                   ALUCntl : in std_logic_vector(3 downto 0);
                   ALUout : out std_logic_vector(31 downto 0);
                   Zero : out std_logic;
                   Overflow: out std_logic;
                   Cout: out std_logic
           );
           END COMPONENT;

SIGNAL A_tb,B_tb,ALUout_tb : std_logic_vector(31 downto 0);
SIGNAL Carryin_tb, Zero_tb,Overflow_tb,Cout_tb : std_logic;
           SIGNAL ALUCntl_tb : std_logic_vector(3 downto 0);
 

Begin  

u: ALU

port map(
        A => A_tb,
        B => B_tb,
        Carryin => Carryin_tb,
        ALUCntl => ALUCntl_tb,
        ALUout => ALUout_tb,
        Zero => Zero_tb,
        Overflow => Overflow_tb,
        Cout => Cout_tb
        );      


       
tb: process
Begin
wait for 70 ns;
       ALUCntl_tb <= "0000"; --test case 1 - AND
       A_tb <= x"FFFFFFFF";
       B_tb <= x"00000000";
       
       Carryin_tb <= '0';
          

       wait for 70 ns;
       ALUCntl_tb <= "0001"; --test case 2 - OR
       A_tb <= x"98989898";
       B_tb <= x"89898989";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "0011"; --test case 3 - XOR
       A_tb <= x"01010101";
       B_tb <= x"10101010";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "0010"; --test case 4 - ADDING
       A_tb <= x"00000001";
       B_tb <= x"FFFFFFFF";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "0010"; --test case 5 - ADDING
       A_tb <= x"6389754F";
       B_tb <= x"AD5624E6";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "0010"; --test case 6 - ADDING
       A_tb <= x"00000001";
       B_tb <= x"FFFFFFFF";
       
       Carryin_tb <= '1';
          
       wait for 70 ns;
       ALUCntl_tb <= "0010"; --test case 7 - ADD
       A_tb <= x"6389754F";
       B_tb <= x"AD5624E6";
       
       Carryin_tb <= '1';
          
       wait for 70 ns;
       ALUCntl_tb <= "0010"; --test case 8 - ADDING
       A_tb <= x"FFFFFFFF";
       B_tb <= x"FFFFFFFF";
       
       Carryin_tb <= '1';
          
       wait for 70 ns;
       ALUCntl_tb <= "0110"; --test case 9 - SUBTRACT
       A_tb <= x"00000000";
       B_tb <= x"00000001";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "0110"; --test case 10 - SUBTRACT
       A_tb <= x"F9684783";
       B_tb <= x"F998D562";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "1100"; --test case 11 - NOR
       A_tb <= x"9ABCDEDF";
       B_tb <= x"9ABCDEFD";
       
       Carryin_tb <= '0';
          
       wait for 70 ns;
       ALUCntl_tb <= "0010"; --test case 12 - ADDING
       A_tb <= x"89BCDE34";
       B_tb <= x"C53BD687";
       
       Carryin_tb <= '1';
       

    wait;

    END process tb;
End Behavioral;

