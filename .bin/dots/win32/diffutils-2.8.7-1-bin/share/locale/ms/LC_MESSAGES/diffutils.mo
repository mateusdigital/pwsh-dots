��       �     �   �  ,      �   ~  �  p  h   �  �   F  �   I  �        0  9     j     |     �   ,  �     �   %  �   ,  !   -  N      |   &  �     �     �   L     J  Q   -  �   5  �   (      L  )     v   D  �   ?  �   B     D  X     �   I  �   =     A  E   J  �   =  �   8     9  I   C  �   F  �   (     @  7   B  x   M  �   K  	   8  U   ,  �   J  �   9     /  @   0  p   K  �   $  �   G     )  Z  V  �   9  �        G  4   A  |   <  �   .  �   C  *   ,  n   ?  �   <  �   E      B   ^   %   �   5   �   F   �   .  !D   >  !s   >  !�   A  !�   8  "3   3  "l   #  "�   /  "�   D  "�   /  #9   4  #i   �  #�   !  $�     $�   !  $�     $�   I  %   &  %O     %v     %�   I  %�   1  %�   &  &)     &P     &g     &�     &�   $  &�     &�     &�     '
     '     '$     '>     ']   #  'm     '�   '  '�   �  '�   =  (�   '  (�     (�     (�   %  )     )-     )B     )T     )f     )x   "  )�   4  )�     )�   .  )�   "  *)   (  *L   *  *u     *�   )  *�   !  *�   '  *�   )  +'     +Q     +h      +x      +�     +�     +�   	  +�  A  +�     -<     -O     -T     -i   1  -{   2  -�   0  -�     .   #  .,     .P   )  .l   1  .�   -  .�     .�     /     /'     /:     /K     /Y   "  /t   %  /�     /�     /�     /�     /�   	  /�     0     0     0     0,     0<   !  0[     0}     0�   
  0�     0�  �  0�   y  2J  �  2�   �  4Z   R  5   R  5l   !  5�   6  5�     6     6)     6C   +  6`     6�   "  6�   +  6�   ,  6�   !  7'   #  7I   "  7m   "  7�   \  7�   U  8   /  8f   ;  8�   1  8�   R  9     9W   ?  9v   @  9�   O  9�   H  :G      :�   K  :�   9  :�   @  ;7   P  ;x   B  ;�   H  <   =  <U   O  <�   Y  <�   *  ==   M  =h   J  =�   O  >   P  >Q   >  >�   7  >�   M  ?   B  ?g   /  ?�   4  ?�   P  @   *  @`   C  @�   &  @�  e  @�   ?  B\     B�   Y  B�   =  C   <  CR   .  C�   K  C�   8  D
   >  DC   <  D�   B  D�   L  E   %  EO   4  Eu   K  E�   .  E�   L  F%   G  Fr   A  F�   9  F�   ;  G6   (  Gr   /  G�   M  G�   2  H   3  HL   �  H�     Is     I�   "  I�     I�   V  I�   -  JD     Jr     J�   @  J�   5  J�   *  K     KJ     Ke   !  K�     K�   #  K�     K�     K�     L     L$   %  L2   "  LX     L{   "  L�      L�   -  L�   �  M   K  M�   $  M�     N      N(   '  N9     Na     N~     N�     N�     N�   (  N�   @  O    !  OA   4  Oc   /  O�   3  O�   5  O�     P2   3  PA   .  Pu   4  P�   7  P�     Q     Q"      Q4      QU     Qv     Q�   	  Q�  _  Q�     S     S*     S/     SE   6  S[   =  S�   /  S�     T    %  T     TC   0  Tb   4  T�   4  T�     T�     U     U4     UI     UZ     Uh     U�   &  U�     U�     U�     U�   
  U�   	  V     V     V$     V*     V9     VI   &  Vg     V�   !  V�   
  V�     V�      P              �   Q   V   �       /          �   �          S   �   �   ;       o   "   @   �   F   r                      �   �   �   2      G   1           A       y   O   |   �   Y   f   )       k   4   �   �   g           H   L   0   :      \   `   X       �          8   %   Z   <       i   #              N   .   ~               �   ]   q   d          -       {   p       b      6       �   �       7   ,          a   B                 
   �               �   �   U       T       �   t      x   }              s   �               '   �   D              [   J       �   C   �   �   =   �   K   v       !   $   j      �         �      �   9           	   h       �       �         �   M          �   �          I   E   �   �   �   _   n          >       �   ^   &   (       �   +   W           *       �      e   R       �   w      �       �       3       c   �   �   u   5       z   �   m   �   l   ?   �      �      Either GFMT or LFMT may contain:
    %%  %
    %c'C'  the single character C
    %c'\OOO'  the character with octal code OOO   GFMT may contain:
    %<  lines from FILE1
    %>  lines from FILE2
    %=  lines common to FILE1 and FILE2
    %[-][WIDTH][.[PREC]]{doxX}LETTER  printf-style spec for LETTER
      LETTERs are as follows for new group, lower case for old group:
        F  first line number
        L  last line number
        N  number of lines = L-F+1
        E  F-1
        M  L+1   LFMT may contain:
    %L  contents of line
    %l  contents of line, excluding any trailing newline
    %[-][WIDTH][.[PREC]]{doxX}n  printf-style spec for input line number   LTYPE is `old', `new', or `unchanged'.  GTYPE is LTYPE or `changed'.   Skip the first SKIP1 bytes of FILE1 and the first SKIP2 bytes of FILE2. %s %s differ: byte %s, line %s
 %s %s differ: byte %s, line %s is %3o %s %3o %s
 %s: diff failed:  %s: illegal option -- %c
 %s: invalid option -- %c
 %s: option `%c%s' doesn't allow an argument
 %s: option `%s' is ambiguous
 %s: option `%s' requires an argument
 %s: option `--%s' doesn't allow an argument
 %s: option `-W %s' doesn't allow an argument
 %s: option `-W %s' is ambiguous
 %s: option requires an argument -- %c
 %s: unrecognized option `%c%s'
 %s: unrecognized option `--%s'
 --GTYPE-group-format=GFMT  Similar, but format GTYPE input groups with GFMT. --LTYPE-line-format=LFMT  Similar, but format LTYPE input lines with LFMT. --binary  Read and write data in binary mode. --diff-program=PROGRAM  Use PROGRAM to compare files. --from-file and --to-file both specified --from-file=FILE1  Compare FILE1 to all operands.  FILE1 can be a directory. --help  Output this help. --horizon-lines=NUM  Keep NUM lines of the common prefix and suffix. --ignore-file-name-case  Ignore case when comparing file names. --line-format=LFMT  Similar, but format all input lines with LFMT. --no-ignore-file-name-case  Consider case when comparing file names. --normal  Output a normal diff. --speed-large-files  Assume large files and many scattered small changes. --strip-trailing-cr  Strip trailing carriage return on input. --tabsize=NUM  Tab stops are every NUM (default 8) print columns. --to-file=FILE2  Compare all operands to FILE2.  FILE2 can be a directory. --unidirectional-new-file  Treat absent first files as empty. -3  --easy-only  Output unmerged nonoverlapping changes. -A  --show-all  Output all changes, bracketing conflicts. -B  --ignore-blank-lines  Ignore changes whose lines are all blank. -D NAME  --ifdef=NAME  Output merged file to show `#ifdef NAME' diffs. -D option not supported with directories -E  --ignore-tab-expansion  Ignore changes due to tab expansion. -E  --show-overlap  Output unmerged changes, bracketing conflicts. -H  --speed-large-files  Assume large files and many scattered small changes. -I RE  --ignore-matching-lines=RE  Ignore changes whose lines all match RE. -L LABEL  --label=LABEL  Use LABEL instead of file name. -N  --new-file  Treat absent files as empty. -S FILE  --starting-file=FILE  Start with FILE when comparing directories. -T  --initial-tab  Make tabs line up by prepending a tab. -W  --ignore-all-space  Ignore all white space. -X  Output overlapping changes, bracketing them. -X FILE  --exclude-from=FILE  Exclude files that match any pattern in FILE. -a  --text  Treat all files as text. -b  --ignore-space-change  Ignore changes in the amount of white space. -b  --print-bytes  Print differing bytes. -c  -C NUM  --context[=NUM]  Output NUM (default 3) lines of copied context.
-u  -U NUM  --unified[=NUM]  Output NUM (default 3) lines of unified context.
  --label LABEL  Use LABEL instead of file name.
  -p  --show-c-function  Show which C function each change is in.
  -F RE  --show-function-line=RE  Show the most recent line matching RE. -d  --minimal  Try hard to find a smaller set of changes. -e  --ed  Output an ed script. -e  --ed  Output unmerged changes from OLDFILE to YOURFILE into MYFILE. -i  --ignore-case  Consider upper- and lower-case to be the same. -i  --ignore-case  Ignore case differences in file contents. -i  Append `w' and `q' commands to ed scripts. -i SKIP  --ignore-initial=SKIP  Skip the first SKIP bytes of input. -i SKIP1:SKIP2  --ignore-initial=SKIP1:SKIP2 -l  --left-column  Output only the left column of common lines. -l  --paginate  Pass the output through `pr' to paginate it. -l  --verbose  Output byte numbers and values of all differing bytes. -m  --merge  Output merged file instead of ed script (default -A). -n  --rcs  Output an RCS format diff. -n LIMIT  --bytes=LIMIT  Compare at most LIMIT bytes. -o FILE  --output=FILE  Operate interactively, sending output to FILE. -q  --brief  Output only whether files differ. -r  --recursive  Recursively compare any subdirectories found. -s  --quiet  --silent  Output nothing; yield exit status only. -s  --report-identical-files  Report when two files are the same. -s  --suppress-common-lines  Do not output common lines. -t  --expand-tabs  Expand tabs to spaces in output. -v  --version  Output version info. -w  --ignore-all-space  Ignore all white space. -w NUM  --width=NUM  Output at most NUM (default 130) print columns. -x  --overlap-only  Output overlapping changes. -x PAT  --exclude=PAT  Exclude files that match PAT. -y  --side-by-side  Output in two columns.
  -W NUM  --width=NUM  Output at most NUM (default 130) print columns.
  --left-column  Output only the left column of common lines.
  --suppress-common-lines  Do not output common lines. Common subdirectories: %s and %s
 Compare files line by line. Compare three files line by line. Compare two files byte by byte. FILES are `FILE1 FILE2' or `DIR1 DIR2' or `DIR FILE...' or `FILE... DIR'. File %s is a %s while file %s is a %s
 Files %s and %s are identical
 Files %s and %s differ
 If --from-file or --to-file is given, there are no restrictions on FILES. If a FILE is `-' or missing, read standard input. If a FILE is `-', read standard input. Invalid back reference Invalid character class name Invalid collation character Invalid content of \{\} Invalid preceding regular expression Invalid range end Invalid regular expression Memory exhausted No match No newline at end of file No previous regular expression Only in %s: %s
 Premature end of regular expression Regular expression too big Report bugs to <bug-gnu-utils@gnu.org>. SKIP values may be followed by the following multiplicative suffixes:
kB 1000, K 1024, MB 1,000,000, M 1,048,576,
GB 1,000,000,000, G 1,073,741,824, and so on for T, P, E, Z, Y. SKIP1 and SKIP2 are the number of bytes to skip in each file. Side-by-side merge of file differences. Success Trailing backslash Try `%s --help' for more information. Unknown system error Unmatched ( or \( Unmatched ) or \) Unmatched [ or [^ Unmatched \{ Usage: %s [OPTION]... FILE1 FILE2
 Usage: %s [OPTION]... FILE1 [FILE2 [SKIP1 [SKIP2]]]
 Usage: %s [OPTION]... FILES
 Usage: %s [OPTION]... MYFILE OLDFILE YOURFILE
 `-%ld' option is obsolete; omit it `-%ld' option is obsolete; use `-%c %ld' `-' specified for more than one input file block special file both files to be compared are directories cannot compare `-' to a directory cannot compare file names `%s' and `%s' cannot interactively merge standard input character special file cmp: EOF on %s
 conflicting %s option value `%s' conflicting output style options conflicting tabsize options conflicting width options directory ed:	Edit then use both versions, each decorated with a header.
eb:	Edit then use both versions.
el:	Edit then use the left version.
er:	Edit then use the right version.
e:	Edit a new version.
l:	Use the left version.
r:	Use the right version.
s:	Silently include common lines.
v:	Verbosely include common lines.
q:	Quit.
 extra operand `%s' fifo incompatible options input file shrank internal error: invalid diff type in process_diff internal error: invalid diff type passed to output internal error: screwup in format of diff blocks invalid --bytes value `%s' invalid --ignore-initial value `%s' invalid context length `%s' invalid diff format; incomplete last line invalid diff format; incorrect leading line chars invalid diff format; invalid change separator invalid horizon length `%s' invalid tabsize `%s' invalid width `%s' memory exhausted message queue missing operand after `%s' options -l and -s are incompatible pagination not supported on this host program error read failed regular empty file regular file semaphore shared memory object socket stack overflow standard output subsidiary program `%s' failed subsidiary program `%s' not found symbolic link too many file label options weird file write failed Project-Id-Version: diffutils 2.8.3
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-04-13 00:07-0700
PO-Revision-Date: 2003-03-30 13:22GMT+0800
Last-Translator: Sharuzzaman Ahmat Raslan <sharuzzaman@myrealbox.com>
Language-Team: Malay <translation-team-ms@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 0.9.5
   Sama ada GFMT atau LFMT boleh mengandungi:
    %%  %
    %c'C'  satu aksara C
    %c'\OOO'  aksara dengan kod oktal OOO   GFMT boleh mengandungi:
    %<  baris dari FAIL1
    %>  baris dari FAIL2
    %=  baris yang sama pada FAIL1 dan FAIL2
    %[-][WIDTH][.[PREC]]{doxX}LETTER  spec gaya-printf untuk LETTER
      LETTER adalah seperti berikut untuk kumpulan baru, huruf kecil untuk kumpulan lama:
        F  nombor baris pertama
        L  nombor baris terakhir
        N  jumlah baris = L-F+1
        E  F-1
        M  L+1   LFMT boleh mengandungi:
    %L  kandungan baris
    %l  kandungan baris, tidak termasuk baris baru dipenghujung
    %[-][WIDTH][.[PREC]]{doxX}n  spec gaya-printf untuk nombor baris masukan   LTYPE adalah `old', `new', atau `unchanged'.  GTYPE adalah LTYPE atau `changed'.   Langkau LANGKAU1 byte pertama untuk FAIL1 dan LANGKAU2 byte pertama untuk FAIL2. %s %s berbeza: byte %s, baris %s
 %s %s berbeza: byte %s, baris %s adalah %3o %s %3o %s
 %s: diff gagal:  %s: pilihan salah  -- %c
 %s: pilihan tidak sah -- %c
 %s: pilihan `%c%s' tidak mengizinkan hujah
 %s: pilihan `%s' adalah kabur
 %s: pilihan `%s' memerlukan hujah
 %s: pilihan `--%s' tidak mengizinkan hujah
 %s: pilihan `-W %s' tidak mengizinkan hujah
 %s: pilihan `-W %s' adalah kabur
 %s: pilihan memerlukan hujah -- %c
 %s: pilihan tidak dikenali `%c%s'
 %s: pilihan tidak dikenali `--%s'
 --GTYPE-group-format=GFMT  Hampir sama, tetapi format masukan GTYPE dikumpulkan dengan GFMT. --LTYPE-line-format=LFMT  Hampir sama, tetapi format baris masukan LTYPE dengan LFMT. --binary  Baca dan tulis data dalam mod binari. --diff-program=PROGRAM  Guna PROGRAM untuk membanding fail. --from-file dan --to-file kedua-duanya dinyatakan --from-file=FAIL1  Banding FAIL1 kepada semua operan.  FAIL1 boleh jadi direktori. --help  Keluarkan bantuan ini. --horizon-lines=NOM  Pastikan NOM baris prefix dan suffix sama. --ignore-file-name-case  Abai case apabila membanding nama fail. --line-format=LFMT  Hampir sama, tetapi format semua baris masukan dengan LFMT. --no-ignore-file-name-case  Ambil kira case ketika membanding nama fail. --normal  Keluarkan diff normal. --speed-large-files  Anggap fail besar dan banyak perubahan kecil tersebar. --strip-trailing-cr  Buang enter penghujung pada masukan. --tabsize=NOM  Hentian tab setial NOM (default 8) lajur cetakan. --to-file=FAIL2  Banding semua operan kepada FAIL2.  FAIL2 boleh jadi direktori. --unidirectional-new-file  Anggap fail tidak wujud sebagai kosong. -3  --easy-only  Keluarkan perubahan tidak digabung dan tidak bertindih. -A  --show-all  Keluarkan semua perubahan, kurungkan konflik. -B  --ignore-blank-lines  Abai perubahan dimana baris adalah kesemuanya kosong. -D NAMA  --ifdef=NAMA  Keluarkan fail tergabung untuk menunjukkan perbezaa `#ifdef NAMA'. pilihan -D tidak disokong dengan direktori -E  --ignore-tab-expansion  Abai perubahan diakibatkan oleh pengembangan tab. -E  --show-overlap  Keluarkan perubahan tidak digabung, kurungkan konflik. -H  --speed-large-files  Anggap fail besar dan banyak perubahan kecil tersebar. -I RE  --ignore-matching-lines=RE  Abai perubahan dimana baris semua sepadan RE. -L LABEL  --label=LABEL  Guna LABEL selain daripada nama fail. -N  --new-file  Anggap fail tidak wujud sebagai kosong. -S FAIL  --starting-file=FAIL  Mula dengan FAIL apabila membanding direktori. -T  --initial-tab  Jadikan tab sebaris dengan menambah awalan tab. -W  --ignore-all-space  Abai semua ruang putih. -X  Keluarkan perubahan bertindih, kurungkan mereka. -X FAIL  --exclude-from=FAIL  Asing fail yang sepadan sebarang corak dalam FAIL. -a  --text  Layan semua fail sebagai teks. -b  --ignore-space-change  Abai perubahan dalam jumlah ruang putih. -b  --print-bytes  Cetak byte berbeza. -c  -C NOM  --context[=NOM]  Keluarkan NOM (default 3) baris konteks yang disalin.
-u  -U NOM  --unified[=NOM]  Keluarkan NOM (default 3) baris konteks tergabung.
  --label LABEL  Guna LABEL selain daripada nama fail.
  -p  --show-c-function  Papar fungsi C yang mana dalam setiap perubahan.
  -F RE  --show-function-line=RE  Papar baris terbaru sepadan RE. -d  --minimal  Cuba cari dengan tekun set perbezaan yang kecil. -e  --ed  Keluarkan skrip ed. -e  --ed  Keluarkan perubahan tidak digabung daripada OLDFILE ke YOURFILE kedalam MYFILE. -i  --ignore-case  Anggap huruf besar dan kecil sebagai sama. -i  --ignore-case  Abai perbezaan case dalam kandungan fail. -i  Tambah arahan `w' dan `q' kepada skrip ed. -i LANGKAU  --ignore-initial=LANGKAU  Langkau LANGKAU byte pertama masukan. -i LANGKAU1:LANGKAU2  --ignore-initial=LANGKAU1:LANGKAU2 -l  --left-column  Keluarkan hanya lajur kiri baris yang sama. -l  --paginate  Salur keluaran menerusi `pr' untuk paginate. -l  --verbose  Keluarkan nombor byte dan nilai semua byte berbeza. -m  --merge  Keluarkan fail tergabung selain daripada skrip ed (default -A). -n  --rcs  Keluarkan diff format RCS. -n HAD  --bytes=HAD  Banding paling banyak HAD byte. -o FAIL  --output=FAIL  Operasi secara interaktif, hantar keluaran ke FAIL. -q  --brief  Keluaran hanya jika fail berbeza. -r  --recursive  Banding berulang-ulang sebarang subdirektori yang dijumpai. -s  --quiet  --silent  Tiada keluaran; hasilkan status keluaran sahaja. -s  --report-identical-files  Lapor apabila dua fail adalah sama. -s  --suppress-common-lines  Jangan keluarkan baris sama. -t  --expand-tabs  Kembang tab kepada ruang dalam keluaran. -v  --version  Keluarkan maklumat versi. -w  --ignore-all-space  Abai semua ruang putih. -w NOM  --width=NOM  Keluarkan paling banyak NOM (default 130) lajur cetakan. -x  --overlap-only  Keluarkan perubahan bertindih. -x PAT  --exclude=PAT  Asing fail yang sepadan PAT. -y  --side-by-side  Keluaran dalam dua lajur.
  -W NOM  --width=NOM  Keluarkan paling banyak NOM (default 130) lajur cetakan.
  --left-column  Keluarkan hanya lajur kiri pada baris sama.
  --suppress-common-lines  Jangan keluarkan baris sama. Subdirektori umum: %s dan %s
 Banding fail setiap baris. Banding tiga fail tiap-tiap baris. Banding dua fail setiap byte. FAIL-FAIL adalah `FAIL1 FAIL2' atau `DIR1 DIR2' atau `DIR FAIL...' atau `FAIL... DIR'. Fail %s adalah %s manakala fail %s adalah %s
 Fail %s dan %s adalah serupa
 Fail %s dan %s berbeza
 Jika --from-file atau --to-file diberi, tiada sekatan pada FAIL. Jika FAIL adalah `-' atau tiada, baca masukan piawai. Jika FAIL adalah `-', baca masukan piawai. Rujukan belakang tidak sah Nama kelas aksara tidak sah Aksara pengumpulsemakan tidak sah Kandungan \{\} tidak sah Regular expression awalan tidak sah Julat akhir tidak sah Regular expression tidak sah Kehabisan memori Tiada padanan Tiada baris baru pada penghujung fail Tiada regular expression terdahulu Hanya dalam %s: %s
 Regular expression tamat tiba-tiba Regular expression terlalu besar Lapor pepijat kepada <bug-gnu-utils@gnu.org>. Nilai LANGKAU boleh diikuti dengan akhiran pekali berikut:
kB 1000, K 1024, MB 1,000,000, M 1,048,576,
GB 1,000,000,000, G 1,073,741,824, dan seterusnya untuk T, P, E, Z, Y. LANGKAU1 dan LANGKAU2 adalah jumlah byte untuk dilangkau dalam setiap fail. Gabung bersebelahan perbezaaan fail. Berjaya Slash dibelakang Cuba `%s --help' untuk maklumat lanjut. Ralat sistem tidak diketahui ( atau \( tidak sepadan ) atau \) tidak sepadan [ atau [^ tidak sepadan \{ tidak sepadan Penggunaan: %s [PILIHAN]... FAIL1 FAIL2
 Penggunaan: %s [PILIHAN]... FAIL1 [FAIL2 [LANGKAU1 [LANGKAU2]]]
 Penggunaan: %s [PILIHAN]... FAIL
 Penggunaan: %s [PILIHAN]... MYFILE OLDFILE YOURFILE
 pilihan `-%ld' tidak lagi digunakan; abaikannya pilihan `-%ld' tidak lagi digunakan; guna `-%c %ld' `-' dinyatakan untuk lebih daripada satu fail masukan fail khas blok kedua-dua fail yang akan dibanding adalah direktori tidak dapat membandingkan `-' kepada direktori tidak dapat membandingkan fail bernama `%s' dan `%s' tidak dapat menggabung masukan piawai secara interaktif fail khas aksara cmp: EOF pada %s
 nilai pilihan %s berkonflik `%s' pilihan gaya keluaran berkonflik pilihan saiz tab berkonflik pilihan lebar berkonflik direktori ed:	Sunting kemudian guna kedua-dua versi, setiap satu ditambah dengan header.
eb:	Sunting kemudian guna kedua-dua versi.
el:	Sunting kemudian guna versi kiri.
er:	Sunting kemudian guna versi kanan.
e:	Sunting versi baru.
l:	Guna versi kiri.
r:	Guna versi kanan.
s:	Sertakan baris sama dengan senyap.
v:	Sertakan baris sama dengan berjela.
q:	Keluar.
 operan tambahan `%s' fifo pilihan tidak sepadan fail masukan mengecil ralat dalaman: jenis diff tidak sah dalam process_diff ralat dalaman: jenis diff tidak sah diberikan kepada keluaran ralat dalaman: kerosakan dalam format blok diff nilai --bytes `%s' tidak sah nilai `%s' --ignore-initial tidak sah panjang konteks `%s' tidak sah format diff tidak sah; baris akhir tidak lengkap format diff tidak sah; aksara awal baris tidak betul format diff tidak sah; pengasing perbezaan tidak sah panjang horizon `%s' tidak sah saiz tab `%s' tidak sah lebar `%s' tidak sah kehabisan memori barisan mesej operan hilang selepas `%s' pilihan -l dan -s tidak sepadan pagination tidak disokong pada hos ini ralat program gagal membaca fail kosong biasa fail biasa semaphore objek ingatan dikongsi soket stack melimpah keluaran piawai program subsidiari `%s' gagal program subsidiari `%s' tidak dijumpai pautan simbolik terlalu banyak pilihan label fail fail pelik gagal menulis 