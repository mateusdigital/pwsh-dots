��       �     �   �  ,      �   ~  �  p  h   �  �   F  �   I  �        0  9     j     |     �   ,  �     �   %  �   ,  !   -  N      |   &  �     �     �   L     J  Q   -  �   5  �   (      L  )     v   D  �   ?  �   B     D  X     �   I  �   =     A  E   J  �   =  �   8     9  I   C  �   F  �   (     @  7   B  x   M  �   K  	   8  U   ,  �   J  �   9     /  @   0  p   K  �   $  �   G     )  Z  V  �   9  �        G  4   A  |   <  �   .  �   C  *   ,  n   ?  �   <  �   E      B   ^   %   �   5   �   F   �   .  !D   >  !s   >  !�   A  !�   8  "3   3  "l   #  "�   /  "�   D  "�   /  #9   4  #i   �  #�   !  $�     $�   !  $�     $�   I  %   &  %O     %v     %�   I  %�   1  %�   &  &)     &P     &g     &�     &�   $  &�     &�     &�     '
     '     '$     '>     ']   #  'm     '�   '  '�   �  '�   =  (�   '  (�     (�     (�   %  )     )-     )B     )T     )f     )x   "  )�   4  )�     )�   .  )�   "  *)   (  *L   *  *u     *�   )  *�   !  *�   '  *�   )  +'     +Q     +h      +x      +�     +�     +�   	  +�  A  +�     -<     -O     -T     -i   1  -{   2  -�   0  -�     .   #  .,     .P   )  .l   1  .�   -  .�     .�     /     /'     /:     /K     /Y   "  /t   %  /�     /�     /�     /�     /�   	  /�     0     0     0     0,     0<   !  0[     0}     0�   
  0�     0�  L  0�   �  2    2�    4�   Q  5�   �  61   1  6�   D  6�     7+   ,  7I   (  7v   E  7�   6  7�   :  8   E  8W   F  8�   9  8�   7  9   /  9V   /  9�   o  9�   p  :&   Q  :�   d  :�   @  ;N   �  ;�   /  <   q  <I   y  <�   k  =5   |  =�   2  >   w  >Q   D  >�   d  ?   �  ?s   r  ?�   [  @h   a  @�   a  A&   m  A�   O  A�   o  BF   q  B�   y  C(   u  C�   f  D   ^  D   s  D�   h  ER   ?  E�   Z  E�   �  FV   G  F�   b  G(   O  G�  !  G�   T  I�   ,  JR   �  J   Q  K   c  KU   I  K�   g  L   <  Lk   c  L�   P  M   t  M]   i  M�   8  N<   Z  Nu   f  N�   X  O7   p  O�   ^  P   \  P`   U  P�   W  Q   0  Qk   =  Q�   r  Q�   G  RM   Z  R�  R  R�   @  TC   5  T�   <  T�   @  T�   �  U8   W  U�   @  V   -  V_   v  V�   j  W   O  Wo   8  W�   5  W�   0  X.   +  X_   G  X�   *  X�   2  X�   #  Y1     YU   ;  Yo   7  Y�     Y�   A  Y�   9  Z9   �  Zs   �  [   w  [�   ?  \B     \�   /  \�   L  \�   2  ]     ]A     ]`     ]     ]�   L  ]�   e  ^   8  ^g   ^  ^�   J  ^�   Q  _J   G  _�   4  _�   M  `   H  `g   O  `�   U  a    2  aV     a�   E  a�   ;  a�   E  b   ,  bc     b�  *  b�   $  d�     d�   !  d�   1  e    ]  eR   a  e�   O  f   6  fb   ?  f�   7  f�   H  g   Y  gZ   X  g�   =  h   C  hK   *  h�   #  h�     h�   7  h�   0  i*   P  i[     i�     i�   *  i�     j     j1   8  j@   
  jy     j�     j�   9  j�   :  j�     k3   >  kQ     k�   )  k�      P              �   Q   V   �       /          �   �          S   �   �   ;       o   "   @   �   F   r                      �   �   �   2      G   1           A       y   O   |   �   Y   f   )       k   4   �   �   g           H   L   0   :      \   `   X       �          8   %   Z   <       i   #              N   .   ~               �   ]   q   d          -       {   p       b      6       �   �       7   ,          a   B                 
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
PO-Revision-Date: 2004-02-21 15:05-0500
Last-Translator: Aleksandar Jelenak <jelenak@netlinkplus.net>
Language-Team: Serbian <gnu@prevod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
   Било ГОБЛ или РОБЛ могу садржати:
    %%  %
    %c'З'  само један знак „З“
    %c'\OOO'  знак са окталним кодом OOO   ГОБЛ може садржати:
    %<  редове из ДАТОТЕКА1
    %>  редове из ДАТОТЕКА2
    %=  редове заједничке у ДАТОТЕКА1 и ДАТОТЕКА2
    %[-][ШИРН][.[ТАЧН]]{doxX}СЛОВО  printf-стил за СЛОВО
      СЛОВО за нову групу, мала слова за стару групу:
        F  број првог реда
        L  број задњег реда
        N  број редова = L-F+1
        E  F-1
        M  L+1   РОБЛ може садржати:
    %L  садржај реда
    %l  садржај реда, изузев пратећих знакова за нови ред
    %[-][ШИРН][.[ТАЧН]]{doxX}n  printf-стил за улазни број реда   LTYPE је `old', `new', или `unchanged'. GTYPE је LTYPE или `changed'.   Изостави првих БРОЈ1 бајтова ДАТОТЕКА1 и првих БРОЈ2 бајтова ДАТОТЕКА2. %s %s различити: бајт %s, ред %s
 %s %s различити: бајт %s, ред %s је %3o %s %3o %s
 %s: diff неуспешан:  %s: неправилна опција -- %c
 %s: неважећа опција -- %c
 %s: опција „%c%s“ не дозвољава аргумент
 %s: опција „%s“ је двосмислена
 %s: опција „%s“ захтева аргумент
 %s: опција „--%s“ не дозвољава аргумент
 %s: опција „-W %s“ не дозвољава аргумент
 %s: опција „-W %s“ је двосмислена
 %s: опција захтева аргумент -- %c
 %s: непозната опција „%c%s“
 %s: непозната опција „--%s“
 --GTYPE-group-format=ГОБЛ  Слично, али обликуј GTYPE улазне групе са ГОБЛ. --LTYPE-line-format=РОБЛ  Слично, али обликуј LTYPE улазне редове са РОБЛ. --binary  Читај и пиши податке у бинарном режиму. --diff-program=ПРОГРАМ  Користи ПРОГРАМ за поређење датотека. „--from-file“ и „--to-file“ обоје наведени --from-file=ТЕКА1  Упореди ТЕКА1 са свим оперантима. ТЕКА1 може бити директоријум. --help  Испиши ово објашњење. --horizon-lines=БРЈ  Чувај БРЈ редова заједничког префикса и суфикса. --ignore-file-name-case  Занемари словну величину поређујући имена датотека. --line-format=РОБЛ  Слично, али обликуј све улазне редове са РОБЛ. --no-ignore-file-name-case  Урачунај словну величину поређујући имена датотека. --normal  Излаз је обичан „diff“. --speed-large-files  За велике датотеке са много раштрканих малих промена. --strip-trailing-cr  Оголи пратеће <CR> на улазу. --tabsize=БРЈ  Величина табулатора је БРЈ (почетно 8) колона. --to-file=ТЕКА2  Упореди све операнте са ТЕКА2. ТЕКА2 може бири директоријум. --unidirectional-new-file  Прве недостајуће датотеке се узимају за празне. -3  --easy-only  Испиши неспојене непреклопљене промене. -A  --show-all  Испиши све промене, означи заградама сукобе. -B  --ignore-blank-lines  Занемари промене услед празних редова. -D ИМЕ   --ifdef=ИМЕ   Испиши „#ifdef ИМЕ“ разлике спојене датотеке. опција „-D“ није подржана за директоријуме -E  --ignore-tab-expansion  Занемари промене услед развијања табулатора. -E  --show-overlap  Испиши неспојене промене, означи заградама сукобе. -H  --speed-large-files  За велике датотеке за много раштрканих малих измена. -I РИ  --ignore-matching-lines=РИ  Занемари промене чији редови поклапају РИ. -L ОЗНКА  --label=ОЗНКА  Користи ОЗНКА уместо имена датотеке. -N  --new-file  Недостајуће датотеке се узимају за празне. -S ТЕКА  --starting-file=ТЕКА  Почни од ТЕКА при поређењу директоријума. -T  --initial-tab  Поравнај табулаторе додајући један табулатор. -W  --ignore-all-space  Занемари све размаке. -X  Испиши и означи заградама преклопљене промене. -X ТЕКА  --exclude-from=ТЕКА  Изузми датотеке које поклапа било који образац у ТЕКА. -a  --text  Прихвати све датотеке као текст. -b  --ignore-space-change  Занемари промене због количине белине. -b  --print-bytes  Испиши бајтове који се разликују -c  -C БРЈ  --context[=БРЈ]  Испиши БРЈ (почетно 3) редова копираног склопа.
-u  -U БРЈ  --unified[=БРЈ]  Испиши БРЈ (почетно 3) редова обједињеног склопа.
  --label ОЗНАКА  Користи ОЗНАКА уместо имена датотеке.
  -p  --show-c-function  Прикажи Це функцију у којој је промена.
  -F РИ  --show-function-line=РИ  Прикажи најскорији ред који РИ поклапа. -d  --minimal  Потруди се да нађеш мањи скуп промена. -e  --ed  Излаз је „ed“ спис. -e  --ed  Испиши неспојене промене између СТАРАТЕКА и ТВОЈАТЕКА у МОЈАТЕКА. -i  --ignore-case  Сматрај велика и мала слова истим. -i  --ignore-case  Занемари словну величину у склопу датотека. -i  Придодај „w“ и „q“ наредбе ed списима. -i БРОЈ  --ignore-initial=БРОЈ  Изостави првих БРОЈ бајтова улаза. -i БРОЈ1:БРОЈ2  --ignore-initial=БРОЈ1:БРОЈ2 -l  --left-column  Испиши само леву колону заједничких редова. -l  --paginate  Пропусти излаз кроз „pr“ за прелом. -l  --verbose  Испиши редни број и вредност бајтова који се разликују. -m  --merge  Испиши спојену датотеку уместо ed списа (почетно -A). -n  --rcs  Излаз је RCS облик „diff-а“. -n БРОЈ  --bytes=БРОЈ    Пореди до највише БРОЈ бајтова. -o ТЕКА  --output=ТЕКА  Интерактивни рад, излаз се шаље у ТЕКА. -q  --brief  Пријави само да ли се датотеке разликују. -r  --recursive  Рекурзивно упореди све пронађене поддиректоријуме. -s  --quiet  --silent  Без исписа; пријави само излазно стање. -s  --report-identical-files  Пријави када су две датотеке исте. -s  --suppress-common-lines  Не приказуј заједничке редове. -t  --expand-tabs  Развиј табулаторе у размаке за излаз. -v  --version  Извести о верзији. -w  --ignore-all-space  Занемари сву белину. -w БРЈ  --width=БРЈ  Ширина излаза је највише БРЈ (почетно 130) колона. -x  --overlap-only  Испиши преклопљене промене. -x ОБР  --exclude=ОБР  Изузми датотеке које поклапа ОБР. -y  --side-by-side  Испис у две колоне.
  -W БРЈ  --width=БРЈ  Испис највише БРЈ (почетно 130) знакова.
  --left-column  Испис само леве колоне код заједничких редова.
  --suppress-common-lines  Не исписуј заједничке редове. Заједнички поддиректоријуми: %s и %s
 Поређење датотека ред по ред. Поређење три датотеке ред по ред. Поређење две датотеке бајт по бајт. ДАТОТЕКЕ су „ТЕКА1 ТЕКА2“ или „ДИР1 ДИР2“ или „ДИР ТЕКА...“ или „ТЕКА... ДИР“. Датотека „%s“ је „%s“ док је датотека „%s“ „%s“
 Датотеке „%s“ и „%s“ се подударају
 Датотеке %s и %s различите
 Нема ограничења за ДАТОТЕКЕ ако је „--from-file“ или „--to-file“ задато. Читати стандардни улаз ако ДАТОТЕКА недостаје или је „-“. Ако је ДАТОТЕКА „-“, читај стандардни улаз. Неисправна повратна референца Неправилно име класе знакова Неисправан колациони знак Неисправан садржај у \{\} Неисправан претходећи регуларни израз Неисправан крај опсега Неисправан регуларни израз Меморија исцрпљена Без поклапања Без новог реда на крају датотеке Без прошлог регуларног израза Само у %s: %s
 Преран завршетак регуларног израза Регуларни израз исувише велики Пријава грешака на адресу <bug-gnu-utils@gnu.org>.
Поруке у вези превода слати на <gnu@prevod.org>. Уз БРОЈ могу ићи и следећи умножавајући суфикси:
kB 1000, K 1024, MB 1,000,000, M 1,048,576, GB 1,000,000,000, G 1,073,741,824,
итд. за T, P, E, Z, Y. БРОЈ1 и БРОЈ2 су бројеви бајтова за изостављање у свакој датотеци. Упоредно стапање разлика датотека Успешно Пратећа обрнута коса црта Покушајте `%s --help' за подробније објашњење. Непозната системска грешка Неупарено ( или \( Неупарено ) или \) Неупарено [ или [^ Неупарено \{ Употреба: %s [ОПЦИЈА]... ДАТОТЕКА1 ДАТОТЕКА22
 Употреба: %s [ОПЦИЈА]... ДАТОТЕКА1 [ДАТОТЕКА2 [БРОЈ1 [БРОЈ2]]]
 Употреба: %s [ОПЦИЈА]... ДАТОТЕКЕ
 Употреба: %s [ОПЦИЈА]... МОЈАТЕКА СТАРАТЕКА ТВОЈАТЕКА
 опција „-%ld“ је застарела; изоставите је опција „-%ld“ је застарела; користити „-%c %ld“ „-“ наведено за више од једне датотеке датотека блоковског уређаја обе датотеке за поређење су директоријуми не може поредити „-“ са директоријумом не може поредити имена датотека „%s“ и „%s“ не може интерактивно уклопити стандардни улаз датотека знаковног уређаја cmp: EOF на %s
 сукоб због вредности „%s“ опције „%s“ сукобљене опције излазног стила сукобљене опције величине табулатора сукобљене опције ширине директоријум ed:	Уреди па користи обе верзије, свака украшена заглављем.
