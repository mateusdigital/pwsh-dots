��       �     �   �  ,      �   ~  �  p  h   �  �   F  �   I  �        0  9     j     |     �   ,  �     �   %  �   ,  !   -  N      |   &  �     �     �   L     J  Q   -  �   5  �   (      L  )     v   D  �   ?  �   B     D  X     �   I  �   =     A  E   J  �   =  �   8     9  I   C  �   F  �   (     @  7   B  x   M  �   K  	   8  U   ,  �   J  �   9     /  @   0  p   K  �   $  �   G     )  Z  V  �   9  �        G  4   A  |   <  �   .  �   C  *   ,  n   ?  �   <  �   E      B   ^   %   �   5   �   F   �   .  !D   >  !s   >  !�   A  !�   8  "3   3  "l   #  "�   /  "�   D  "�   /  #9   4  #i   �  #�   !  $�     $�   !  $�     $�   I  %   &  %O     %v     %�   I  %�   1  %�   &  &)     &P     &g     &�     &�   $  &�     &�     &�     '
     '     '$     '>     ']   #  'm     '�   '  '�   �  '�   =  (�   '  (�     (�     (�   %  )     )-     )B     )T     )f     )x   "  )�   4  )�     )�   .  )�   "  *)   (  *L   *  *u     *�   )  *�   !  *�   '  *�   )  +'     +Q     +h      +x      +�     +�     +�   	  +�  A  +�     -<     -O     -T     -i   1  -{   2  -�   0  -�     .   #  .,     .P   )  .l   1  .�   -  .�     .�     /     /'     /:     /K     /Y   "  /t   %  /�     /�     /�     /�     /�   	  /�     0     0     0     0,     0<   !  0[     0}     0�   
  0�     0�  z  0�   v  2:  �  2�   �  42   R  4�   ?  5   !  5[   6  5}     5�     5�     5�   0  5�     6)   %  6@   0  6f   .  6�     6�   ,  6�      7      7.   L  7O   G  7�   .  7�   A  8   -  8U   T  8�     8�   C  8�   C  9:   C  9~   L  9�     :   E  :-   ?  :s   D  :�   V  :�   H  ;O   5  ;�   D  ;�   :  <   M  <N   %  <�   B  <�   F  =   Q  =L   L  =�   7  =�   5  >#   P  >Y   @  >�   4  >�   0  ?    L  ?Q   1  ?�   B  ?�   &  @  Z  @:   3  A�   "  A�   O  A�   9  B<   4  Bv   -  B�   ?  B�   ,  C   >  CF   9  C�   C  C�   C  D   (  DG   =  Dp   H  D�   1  D�   <  E)   B  Ef   <  E�   >  E�   6  F%   $  F\   4  F�   G  F�   5  F�   8  G4   �  Gm     HM     Hk   %  H�   !  H�   R  H�   .  I&     IU     Im   I  I�   >  I�   6  J     JE     J`     J�     J�   &  J�     J�     J�     K     K   !  K3   %  KU     K{     K�     K�   '  K�   �  K�   D  L�     L�     M     M   ,  M     ML     Mk     M�     M�     M�   &  M�   9  M�   !  N   2  N?   "  Nr   %  N�   /  N�     N�   -  N�   *  O*   1  OU   6  O�     O�     O�   #  O�     P	     P$     P;   	  PP  J  PZ     Q�     Q�     Q�     Q�   <  Q�   >  R'   0  Rf     R�   '  R�      R�   2  R�   :  S1   8  Sl      S�     S�     S�     S�     T     T   !  T0   %  TR     Tx     T�     T�     T�     T�     T�     T�     T�     T�     T�   %  U     U<      UJ   	  Uk     Uu      P              �   Q   V   �       /          �   �          S   �   �   ;       o   "   @   �   F   r                      �   �   �   2      G   1           A       y   O   |   �   Y   f   )       k   4   �   �   g           H   L   0   :      \   `   X       �          8   %   Z   <       i   #              N   .   ~               �   ]   q   d          -       {   p       b      6       �   �       7   ,          a   B                 
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
PO-Revision-Date: 2002-10-07 15:30GMT+0700
Last-Translator: Tedi Heriyanto <tedi_h@gmx.net>
Language-Team: Indonesian <translation-team-id@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 0.9.5
   GFMT atau LFMT dapat berisikan:
    %%  %
    %c'C'  karakter tunggal C
    %c'\OOO'  karakter dengan kode oktal OOO   GFMT dapat berisi:
    %<  baris dari FILE1
    %>  baris dari FILE2
    %=  baris bersama FILE1 dan FILE2
    %[-][WIDTH][.[PREC]]{doxX}LETTER  printf-style spec untuk LETTER
      LETTERs adalah sebagai berikut untuk grup baru, huruf kecil untuk grup tua:
        F  nomor baris pertama
        L  nomor baris terakhir
        N  jumlah baris = L-F+1
        E  F-1
        M  L+1   LFMT dapat berisi:
    %L  isi baris
    %l  isi baris, tanpa baris baru
    %[-][WIDTH][.[PREC]]{doxX}n  printf-style spec untuk nomor baris input   LTYPE adalah `old', `new', atau `unchanged'.  GTYPE adalah LTYPE atau `changed'.   Lewati SKIP1 byte pertama FILE1 dan SKIP2 byte pertama FILE2. %s %s berbeda: byte %s, baris %s
 %s %s berbeda: byte %s, baris %s adalah %3o %s %3o %s
 %s: diff gagal:  %s: option ilegal -- %c
 %s: option invalid -- %c
 %s: option `%c%s' tidak mengijinkan ada argumen
 %s: option `%s' rancu
 %s: option `%s' butuh sebuah argumen
 %s: option `--%s' tidak mengijinkan ada argumen
 %s: option `-W %s' tidak memboleh ada argumen
 %s: option `-W %s' rancu
 %s: option membutuhkan sebuah argumen -- %c
 %s: option tidak dikenal `%c%s'
 %s: option tidak dikenal `--%s'
 --GTYPE-group-format=GFMT Serupa, tapi format input kelompok GTYPE dg GFMT.  --LTYPE-line-format=LFMT Serupa, tapi format baris input LTYPE dg LFMT. --binary Baca dan tulis data dalam mode biner. --diff-program=PROGRAM  Gunakan PROGRAM untuk membandingkan file. --from-file dan --to-file keduanya disebutkan --from-file=FILE1  Bandingkan FILE1 ke semua operand.  FILE1 dapat berupa direktori. --help Tampilkan bantuan ini. --horizon-lines=NUM Pertahankan NUM baris prefiks dan suffiks umum. --ignore-file-name-case  Abaikan case saat membandingkan nama file. --line-format=LFMT Serupa, tapi format seluruh baris input dg LFMT. --no-ignore-file-name-case  Pertimbangkan case saat membandingkan nama file. --normal  Output normal diff. --speed-large-files  Asumsikan file besar dan banyak perubahan kecil. --strip-trailing-cr  Hapus trailing carriage return pada input. --tabsize=NUM  Tab stop adalah setiap NUM (default 8) kolom cetakan. --to-file=FILE2  Bandingkan semua operand dengan FILE2.  FILE2 dapat berupa direktori. --unidirectional-new-file  Anggap file tidak ada pertama sebagai kosong. -3  --easy-only Output unmerged perubahan nonoverlap. -A  --show-all Output seluruh perubahan, konflik dalam tanda kurung. -B  --ignore-blank-lines   Abaikan perubahan baris kosong. -D NAME  --ifdef=NAME  Output file merge untuk tampilkan `#ifdef NAME' diffs. -D option tidak didukung dg direktori -E  --ignore-tab-expansion  Abaikan perubahan akibat ekspansi tab. -E  --show-overlap  Output perubahan unmerge, konflik dl tanda kurung. -H  --speed-large-files  Asumsikan file besar dan banyak sebaran perubahan kecil. -I RE  --ignore-matching-lines=RE  Abaikan perubahan baris yang cocok dg RE. -L LABEL  --label=LABEL  Gunakan LABEL bukan nama file. -N  --new-file  Perlakukan tiada file sebagai kosong. -S FILE  --starting-file=FILE  Mulai dengan FILE ketika membandingkan direktori. -T  --initial-tab  Buat tab beraturan dg menambahkan sebuah tab. -W  --ignore-all-space  Abaikan seluruh white space. -X  Output perubahan overlap, beri tanda kurung. -X FILE  --exclude-from=FILE  Abaikan file yang cocok dengan pola dalam FILE -a  --text  Perlakukan seluruh file sebagai teks. -b  --ignore-space-change  Abaikan perubahan sejumlah white space. -b  --print-bytes  Cetak byte berbeda. -c  -C NUM  --context[=NUM]  Output NUM (baku 3) baris isi yang disalin.
