`define N_div_clk_DAC      40   //the count width of DAC (number of bits)
`define N_div_clk_ADC_R    21   //the count width of ADC read (number of bits)
`define N_div_clk_ADC_W    40   //the count width of ADC write (number of bits)
//--------------- For DAC -----------------// 
`define ND_DAC1          14     // Data Width of DAC1 (number of bits)
`define NA_DAC1          15     // Address Width of DAC1 (number of bits)
`define N_Freq			 12     // width of frequence input
`define MAXD_DAC1        16383  // The max Addr value of DAC1  2^(ND_DAC1) - 1
`define Half_MAXD_DAC1   8191   // half of MAXD_DAC1
//--------------- For ADC -----------------//
`define ND_ADC          14     // Data Width of ADC (number of bits)
`define NA_ADC          8     //原程序 Address Width of DAC1 (number of bits)
`define N_Depth_ADC     256   //原程序  The depth of ADC_RAM = 0.375k
//`define NA_ADC          11     //2^11=2048
//`define N_Depth_ADC     256  //修改后程序
//--------------- For FFT -----------------//
`define ND_FFT          23     // Data Width of ADC (number of bits)
`define NA_FFT          8      // Address Width of DAC1 (number of bits)
`define N_Depth_FFT    256     // The depth of ADC_RAM = 7 
// `define debug           1