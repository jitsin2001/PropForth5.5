fl

fsclear

fswrite boot.f
hA state orC!  c" ~h1B[1A~h1B[20D~h1B[K~h0D~h0D" .cstr

\ findEETOP ( -- n1 ) the top of the eeprom + 1
: findEETOP
\
\ search 32k block increments until we get a fail
\
	0
	h100000 h8000
	do
		i t0 2 eereadpage
		if
			leave
		else
			i h7FFE + t0 3 eereadpage
			if
				leave
			else
				drop i h8000 +
			then
		then
	h8000 +loop
;

c" boot.f - Finding top of eeprom, " .cstr

findEETOP ' fstop 2+ alignl L! forget findEETOP

c" Top of eeprom at: " .cstr fstop . cr cr

c" boot.f - DONE PropForth Loaded~h0D~h0D" .cstr
hA state andnC!
...