eb:	Уреди па користи обе верзије.
el:	Уреди па користи верзију лево.
er:	Уреди па користи верзију десно.
e:	Уређуј нову верзију.
l:	Користи верзију лево.
r:	Користи верзију десно.
s:	Уметни заједничке редове тихо.
v:	Уметни заједничке редове бучно.
q:	Заврши.
 вишак оператор „%s“ fifo несагласне опције улазна датотека се скупила интерна грешка: неисправна „diff“ врста у „process_diff“ унутрашња грешка: неисправан diff тип прослеђен излазу интерна грешка: зез у формату „diff“ блокова неисправна --bytes вредност „%s“ неисправна --ignore-initial вредност „%s“ неисправна дужина склопа „%s“ неисправан diff облик; непотпун задњи ред неисправан diff облик; нетачни водећи знакови реда неисправан diff облик; неважећи раздвојник измена неисправна дужина видокруга „%s“ неисправна величина табулатора „%s“ неисправна дужина „%s“ меморија исцрпљена ред порука недостаје оператор после „%s“ опције -l и -s не иду заједно прелом страна није подржан на овом рачунару грешка програма неуспело читање обична празна датотека обична датотека семафор заједнички меморијски објекат сокет стек препуњен стандардни излаз помоћни програм „%s“ неуспешан помоћни програм „%s“ није нађен симболичка веза исувише опција за ознаку датотека чудна датотека записивање неуспешано 