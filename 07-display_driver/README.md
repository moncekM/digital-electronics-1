# Lab 7: Martin Monček

### Display driver

1. Listing of VHDL code of the completed process `p_mux`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point,
    -- and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process (clk) is
    begin
            if (rising_edge(clk)) then
      if (rst = '1') then
        sig_hex <= data0;
        dp      <= dp_vect(0);
        dig     <= "1110";
      else

        case sig_cnt_2bit is

          when "11" =>
            sig_hex <= data3;
            dp      <= dp_vect(3);
            dig     <= "0111";

          when "10" =>
             sig_hex <= data2;
            dp      <= dp_vect(2);
            dig     <= "1011";


          when "01" =>
             sig_hex <= data1;
            dp      <= dp_vect(1);
            dig     <= "1101";


          when others =>
             sig_hex <= data0;
            dp      <= dp_vect(0);
            dig     <= "1110";

                end case;
            end if;
        end if;
    end process p_mux;
```

### Eight-digit driver

1. Image of the 8-digit driver's block schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components, and internal signals!

![schematic_8display_top_overal](https://user-images.githubusercontent.com/94976093/228317860-01335f60-c09e-4676-895c-add0f5d2f0a6.png)

Also adding a detailed schematic of top-level entity to see insides a multiplexer:

![schematic_8display_top_detail1](https://user-images.githubusercontent.com/94976093/228318596-ef5317fe-f991-4dd1-9c0a-301eb678fbdb.png)

adding a detailed schematic of 8display_7seg entity to see insides and original source signal of entity:

![schematic_8display_8disp_7seg](https://user-images.githubusercontent.com/94976093/228318884-b1031e89-ffd7-45f0-9dd2-c78d441915c8.png)