-u  -U NUM  --unified[=NUM]  Output NUM (baku 3) baris unified context.
  --label LABEL  Gunakan LABEL alih-alih nama file.
  -p  --show-c-function  Tampilkan setiap fungsi C yang berubah.
  -F RE  --show-function-line=RE  Tampilkan baris paling akhir yang cocok dengan RE. -d  --minimal  Usahakan mencari perubahan terkecil. -e  --ed  Output adalah script ed. -e  --ed  Output perubahan tanpa dimerge dari OLDFILE ke YOURFILE ke dl MYFILE. -i  --ignore-case  Abaikan huruf kapital dan huruf kecil. -i  --ignore-case  Abaikan beda case dalam isi file. -i  Tambah perintah `w' dan `q' ke script ed. -i SKIP  --ignore-initial=SKIP  Lewati SKIP byte pertama input. -i SKIP1:SKIP2  --ignore-initial=SKIP1:SKIP2 -l  --left-column  Hanya tampilkan kolom kiri baris yang sama. -l  --paginate  Berikan output ke `pr' untuk di-paginate. -l  --verbose  Output nomor byte dan nilai semua byte yang berbeda. -m  --merge  Tampilkan file yang dimerge bukan script ed (baku -A). -n  --rcs  Output dalam format RCS diff. -n LIMIT  --bytes=LIMIT  Bandingkan paling banyak LIMIT byte. -o FILE  --output=FILE  Operasi secara interaktif, kirim output ke FILE. -q  --brief  Tampilkan hanya apakah file berbeda. -r  --recursive  Membandingkan subdirektori secara rekursif. -s  --quiet  --silent  Tidak ada output; hanya beri status keluar. -s  --report-identical-files  Laporkan ketika dua file sama. -s  --suppress-common-lines  Jangan tampilkan baris yang sama. -t  --expand-tabs  Ekspansi tab ke spasi dalam output. -v  --version  Tampilkan info versi. -w  --ignore-all-space  Abaikan seluruh white space. -w NUM  --width=NUM  Output paling banyak NUM (baku 130) kolom cetakan. -x  --overlap-only  Tampilkan perubahan yang overlap. -x PAT  --exclude=PAT  Tanpa file yang cocok dengan PAT. -y  --side-by-side  Output dalam dua kolom.
  -W NUM  --width=NUM  Output paling banyak NUM (baku 130) kolom.
  --left-column  Output hanya kolom kiri baris bersama.
  --suppress-common-lines  Jangan hasilkan baris bersama. Subdirektori sama: %s dan %s
 Bandingkan file baris per baris Bandingkan tiga file baris per baris. Bandingkan dua file byte per byte FILES adalah `FILE1 FILE2' atau `DIR1 DIR2' atau `DIR FILE...' atau `FILE... DIR'. File %s adalah %s sementara file %s adalah %s
 File %s dan %s identik
 File %s dan %s berbeda
 Bila --from-file atau --to-file diberikan, tidak ada batasan untuk FILES. Jika sebuah FILE adalah `-' atau tidak ada, baca input standar Jika sebuah file FILE adalah `-', baca standard input. Back reference tidak valid Nama karakter kelas tidak valid Karakter collation tidak valid Isi \\{\\} tidak valid Ekspresi reguler terdahulu tidak valid Batas akhir tidak valid Ekspresi reguler tidak valid Memori habis Tidak ada kecocokan Tidak ada newline pada akhir file Tidak ada ekspresi reguler sebelumnya Hanya dalam %s: %s
 Akhir ekspresi reguler prematur Ekspresi reguler terlalu besar Laporkan bug ke <bug-gnu-utils@gnu.org> Nilai SKIP dapat diikuti oleh suffiks perkalian berikut:
