1 wconstant build_bmp085alt

lockdict variable _bmp085_pd

50 l, 200 l, 450 l, 800 l, 1300 l, 1900 l, 2600 l,
3450 l, 4400 l, 5450 l, 6600 l, 7850 l, 9200 l, 10650 l, 12200 l,
13800 l, 15500 l, 17250 l, 19100 l, 21000 l, 22950 l, 24950 l, 27000 l,
29100 l, 31200 l, 33350 l, 35500 l, 37700 l, 39900 l, 42100 l, 44300 l,
46500 l, 48650 l, 50800 l, 52950 l, 55050 l, 57100 l, 59150 l, 61150 l,
63100 l, 65000 l, 66850 l, 68650 l, 70400 l, 72100 l, 73750 l, 75350 l,
76900 l, 78400 l, 79850 l, 81250 l, 82550 l, 83800 l, 84950 l, 86100 l,
87200 l, 88250 l, 89200 l, 90100 l, 90950 l, 91750 l, 92500 l, 93200 l, 
0 _bmp085_pd L!
freedict

lockdict variable _bmp085_ba
4163 l, 16664 l, 37532 l, 66817 l, 108797 l, 159398 l, 218746 l,
291271 l, 372934 l, 463951 l, 564567 l, 675061 l, 795745 l, 926976 l, 1069149 l,
1218024 l, 1378638 l, 1546690 l, 1727453 l, 1916563 l, 2114453 l, 2321604 l, 2538542 l,
2765855 l, 2998584 l, 3242776 l, 3493304 l, 3756614 l, 4027402 l, 4306160 l, 4593432 l,
4889824 l, 5188935 l, 5498100 l, 5818108 l, 6141992 l, 6469855 l, 6810264 l, 7155538 l,
7505850 l, 7861387 l, 8222344 l, 8588928 l, 8961357 l, 9339860 l, 9724684 l, 10116085 l,
10514337 l, 10919730 l, 11332568 l, 11753174 l, 12165573 l, 12584525 l, 12991907 l, 13423155 l,
13861085 l, 14305678 l, 14733582 l, 15164787 l, 15598560 l, 16033955 l, 16469768 l, 16904486 l,
0 _bmp085_ba L!
freedict

lockdict variable _bmp085_a
83271 l, 83337 l, 83471 l, 83672 l, 83959 l, 84334 l, 84782 l,
85323 l, 85961 l, 86682 l, 87492 l, 88394 l, 89396 l, 90503 l, 91724 l,
93046 l, 94478 l, 96029 l, 97709 l, 99531 l, 101482 l, 103575 l, 105823 l,
108244 l, 110823 l, 113577 l, 116524 l, 119686 l, 123085 l, 126708 l, 130578 l,
134723 l, 139121 l, 143797 l, 148840 l, 154230 l, 159933 l, 166053 l, 172636 l,
179647 l, 187124 l, 195111 l, 203657 l, 212816 l, 222649 l, 233226 l, 244625 l,
256936 l, 270261 l, 284715 l, 300433 l, 317229 l, 335161 l, 354245 l, 374998 l,
398118 l, 423421 l, 450425 l, 479117 l, 510320 l, 544243 l, 581085 l, 621024 l, 
0 _bmp085_a L!
freedict

\ bmpAlt ( base press -- alt)
: bmpAlt
	- dup
	_bmp085_pd  d_252 + L@ -
	_bmp085_a d_252 + L@ d_1000 */
	_bmp085_ba d_252 + L@ +
	swap
\ alt diff
	d_63 0
	do
		dup
		_bmp085_pd i 4* + dup L@ swap 4+ L@
		between
		if
			nip
\ diff
			_bmp085_pd i 4* + L@ -
			_bmp085_a i 1+ 4* + L@ d_1000 u*/ 
			_bmp085_ba i 4* + L@ +
			0 leave
		then
	loop
	drop
;


[ifdef bmpAlt_test
: bmpAlt_test
	101325 0
	do
		dup dup i - dup . bmpAlt . cr
	20 +loop
;   
]

\ hg>hpa ( n1 -- n2)
: hg>hpa
	d_3_386_388_16 d_10_000_000 u*/
;

\ hpa>hg ( n1 -- n2)
: hpa>hg
	d_2_952_998_751 d_1_000_000_000 u*/
	d_100 u/mod swap d_49 > if 1+ then
;


