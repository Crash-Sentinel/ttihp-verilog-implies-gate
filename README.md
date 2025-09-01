## NOTE:

This is a forked repository, for more information with TinyTapeout (the main people I'm using from)
Please take a look at the link:
https://tinytapeout.com

## Project Synopsis

Firstly, if you are unaware of who TinyTapeout are, I personally recommend taking them a look.
They allow ordinary people to design and create their own personal ASIC chips at an affordable price.
If you're even remotely fascinated with what any of this means, I cannot recommend them enough.

Anyways, here's what my project does.

My chip design takes all the 8 bits of the strictly input pins, and makes 2-4 bit values to then do
an "implies" operation on. For the sake of convenience, we'll call the first 4 bits "A" and the 
second half of the bits "B".

The implies gate, no different than something like XOR or NAND, takes in two values and returns
a binary value. The implies gate always return True, except for when "A" is True and "B" is False.

After "A" and "B" are found:
- Each bit of "A" is implied with each bit of "B", and the result is returned in the corresponding index.

EX:

A = 1010, B = 1101

This gets turned into,
∀i∈{0,1,2,3}, ui_out[i] := A[i] => B[i];; 

or in other words, each bit of A gets implies with B and their result is saved into the 
strictly output stream.

This does mean that the last 4 bits of the output stream are unused and will always be 0!
Be sure that this is considered when using this chip.

For more details, look into the info.md in the docs directory of this template.

I hope I inspired you! Good luck out there!

Bennett Miller (c) 2025