kB 1000, K 1024, MB 1,000,000, M 1,048,576,
GB 1,000,000,000, G 1,073,741,824, dan seterusnya untuk T, P, E, Z, Y. SKIP1 dan SKIP2 adalah jumlah byte yang harus dilewati di tiap file. Merge side-by-side beda file. Sukses Trailing backslash Coba `%s --help' untuk informasi lebih jauh. Kesalahan sistem tidak dikenal Tidak cocok ( atau \( Tidak cocok ) atau \) Tidak cocok [ atau [^ Tidak cocok \{ Pemakaian: %s [OPTION]... FILE1 FILE2
 Penggunaan: %s [OPTION]... FILE1 [FILE2 [SKIP1 [SKIP2]]]
 Penggunaan: %s [OPTION]... FILES
 Pemakaian: %s [OPTION]... MYFILE OLDFILE YOURFILE
 `-%ld' option kuno, hilangkan saja `-%ld' option kuno; gunakan `-%c %ld' `-' dispesifikasikan lebih dari satu file input blok file khusus kedua file yang dibandingkan adalah direktori tidak dapat membandingkan `-' dg direktori tidak dapat membandingkan nama file `%s' dan `%s' tidak dapat menggabung input standar secara interaktif karakter file khusus cmp: EOF pada %s
 Nilai option %s konflik dengan `%s' option gaya output konflik option tabsize konflik option lebar konflik direktori ed:	Edit lalu gunakan kedua versi, dekorasikan dengan header.
eb:	Edit lalu gunakan kedua versi.
el:	Edit lalu gunakan versi kiri.
er:	Edit lalu gunakan versi kanan.
e:	Edit versi baru.
l:	Gunakan versi kiri.
r:	Gunakan versi kanan.
s:	Sertakan baris bersama secara diam-diam.
v:	Sertakan baris bersama secara verbose.
q:	Keluar.
 operand ekstra `%s' fifo option tidak kompatibel file input mengecil kesalahan internal: tipe diff tidak valid dalam process_diff kesalahan internal: tipe diff tidak valid dimasukkan ke output kesalahan internal: kacau dalam format blok diff nilai --byte tidak valid `%s' tidak valid --ignore-initial value `%s' panjang context tidak valid `%s' format diff tidak valid; baris akhir tidak lengkap format diff tidak valid; karakter leading line tidak tepat format diff tidak valid; separator perubahan tidak valid panjang horizon tidak valid `%s' tabsize tidak valid `%s' lebar tidak valid `%s' memori habis antrian pesan tidak ada operand setelah `%s' option -l dan -s tidak kompatibel paginasi tidak didukung pada host ini kesalahan program gagal membaca file reguler kosong file reguler semafor obyek memori bersama soket overflow stack output standar program subsider `%s' gagal program subsider `%s' tidak ditemukan link simbolik terlalu banyak option label file file aneh gagal menulis 