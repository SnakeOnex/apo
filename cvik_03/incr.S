// .globl    pole        // nazev "pole" bude viditelny pro linker
.data                 // direktiva oznacujici zacatek datove casti
.align    2           // zarovnani dat po slovech (4 Bytech)

pole:                 // pojmenovani mista v pameti
.word    7, 2, 3, 5, 2   // inicializace pole...

.text                 // zacatek textove casti / programu
.globl _start	      // opet symbol viditelný pro linker	  
.ent _start	      // vstupní bod		  

#define pole_adr $16
#define i $17
#define tmp $18

_start:               // la je pseudoinstrukce
// la   $s0, pole         // ulozi do registru s0 adresu pocatku pole
  la   pole_adr, pole         // ulozi do registru s0 adresu pocatku pole
//  addi $s1, $0, 0        // inicializacni prikaz cyklu for: i=0, kde i=s1
  addi i, $0, 0        // inicializacni prikaz cyklu for: i=0, kde i=s1
  // addi $s2, $0, 4        // nastaveni horni meze cyklu
  j cond_1

for_1:                  // mame konst. meze, lze prelozit jako do-while 
  lw   tmp, (pole_adr)    // nacteni polozky pole do registru s3
  addi tmp, tmp, 0x1    // inkrementace registru s3
  sw   tmp, (pole_adr)    // prepsani (ulozeni) hodnoty registru s3 do pole
  addi pole_adr, pole_adr, 0x4    // posun na dasli polozku pole
  addi i, i, 0x1    // +1 k pocitadlu poctu pruchodu cyklem (i++)


cond_1:
  slti tmp, i, 5 // comparing, ulozi se vysledek do tmp
  bne tmp, $0, for_1 // kdyz s1!=s2 opakuj cyklus skokem na navesti for
  // kdyz se tmp rona nule tak for_1 jinak nic


konec:
  nop
.end _start
