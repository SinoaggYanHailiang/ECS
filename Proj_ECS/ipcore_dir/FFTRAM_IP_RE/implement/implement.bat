
 
 
 




rem Clean up the results directory
rmdir /S /Q results
mkdir results

rem Synthesize the VHDL Wrapper Files


echo 'Synthesizing example design with XST';
xst -ifn xst.scr
copy FFTRAM_IP_RE_exdes.ngc .\results\


rem Copy the netlist generated by Coregen
echo 'Copying files from the netlist directory to the results directory'
copy ..\..\FFTRAM_IP_RE.ngc results\


rem  Copy the constraints files generated by Coregen
echo 'Copying files from constraints directory to results directory'
copy ..\example_design\FFTRAM_IP_RE_exdes.ucf results\

cd results

echo 'Running ngdbuild'
ngdbuild -p xc6slx9-tqg144-2 FFTRAM_IP_RE_exdes

echo 'Running map'
map FFTRAM_IP_RE_exdes -o mapped.ncd  -pr i

echo 'Running par'
par mapped.ncd routed.ncd

echo 'Running trce'
trce -e 10 routed.ncd mapped.pcf -o routed

echo 'Running design through bitgen'
bitgen -w routed

echo 'Running netgen to create gate level Verilog model'
netgen -ofmt verilog -sim -tm FFTRAM_IP_RE_exdes -pcf mapped.pcf -w -sdf_anno false routed.ncd routed.v
