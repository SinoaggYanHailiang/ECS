clc;
clear all;

DAC_bits = 14;
max_value = 2^DAC_bits;

fid = fopen('sin.coe','a' );

str1 = 'memory_initialization_radix=10;';

str2 = 'memory_initialization_vector=';

fprintf(fid,'%s\n%s\n', str1,str2);

for k=1:max_value*2                           %2^14*2=2^15

    y(k) =sin(pi*(k-1)/(max_value-1) - 0.5*pi) + 1;

     y(k) = int16(y(k)*(max_value-1)/2);   % 这一步主要是考虑是表中数据的格式Q(s,16,15).
   fprintf(fid,'%d,\n',y(k));

end
plot(y);
fclose(fid);
