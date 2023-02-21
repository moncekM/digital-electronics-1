# Lab 2: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![greather_then_Kmap](https://user-images.githubusercontent.com/94976093/220185290-32f77ac7-2e58-4a8f-ace3-084664caecdc.jpg)

   Less than:

   ![less_then_Kmap](https://user-images.githubusercontent.com/94976093/220185329-db2eda8d-182e-4767-aa57-20a6cc0ccdea.jpeg)


2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.
![Greather_then_function](https://user-images.githubusercontent.com/94976093/220188931-15f55306-7e60-48da-8b1b-fdf701e914a9.jpg)

![Less_then_function](https://user-images.githubusercontent.com/94976093/220188950-9ea6781a-ecc7-4c28-a5e3-00cb4a26ec8b.jpg)

   

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
     p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";

        -- First test case
        s_b <= "0101"; -- Such as "0101" if ID = xxxx54
        s_a <= "0100"; -- Such as "0011" if ID = xxxx54
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1' ) and
                (s_B_equals_A  = '0' ) and
                (s_B_less_A    = '0' ))
        -- If false, then report an error
        report "Input combination you entered FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait;
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
