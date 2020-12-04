let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <C-F8> :call Class_test_method()
imap <M-F8> :call Gen_test_class_file()
imap <M-F7> 0isub A { my $self = shift; $self}0<Down>
imap <S-F7> 0isub wywA {my ($self, )  = @_;return "pa";}0<Down>
imap <C-F6> :call Class_factory()
imap <M-F6> 0"byWW"dyW0DAsub "dpa {(shift)->{"bpi}->"dpa(@_)}0<Down>
imap <M-F5> 0"bdwisub "bpa {my $self=shift; @_ ? $self->{"bpa} = $_[0] : $self->{"bpa}}0Â€kd
imap <S-F5> 0"bdwisub "bpa {shift->{"bpa}}0<Down>
imap <C-F5> :call Make_method()
imap <S-F3> I#----------[ A ]-----------------j
imap <C-F3> <C-Home><Insert>#-----------------[ =strftime("%Y-%m-%d %a %I:%M %p") ]----------------
inoremap <Nul> 
imap <S-Tab> <<
cnoremap <C-F4> c
inoremap <C-F4> c
cnoremap <C-Tab> w
inoremap <C-Tab> w
cmap <S-Insert> +
imap <S-Insert> 
xnoremap  ggVG
snoremap  gggHG
onoremap  gggHG
nnoremap  gggHG
vnoremap  "+y
noremap <expr>  has("gui_running") ? ":promptfind\" : "/"
nnoremap <expr>  has("gui_running") ? ":promptrepl\" : "\"
nmap  :noh
noremap  
vnoremap  :update
nnoremap  :update
onoremap  :update
nmap  "+gP
omap  "+gP
vnoremap  "+x
noremap  u
cnoremap Â  :simalt ~
inoremap Â  :simalt ~
map Q gq
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
noremap tt :tab split
nnoremap <SNR>33_: :=v:count ? v:count : ''
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nmap <C-F8> :call Class_test_method()
nmap <M-F8> :call Gen_test_class_file()
nmap <M-F7> 0isub A { my $self = shift; $self}0<Down>
nmap <S-F7> 0isub wywA {my ($self, )  = @_;return "pa";}0<Down>
nmap <C-F6> :call Class_factory()
nmap <M-F6> 0"byWW"dyW0DAsub "dpa {(shift)->{"bpi}->"dpa(@_)}0<Down>
nmap <M-F5> 0"bdwisub "bpa {my $self=shift; @_ ? $self->{"bpa} = $_[0] : $self->{"bpa}}0Â€kd
nmap <S-F5> 0"bdwisub "bpa {shift->{"bpa}}0<Down>
nmap <C-F5> :call Make_method()
onoremap <C-F4> c
onoremap <C-Tab> w
vmap <S-Insert> 
nmap <S-F3> I#----------[ A ]-----------------j
nmap <C-F3> <C-Home><Insert>#-----------------[ =strftime("%Y-%m-%d %a %I:%M %p") ]----------------
nnoremap <kMinus> 
nnoremap <kPlus> 
nnoremap <C-F4> c
vnoremap <C-F4> c
nnoremap <C-Tab> w
vnoremap <C-Tab> w
nmap <S-Insert> "+gP
omap <S-Insert> "+gP
vnoremap <BS> d
vmap <C-Del> "*d
vnoremap <S-Del> "+x
vnoremap <C-Insert> "+y
cnoremap  gggHG
inoremap  gggHG
cnoremap <expr>  has("gui_running") ? "\\:promptfind\" : "\\/"
inoremap <expr>  has("gui_running") ? "\\:promptfind\" : "\\/"
cnoremap <expr>  has("gui_running") ? "\\:promptrepl\" : "\"
inoremap <expr>  has("gui_running") ? "\\:promptrepl\" : "\"
inoremap  :update
inoremap  u
cmap  +
imap  
inoremap  
inoremap  u
inoremap # #
noremap Â  :simalt ~
abbr tt :tab split
abbr pCmp_set cmp_set( $actual_data_structure, $expected_data_structure, "comment");03w=Eatchar('\s')
abbr pCmp_bag cmp_bag( $actual_data_structure, $expected_data_structure, "comment");03w=Eatchar('\s')
abbr pCmp_deeply cmp_deeply( $actual_data_structure, $expected_data_structure, "comment");0ww=Eatchar('\s')
abbr pCmp_ok cmp_ok($got, '==', $expected, $test_name);0ww=Eatchar('\s') 
abbr pIsa_ok isa_ok('object' 'class');0ww=Eatchar('\s')
abbr pCan_ok can_ok('module', @methods);0ww=Eatchar('\s')
abbr pLives ok (lives { yy }, "did not die") or note($@);
abbr pDies like ( dies { yy }, qr/xxx/,"Got exception");
abbr pLike like ('your_test', qr//i, 'like: ');0ww=Eatchar('\s')
abbr pIsnt isnt 'your_test', your_val, 'isnt: ';0W=Eatchar('\s')
abbr pIs1 is $self->your_test, 'your_val', 'is: ';05wcw<Left>
abbr pIs is your_test, 'your_val', 'is: ';02Wcw
abbr pOk ok('' eq '', 'ok: ');0W=Eatchar('\s')
abbr pDriver :call Driver()
abbr pNew sub new {my ($class, %parms)=@_;my $self = bless {%parms,},$class;return $self;}03<Up>W=Eatchar('\s')
abbr pTest :call Test_class()
abbr pMock_test :r c:/rdd/template/mock_module
abbr pMock_file :call Load_mock_file()
abbr pModule :r c:/rdd/template/pModule.pm
abbr pSub :r c:/rdd/template/sub.stubWcw=Eatchar('\s')
abbr pLoopHereList for my $cServer (split (/\n/, $cServers)) {next if ($cServer =~ /^\s*$/) or ($cServer =~ /^\s*#/);}04<Up><Insert>=Eatchar('\s')
abbr pLoopHoH for my $cKey1 (sort keys %{$rhParms}) {for my $cKey2 (sort keys %{$rhParms->{$cKey1}}) {print "$rhParms->{$cKey1}{$cKey2}\n";}}6<Up>3w<Insert>=Eatchar('\s')
abbr pLoopHoA for my $cKey (sort keys %{$rhParms }) {for (@{$rhParms->{$cKey }}) {print "$_\n";}}6<Up>3w<Insert>=Eatchar('\s')
abbr pLoopAoA for my $raData (@{$raParms }) {for my $raData2  (@{$raData }) {print "$raData2->[0], $raData2->[1]\n";}print "\n";}6<Up>3w<Insert>=Eatchar('\s')
abbr pLoopAoH for my $rhData (@{$raParms }) {for my $cKey (sort keys %{$rhData }) {print "$cKey, $rhData->{$cKey }\n";}}6<Up>3w<Insert>=Eatchar('\s')
abbr pWarn warn ("WARN: \n") if ();05wlB<Insert>=Eatchar('\s')
abbr pConfess Logger->logconfess ("FAIL: \n") unless ();03W<Insert>=Eatchar('\s')
abbr pCroak croak ("FAIL: \n") unless  ();05wlB<Insert>=Eatchar('\s')
abbr pDie die ("FAIL: \n") unless ();05wlB<Insert>=Eatchar('\s')
abbr pPod :r c:/rdd/template/pod.pm
abbr pModulino :r c:/rdd/template/modulino.pm
abbr pLoopFile :r c:/rdd/template/loopfile.stub
abbr poPod 0<Insert>=pod0<Insert>=cut3<Up>0W<Insert>=Eatchar('\s')
abbr pAllTrim s/^\s+//;s/\s+$//;
abbr pSchwartz my @aa2 =	sort { $a->[1] <=> $b->[1] }grep { $_->[0] =~ /$qr/i  }map  { $_, $_->[0]	4}@aa1;B<Insert> 
abbr pArray my @data = qw();<Left><Insert>=Eatchar('\s')
abbr pHash my %data = (var1   => '','var2'  => \&sub1(),);4<Up>2w<Insert>=Eatchar('\s')
abbr pMatch3 my ($m1  = $v1)  =~ s/(\S+)/cat/;03w<Insert>=Eatchar('\s')
abbr pMatch2 my ($m1)  = $v1  =~ s/(\S+)/that/g;03w<Insert>=Eatchar('\s')
abbr pMatch my ($m1)  = $v1  =~ /(\S+)/;03w<Insert>=Eatchar('\s')
abbr pPrf printf ("%s\n", $a);02w<Right><Insert>=Eatchar('\s')
abbr pSay say "";02w<Right><Insert>=Eatchar('\s')
abbr pPri print "\n";02w<Right><Insert>=Eatchar('\s')
abbr pMy3 my ($self, %parms) = @_;0<Down>
abbr pMy2 my ()= @_;^4<Right><Insert>=Eatchar('\s')
abbr pMy1 my ()= "";^4<Right><Insert>=Eatchar('\s')
abbr pMy my ();^4<Right><Insert>=Eatchar('\s')
abbr pDebug $DB::single = 1;
abbr p( ("\n");4<Left><Insert>=Eatchar('\s')
abbr pOpen open (, ) or die "Open: $!";^6<Right><Insert>=Eatchar('\s')
abbr pClose close () or die "Close: $!";02w<Right><Insert>=Eatchar('\s')
abbr pFor1 print ("$_\n") for @a1;b<Insert>=Eatchar('\s')
abbr pFor for () {}-Wli=Eatchar('\s')
abbr pWh while () {}<Up>^7<Right><Insert>=Eatchar('\s')
abbr pIfE if () {} elsif () {} else () {}4<Up>^4<Right><Insert>=Eatchar('\s')
abbr pIfe if () {} else {}2<Up>^4<Right><Insert>=Eatchar('\s')
abbr pIf if () {}<Up>^4<Right><Insert>=Eatchar('\s')
abbr pObj :set ft=perl:r c:\tools\mytemplates\objTemplatecw=Eatchar('\s')
abbr pPD <C-Home>I#----------[ =strftime("%Y-%m-%d %a %I:%M %p") ]-----------------:r c:\tools\mytemplates\PD2W<Insert><Insert>
abbr pRecipeHdr :r c:\tools\mytemplates\RecipeHdr
abbr pomDay2 Pom01 - POM01Pom02 - POM02Pom03 - POM03Pom04 - POM04Pom05 - POM05Pom06 - POM06Pom07 - POM07Pom08 - POM08Pom09 - POM09Pom10 - POM10Pom11 - POM11Pom12 - POM12Pom13 - POM13Pom14 - POM14Pom15 - POM15Pom16 - POM16Pom17 - POM17---- AFTER_HOURS ---------[ 10/11/2012 ]-----------------Pom1 - POM1Pom2 - POM2Pom3 - POM3Pom4 - POM4Pom5 - POM5Pom6 - POM628<Up>2W<Insert>=Eatchar('\s')
abbr pomDay1 ---- CURRENT_DAY ---------[ =strftime("%Y-%m-%d") ]-----------------<Up>3W<Insert>=Eatchar('\s')
abbr pQuoteParm ("\n");<Up><End>4<Left><Insert>=Eatchar('\s')
abbr pTitle1 0<Insert>#---------------------[ ]---------------------0W<Insert>=Eatchar('\s')
abbr pTitle0 0<Insert>#=====================[ ]=====================0W<Insert>=Eatchar('\s')
abbr pProblem :r c:\tools\mytemplates\problem.txt
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autowrite
set background=dark
set backspace=indent,eol,start
set complete=.,w,b,u
set completeopt=longest,menuone
set directory=c:\\tmp
set display=truncate
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Consolas:h11:cANSI
set guioptions=egLtrb
set helplang=En
set history=1000
set hlsearch
set ignorecase
set incsearch
set keymodel=startsel,stopsel
set langnoremap
set nolangremap
set laststatus=2
set listchars=trail:·,precedes:«,extends:»,eol:¿,tab:¿\ 
set nrformats=bin,hex
set path=''
set ruler
set runtimepath=~/vimfiles,~\\vimfiles\\bundle\\vim-fugitive,C:\\Program\ Files\ (x86)\\Vim/vimfiles,C:\\Program\ Files\ (x86)\\Vim\\vim81,C:\\Program\ Files\ (x86)\\Vim\\vim81\\pack\\dist\\opt\\matchit,C:\\Program\ Files\ (x86)\\Vim/vimfiles/after,~/vimfiles/after
set scrolloff=5
set selection=exclusive
set selectmode=mouse,key
set shiftwidth=2
set showtabline=2
set sidescrolloff=5
set smartindent
set smarttab
set statusline=%-10.3n\ %f\ %h%m%r%w[%{strlen(&ft)?&ft:'none'}]%=0x%-8B%-14(%l,%c%V%)%<%P
set noswapfile
set tabpagemax=15
set tabstop=2
set ttimeout
set ttimeoutlen=100
set undofile
set visualbell
set whichwrap=b,s,<,>,[,]
set wildmenu
set window=50
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd R:\rdd\proj\Fdisk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 t\Fdisk.t
badd +0 lib\Fdisk.pm
badd +0 t\Fdisk.mock
badd +0 Fdisk.pl
argglobal
silent! argdel *
edit t\Fdisk.t
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 78 + 117) / 235)
exe 'vert 2resize ' . ((&columns * 77 + 117) / 235)
exe '3resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 3resize ' . ((&columns * 78 + 117) / 235)
exe '4resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 4resize ' . ((&columns * 78 + 117) / 235)
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=crqol
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(substitute(v:fname,'::','/','g'),'->*','',''),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path='',C:/Strawberry/perl/site/lib/MSWin32-x64-multi-thread,C:/Strawberry/perl/site/lib,C:/Strawberry/perl/vendor/lib,C:/Strawberry/perl/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('lib\Fdisk.pm') | buffer lib\Fdisk.pm | else | edit lib\Fdisk.pm | endif
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=crqol
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(substitute(v:fname,'::','/','g'),'->*','',''),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path='',C:/Strawberry/perl/site/lib/MSWin32-x64-multi-thread,C:/Strawberry/perl/site/lib,C:/Strawberry/perl/vendor/lib,C:/Strawberry/perl/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('t\Fdisk.mock') | buffer t\Fdisk.mock | else | edit t\Fdisk.mock | endif
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('Fdisk.pl') | buffer Fdisk.pl | else | edit Fdisk.pl | endif
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=crqol
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(substitute(v:fname,'::','/','g'),'->*','',''),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path='',C:/Strawberry/perl/site/lib/MSWin32-x64-multi-thread,C:/Strawberry/perl/site/lib,C:/Strawberry/perl/vendor/lib,C:/Strawberry/perl/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
4wincmd w
exe 'vert 1resize ' . ((&columns * 78 + 117) / 235)
exe 'vert 2resize ' . ((&columns * 77 + 117) / 235)
exe '3resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 3resize ' . ((&columns * 78 + 117) / 235)
exe '4resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 4resize ' . ((&columns * 78 + 117) / 235)
tabnext 1
if exists('s:wipebuf') && s:wipebuf != bufnr('%')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
