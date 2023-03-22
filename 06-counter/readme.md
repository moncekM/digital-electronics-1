# Lab 6: Martin Monček

### Bidirectional counter

1. Listing of VHDL code of the completed process `p_cnt_up_down`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_cnt_up_down:
    -- Clocked process with synchronous reset which implements
    -- n-bit up/down counter.
    --------------------------------------------------------
    p_cnt_up_down : process (clk) is
    begin
  if rising_edge(clk) then
      if (rst = '1') then           -- Synchronous reset
        sig_cnt <= (others => '0'); -- Clear all bits, pretoze nevieme kolko ma signal count bitov a toto vyplna others
      elsif (en = '1') then         -- Test if counter is enabled
      if(cnt_up ='1') then
        sig_cnt <= sig_cnt + 1;
      else
        sig_cnt <= sig_cnt - 1;
      end if; 
      end if;
    end if;
    end process p_cnt_up_down;
```

2. Screenshot with simulated time waveforms. Test: (a) reset, (b) counter direction, (c) enable. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

 
 ![cnt_up_down_waweforms](https://user-images.githubusercontent.com/94976093/225453380-8a1ff7b8-3353-4d26-bb0a-d2ac86a61208.png)

### Two counters

1. Image of the top layer structure including both counters, ie a 4-bit bidirectional counter from *Part 4* and a 12-bit counter with a 10 ms time base from *Experiments on your own*. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

 ![Schematic_of_top_counters_alloutputs](https://user-images.githubusercontent.com/94976093/226716631-404f031f-8884-40a6-bb14-fbcda47d14c4.png)

Also adding a detail view of implementation with a limited amount of outputs to detail view a wire structure of counters

![Schematic_of_top_counters](https://user-images.githubusercontent.com/94976093/226717332-03309bd6-244f-4ec9-8c96-248ae8c1a5c0.png)

