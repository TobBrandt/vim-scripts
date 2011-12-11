" Vim syntax file
" Language:	Scheme R6RS (including libraries) + Guile (some reader extensions, complete API)
" Last Change:	2011-12-11
" Maintainer:	Tobias Brandt <tob.brandt@gmail.com>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 600
  "set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
  set iskeyword=33,35-38,42-43,45-90,92,94,95,97-122,126,_
else
  "setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
  setlocal iskeyword=33,35-38,42-43,45-90,92,94,95,97-122,126,_
endif


" matches anything that is not matched below and is not whitespace
syn match schemeError ![^ \t\r\n\v\f]*! contained

syn match schemeWhiteSpace ![ \t\r\n\v\f]*! contained

syn match schemeDelimiter ![()\[\];".]!
syn match schemeKeyword ![#]!

" LEXEMES
" =============================================================================

syn match schemeNumber ,\%(\%(#[bB]\%(#[iIeE]\)\?\|#[iIeE]#[bB]\)\%(\%([+-]\?[01][01]*\%(/[01][01]*\)\?\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?[01][01]*\%(/[01][01]*\)\?\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%([01][01]*\%(/[01][01]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%([01][01]*\%(/[01][01]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\|\%(#[oO]\%(#[iIeE]\)\?\|#[iIeE]#[oO]\)\%(\%([+-]\?[0-7][0-7]*\%(/[0-7][0-7]*\)\?\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?[0-7][0-7]*\%(/[0-7][0-7]*\)\?\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%([0-7][0-7]*\%(/[0-7][0-7]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%([0-7][0-7]*\%(/[0-7][0-7]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\|\%(\%(#[dD]\)\?\%(#[iIeE]\)\?\|#[iIeE]\%(#[dD]\)\?\)\%(\%([+-]\?\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\)\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\)\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\|\%(#[xX]\%(#[iIeE]\)\?\|#[iIeE]#[xX]\)\%(\%([+-]\?[0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?[0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%([0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%([0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\)\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\), contains=schemeExactness,schemeNumericPrefix,schemeNanInfImag,schemePolar,schemeMantissaSep

syn match schemeIdentifier "\%(\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\)\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\|[+-]\|\.\.\.\|->\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\)\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\)"

syn match schemeExactness ,#[eEiI], contained
syn match schemeNumericPrefix ,#[bBoOdDxX], containedin=schemeNumber
syn match schemeNanInfImag ,#\@<!in\@!, contained
syn match schemeNanInfImag ,[+-]\@<=\%(nan\|inf\), contained
syn match schemePolar ,@, contained
syn match schemeMantissaSep ,|, contained

" #\a #\space #\xDEADBEEF ...
syn match schemeChar ,\%(#\\.\|#\\\%(nul\|alarm\|backspace\|tab\|linefeed\|newline\|vtab\|page\|return\|esc\|space\|delete\)\|#\\x[0-9a-fA-F][0-9a-fA-F]*\)\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\), contains=schemeInlineHexEscape

" #\t #\f #\T #\F
syn match schemeBool ,#[fFtT]\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\),

" STRINGS
" =============================================================================

" inline hex escapes, C-style escaped chars and scheme chars are highlighted
syn region schemeString start=,", end=,", skip=,\\", contains=schemeInlineHexEscape,schemeEscapedChar,schemeCharName
syn match schemeInlineHexEscape ,\\x[0-9a-fA-F]\+;,
syn match schemeEscapedChar ,\\[abtnvfr"\\], contained
syn match schemeCharName ,\\\%(nul\|alarm\|backspace\|tab\|linefeed\|newline\|vtab\|page\|return\|esc\|space\|delete\), contained

" COMMENTS
" =============================================================================

" highlighted as group Todo in all comment constructs
syn keyword schemeTodo TODO FIXME XXX contained

" #| ... |#
syn region schemeNestedComment start=,\%(#|\)\@<=#|, start=,|\@<!#|, end=,|#, contains=schemeNestedComment,schemeTodo
" ; ...
syn match schemeEolComment ,;.*$, contains=schemeTodo
" #!identifier, if identifier is r6rs, it is highlighted specially
"syn match schemeSpecialComment ,#!\%(\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\)\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\|[+-]\|\.\.\.\|->\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\)\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\), contains=schemeSpecialCommentR6RS

"syn match schemeSpecialCommentR6RS ,r6rs, contained

" Datum comments have the form #; followed by interlexeme whitespace, followed
" by one datum
" FIXME not completely correct: only allows whitespace after #; but not comments

" #; identifier
syn match schemeDatumComment "#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*\%(\%([a-zA-Z]\|[!$%&*/:<=>?^_~+]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\)\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\|[+-]\|\.\.\.\|->\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\)\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\)"

" #; number
syn match schemeDatumComment !#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*\%(\%(#[bB]\%(#[iIeE]\)\?\|#[iIeE]#[bB]\)\%(\%([+-]\?[01][01]*\%(/[01][01]*\)\?\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?[01][01]*\%(/[01][01]*\)\?\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%([01][01]*\%(/[01][01]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%([01][01]*\%(/[01][01]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\|\%(#[oO]\%(#[iIeE]\)\?\|#[iIeE]#[oO]\)\%(\%([+-]\?[0-7][0-7]*\%(/[0-7][0-7]*\)\?\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?[0-7][0-7]*\%(/[0-7][0-7]*\)\?\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%([0-7][0-7]*\%(/[0-7][0-7]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%([0-7][0-7]*\%(/[0-7][0-7]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\|\%(\%(#[dD]\)\?\%(#[iIeE]\)\?\|#[iIeE]\%(#[dD]\)\?\)\%(\%([+-]\?\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\)\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\)\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%(\%(\.[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\.[0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\|[0-9][0-9]*\%([eEsSfFdDlL][+-]\?[0-9][0-9]*\)\?\)\%(|[0-9][0-9]*\)\?\|[0-9][0-9]*\%(/[0-9][0-9]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\|\%(#[xX]\%(#[iIeE]\)\?\|#[iIeE]#[xX]\)\%(\%([+-]\?[0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|[+-]\%(nan\|inf\)\.0\)\%(@\%([+-]\?[0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|[+-]\%(nan\|inf\)\.0\)\|[+-]\%([0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\?\|[+-]\%([0-9a-fA-F][0-9a-fA-F]*\%(/[0-9a-fA-F][0-9a-fA-F]*\)\?\|\%(nan\|inf\)\.0\)\?i\)\)\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)!

" #; boolean
syn match schemeDatumComment !#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*#[fFtT]\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)!

" #; character
syn match schemeDatumComment ,#;[ \t\n\r\v\f]*\%(#\\.\|#\\\%(nul\|alarm\|backspace\|tab\|linefeed\|newline\|vtab\|page\|return\|esc\|space\|delete\)\|#\\x[0-9a-fA-F][0-9a-fA-F]*\)\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\),

" #; string
syn region schemeDatumComment start=!#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*"! end=,", skip=,\\",

" #; (...) or #; [...] with optional # or #vu8 in front
syn region schemeDatumComment start=!#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*\%(#\%(vu8\)\?\)\?(! end=,),
syn region schemeDatumComment start=!#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*\%(#\%(vu8\)\?\)\?\[! end=,\],

" STRUCTURE
" =============================================================================

" start of a compound structure
" \%(#\?\%([`',]\|,@\)\)*[ \t\n\r\f\v]*\%(#\%(vu8\)\?\)\?
syn match schemeKeyword !\%(,@\|[()\[\]#";`', \t\n\r\f\v]\)\@<=\%(,@\|[`',]\)!
syn match schemeKeyword !#vu8!



" NAMING CONVENTIONS
" =============================================================================

syn match schemeConstant !+\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\++\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)! 

syn match schemeGlobalVar !\*\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\+\*\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)! 

syn match schemeType !<\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\+>\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)! 

syn match schemeCondition !&\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\+\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)! 

syn match schemeLowLevel !%\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\+\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)! 



" BASE LIBRARY
" =============================================================================

" library syntax
syn keyword schemeKeyword library export import rename for run expand meta only except prefix 

" 11.2
syn keyword schemeKeyword define define-syntax 
" 11.4
syn keyword schemeKeyword quote lambda set! and or let let* letrec letrec* let-values let*-values begin 
syn keyword schemeConditional if cond => else case 
" 11.5
syn keyword schemeProc eqv? eq? equal 
" 11.6
syn keyword schemeProc procedure? 
" 11.7
syn keyword schemeProc number? complex? real? rational? integer? real-valued? rational-valued? integer-valued? exact? inexact? 
syn keyword schemeProc exact inexact 
syn keyword schemeOperator = < > <= >= + * - / 
syn keyword schemeProc zero? positive? negative? odd? even? finite? infinite? nan? max min abs div-and-mod div mod div0-and-mod0 div0 mod0 gcd lcm numerator denominator floor ceiling truncate round rationalize exp log sin cos tan asin acos atan sqrt exact-integer-sqrt expt make-rectangular make-polar real-part imag-part magnitude angle 
syn keyword schemeProc number->string string->number 
" 11.8
syn keyword schemeProc not boolean? boolean=? 
" 11.9
syn keyword schemeProc pair? cons car cdr caar cadr cdar cddr caaar caadr cadar cdaar caddr cdadr cddar cdddr caaaar caaadr caadar cadaar cdaaar caaddr cadadr caddar cdaadr cdadar cddaar cadddr cdaddr cddadr cdddar cddddr null? list? list length append reverse list-tail list-ref map for-each 
" 11.10
syn keyword schemeProc symbol? symbol->string symbol=? string->symbol 
" 11.11
syn keyword schemeProc char? char->integer integer->char char=? char<? char>? char<=? char>=? 
" 11.12
syn keyword schemeProc string? make-string string string-length string-ref string=? string<? string>? string<=? string>=? substring string-append string->list list->string string-for-each string-copy 
" 11.13
syn keyword schemeProc vector? make-vector vector vector-length vector-ref vector-set! vector->list list->vector vector-fill! vector-map vector-for-each 
" 11.14
syn keyword schemeProc error assertion-violation 
syn keyword schemeException assert 
" 11.15
syn keyword schemeProc apply call-with-current-continuation call/cc values call-with-values dynamic-wind 
" 11.17
syn keyword schemeKeyword quasiquote unquote unquote-splicing 
" 11.18
syn keyword schemeKeyword let-syntax letrec-syntax 
" 11.19
syn keyword schemeKeyword syntax-rules _ ... identifier-syntax 



" STANDARD LIBRARIES
" =============================================================================
" 1
syn keyword schemeProc char-upcase char-downcase char-titlecase char-foldcase char-ci=? char-ci<? char-ci>? char-ci<=? char-ci>=? char-alphabetic? char-numeric? char-whitespace? char-upper-case? char-lower-case? char-title-case? string-upcase string-downcase string-titlecase string-foldcase string-ci=? string-ci<? string-ci>? string-ci<=? string-ci>=? string-normalize-nfd string-normalize-nfkd string-normalize-nfc string-normalize-nfkc 

" 2
syn keyword schemeKeyword endianness 
syn keyword schemeProc native-endianness bytevector? make-bytevector bytevector-length bytevector=? bytevector-fill! bytevector-copy! bytevector-copy bytevector-u8-ref bytevector-s8-ref bytevector-u8-set! bytevector-s8-set! bytevector->u8-list u8-list->bytevector bytevector-uint-ref bytevector-sint-ref bytevector-uint-set! bytevector-sint-set! bytevector->uint-list bytevector->sint-list uint-list->bytevector sint-list->bytevector bytevector-u16-ref bytevector-s16-ref bytevector-u16-set! bytevector-s16-set! bytevector-u16-native-ref bytevector-s16-native-ref bytevector-u16-native-set! bytevector-s16-native-set! bytevector-u32-ref bytevector-s32-ref bytevector-u32-set! bytevector-s32-set! bytevector-u32-native-ref bytevector-s32-native-ref bytevector-u32-native-set! bytevector-s32-native-set! bytevector-u64-ref bytevector-s64-ref bytevector-u64-set! bytevector-s64-set! bytevector-u64-native-ref bytevector-s64-native-ref bytevector-u64-native-set! bytevector-s64-native-set! bytevector-ieee-single-ref bytevector-ieee-double-ref bytevector-ieee-single-set! bytevector-ieee-double-set! bytevector-ieee-single-native-ref bytevector-ieee-double-native-ref bytevector-ieee-single-native-set! bytevector-ieee-double-native-set! string->utf8 string->utf16 string->utf32 utf8->string utf16->string utf32->string 

" 3
syn keyword schemeProc find for-all exists filter partition fold-left fold-right remp remove remv remq memp member memv memq assp assoc assv assq cons* 

" 4
syn keyword schemeProc list-sort vector-sort vector-sort! 

" 5
syn keyword schemeConditional when unless 
syn keyword schemeRepeat do 
syn keyword schemeKeyword case-lambda 

" 6
syn keyword schemeKeyword define-record-type fields mutable immutable parent protocol sealed opaque nongenerative parent-rtd record-type-descriptor record-constructor-descriptor 

syn keyword schemeProc make-record-type-descriptor record-type-descriptor? make-record-constructor-descriptor record-constructor record-predicate record-accessor record-mutator record? record-rtd record-type-name record-type-parent record-type-uid record-type-generative? record-type-sealed? record-type-opaque? record-type-field-names record-field-mutable? 

" 7
syn keyword schemeException with-exception-handler raise raise-continuable guard 
syn keyword schemeProc condition simple-conditions condition? condition-predicate condition-accessor make-message-condition message-condition? condition-message make-warning warning? make-serious-condition serious-condition? make-error error? make-violation violation? make-assertion-violation assertion-violation? make-irritants-condition irritants-condition? condition-irritants make-who-condition who-condition? condition-who make-non-continuable-violation non-continuable-violation? make-implementation-restriction-violation implementation-restriction-violation? make-lexical-violation lexical-violation? make-syntax-violation syntax-violation? syntax-violation-form syntax-violation-subform make-undefined-violation undefined-violation? 
syn keyword schemeCondition &condition &message &warning &serious &irritants &who  &error &violation &assertion &non-continuable &lexical &syntax &implementation-restriction &undefined

" 8
syn keyword schemeProc make-i/o-error i/o-error? make-i/o-read-error i/o-read-error? make-i/o-write-error i/o-write-error? make-i/o-invalid-position-error i/o-invalid-position-error? i/o-error-position ßmake-i/o-filename-error i/o-filename-error? i/o-error-filename make-i/o-file-protection-error i/o-file-protection-error? make-i/o-file-is-read-only-error i/o-file-is-read-only-error? make-i/o-file-already-exists-error i/o-file-already-exists-error? make-i/o-file-does-not-exist-error i/o-file-does-not-exist-error? make-i/o-port-error i/o-port-error? i/o-error-port buffer-mode?latin-1-codec utf-8-codec utf-16-codec native-eol-stylemake-i/o-decoding-error i/o-decoding-error?make-i/o-encoding-error i/o-encoding-error?i/o-encoding-error-char make-transcoder native-transcodertranscoder-codec transcoder-eol-style transcoder-error-handling-mode bytevector->stringstring->bytevector eof-object eof-object? port? port-transcoder textual-port? binary-port? transcoded-port port-has-port-position? port-position port-has-set-port-position!? set-port-position! close-port call-with-port input-port? port-eof? open-file-input-port open-bytevector-input-port open-string-input-port standard-input-port current-input-port make-custom-binary-input-port make-custom-textual-input-port get-u8 lookahead-u8 get-bytevector-n get-bytevector-n! get-bytevector-some get-bytevector-all get-char lookahead-char get-string-n get-string-n! get-string-all get-line get-datum output-port? flush-output-port output-port-buffer-mode open-file-output-port open-bytevector-output-port call-with-bytevector-output-port open-string-output-port call-with-string-output-port standard-output-port standard-error-port current-output-port current-error-port make-custom-binary-output-port make-custom-textual-output-port
syn keyword schemeProc put-u8 put-bytevector put-char put-string put-datum open-file-input/output-port make-custom-binary-input/output-port make-custom-textual-input/output-port call-with-input-file call-with-output-file with-input-from-file with-output-to-file open-input-file open-output-file close-input-port close-output-port read-char peek-char read write-char newline display write
syn keyword schemeCondition &i/o &i/o-read &i/o-write &i/o-invalid-position &i/o-filename&i/o-file-protection &i/o-file-is-read-only &i/o-file-already-exists &i/o-file-does-not-exist&i/o-port &i/o-decoding &i/o-encoding
syn keyword schemeKeyword file-options buffer-mode eol-style error-handling-mode

" 9
syn keyword schemeProc file-exists? delete-file

" 10
syn keyword schemeProc command-line exit

" 11
syn keyword schemeProc fixnum? fixnum-width least-fixnumgreatest-fixnumfx=?fx>?fx<?fx>=?fx<=?fxzero?fxpositive?fxnegative?fxodd?fxeven?fxmaxfxminfx+fx*fx-fxdiv-and-modfxdivfxmodfxdiv0-and-mod0fxdiv0fxmod0fx+/carryfx-/carryfx*/carryfxnotfxandfxiorfxxorfxiffxbit-countfxlengthfxfirst-bit-setfxbit-set?fxcopy-bitfxbit-fieldfxcopy-bit-fieldfxarithmetic-shiftfxarithmetic-shift-leftfxarithmetic-shift-rightfxrotate-bit-fieldfxreverse-bit-field
syn keyword schemeProc flonum? real->flonum fl=? fl<? fl<=? fl>? fl>=? flinteger? flzero? flpositive? flnegative? flodd? fleven? flfinite? flinfinite? flnan? flmax flmin fl+ fl* fl- fl- fl/ fl/ flabs fldiv-and-mod fldiv flmod fldiv0-and-mod0 fldiv0 flmod0 flnumerator fldenominator flfloor flceiling fltruncate flround flexp fllog fllog flsin flcos fltan flasin flacos flatan flatan flsqrt flexpt make-no-infinities-violation no-infinities-violation? make-no-nans-violation no-nans-violation? fixnum->flonum bitwise-not bitwise-and bitwise-ior bitwise-xor bitwise-if bitwise-bit-count bitwise-length bitwise-first-bit-set bitwise-bit-set? bitwise-copy-bit bitwise-bit-field bitwise-copy-bit-field bitwise-arithmetic-shift bitwise-arithmetic-shift-left bitwise-arithmetic-shift-right bitwise-rotate-bit-field bitwise-reverse-bit-field
syn keyword schemeCondition &no-infinities &no-nans

" 12
syn keyword schemeKeyword with-syntax quasisyntax unsyntax unsyntax-splicing
syn keyword schemeProc make-variable-transformer identifier? bound-identifier=? free-identifier=? syntax->datum datum->syntax generate-temporaries syntax-violation
syn keyword schemeKeyword syntax-case _ ...

" 13
syn keyword schemeProc make-eq-hashtable make-eqv-hashtable make-hashtable hashtable? hashtable-ref hashtable-set! hashtable-delete! hashtable-contains? hashtable-update! hashtable-copy hashtable-clear! hashtable-keys hashtable-entries hashtable-equivalence-function hashtable-hash-function hashtable-mutable? equal-hash string-hash string-ci-hash symbol-hash

" 14
syn keyword schemeProc make-enumeration enum-set-universe enum-set-indexer enum-set-constructor enum-set->list enum-set-member? enum-set-subset? enum-set=? enum-set-union enum-set-intersection enum-set-difference enum-set-complement enum-set-projectio
syn keyword schemeKeyword define-enumeration

" 16
syn keyword schemeProc eval environment

" 17
syn keyword schemeProc set-car! set-cdr!

" 18
syn keyword schemeProc string-set! string-fill!

" 19
syn keyword schemeProc exact->inexact inexact->exact quotient remainder modulo force null-environment scheme-report-environment 
syn keyword schemeKeyword (delay


" READER EXTENSIONS
" =============================================================================

" keyword syntax: #:foo
syn match schemeKeyword ,#:\%(\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\|[+-]\|\.\.\.\|->\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\)\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\), contains=schemeInlineHexEscape

syn match schemeDatumComment "#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*#:\%(\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\|[+-]\|\.\.\.\|->\%([a-zA-Z]\|[!$%&*/:<=>?^_~]\|\\x[0-9a-fA-F][0-9a-fA-F]*;\|[0-9]\|[+-.@]\)*\)\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\)"

" bitvectors: #*0101110
syn match schemeBitvector ,#\*[01]\+\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\),
syn match schemeDatumComment !#;[ \t\n\r\f\v]*\%(\%(#\?\%([`',]\|,@\)\)[ \t\r\n\f\v]*\)*#\*[01]\+\%(\%([()\[\]";#]\|[\t\n\v\f\r ]\)\@=\|$\)!

" guile multiline comments
syn region guileComment start=,#!\%(r6rs\)\@!, end=,!#,
syn match schemeSpecialCommentR6RS ,#!r6rs,


" GOOPS
" =============================================================================

syn keyword guileKeyword define-class define-method define-generic define-accessor class method 
syn keyword guileProc make make-instance enable-primitive-generic! primitive-generic-generic next-method no-method no-applicable-method no-next-method class-name class-direct-supers class-direct-slots class-direct-subclasses class-direct-methods class-precedence-list class-slots class-subclasses class-methods class-of instance? is-a? class-slot-definition slot-definition-name slot-definition-options slot-definition-allocation slot-definition-getter slot-definition-setter slot-definition-accessor slot-definition-init-value slot-definition-init-form slot-definition-init-thunk slot-definition-init-keyword slot-init-function generic-function-name generic-function-methods method-generic-function method-specializers method-procedure method-source slot-exists? slot-bound? slot-ref slot-set! slot-exists-using-class? slot-bound-using-class? slot-ref-using-class slot-set-using-class! class-slot-ref class-slot-set! slot-missing slot-unbound goops-error shallow-clone deep-clone write display make-class ensure-metaclass compute-std-cpl make-method add-method! ensure-generic make-generic ensure-accessor make-accessor class-redefinition remove-class-accessors! update-direct-method! update-direct-subclass! change-class update-instance-for-different-class 

" GUILE MODULE SYSTEM
" =============================================================================

syn keyword guileKeyword use-modules use-syntax define-module export define-public re-export 
syn keyword schemeOperator @ @@ 
syn keyword guileProc symbol-prefix-proc current-module set-current-module save-module-excursion resolve-module resolve-interface module-use! reload-module 

" GUILE EXTENSIONS
" =============================================================================

" optargs
syn keyword guileKeyword lambda* define*
" arrays TODO: reader syntax extension
syn keyword guileProc array? typed-array? make-array make-typed-array list->array array-type array-ref array-in-bounds? array-set! array-shape array-rank array->list array-copy! array-fill! array-equal? array-map! array-map-in-order! array-for-each array-index-map! uniform-array-read! uniform-array-write make-shared-array shared-array-increments shared-array-offset shared-array-root array-contents transpose-array 
" bitvectors
syn keyword guileProc bitvector? make-bitvector bitvector bitvector-length bitvector-ref bitvector-set! bitvector-fill! list->bitvector bitvector->list bit-count bit-position bit-invert! bit-set*! bit-count*
" generalized vectors
syn keyword guileProc generalized-vector? generalized-vector-length generalized-vector-ref generalized-vector-set! generalized-vector->list 
" vlists
syn keyword guileProc vlist? vlist-null vlist-null? vlist-cons vlist-head vlist-tail vlist-fold vlist-fold-right vlist-ref vlist-length vlist-reverse vlist-map vlist-for-each vlist-drop vlist-take vlist-filter vlist-delete vlist-unfold vlist-append vlist-unfold-right list->vlist vlist->list
syn keyword schemeGlobalVar block-growth-factor
" structures
syn keyword guileProc make-vtable make-struct struct? struct-ref struct-set! struct-vtable struct-vtable? vtable-index-layout vtable-index-vtable vtable-index-printer struct-vtable-name set-struct-vtable-name! struct-vtable-tag make-vtable-vtable make-struct-layout vtable-offset-user 
" vhashes
syn keyword guileProc vhash? vhash-cons vhash-consq vhash-consv vhash-assoc vhash-assq vhash-assv vhash-delete vhash-delq vhash-delv vhash-fold vhash-fold-right vhash-fold* vhash-foldq* vhash-foldv* alist->vhash 
" alists
syn keyword guileProc acons assq-set! assv-set! assoc-set! assq assv assoc assq-ref assv-ref assoc-ref assq-remove! assv-remove! assoc-remove! sloppy-assq sloppy-assv sloppy-assoc 
" hash tables
syn keyword guileProc make-hash-table hash-table? hash-clear! hash-ref hashq-ref hashv-ref hashx-ref hash-set! hashq-set! hashv-set! hashx-set! hash-remove! hashq-remove! hashv-remove! hashx-remove! hash hashq hashv hash-get-handle hashq-get-handle hashv-get-handle hashx-get-handle hash-create-handle! hashq-create-handle! hashv-create-handle! hashx-create-handle! hash-map->list hash-for-each hash-for-each-handle hash-fold 
" vectors (most of theses are duplicates of r6rs)
syn keyword guileProc vector-length vector-ref vector-set! vector-fill! vector-copy vector-move-left! vector-move-right! 
" uniform vectors
syn match guileProc ,\%(make-\|list->\)\?[us]\%(8\|16\|32\|64\)vector\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\),
syn match guileProc ,\%(make-\|list->\)\?[fc]\%(32\|64\)vector\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\),
syn match guileProc ,[us]\%(8\|16\|32\|64\)vector\%(?\|-length\|-ref\|-set!\|->list\)\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\),
syn match guileProc ,[fc]\%(32\|64\)vector\%(?\|-length\|-ref\|-set!\|->list\)\%(\%([()\[\]\";#]\|[\t\n\v\f\r ]\)\@=\|$\),
" memory management
syn keyword guileProc gc gc-stats make-hook hook? hook-empty? add-hook! remove-hook! reset-hook! run-hook make-weak-key-hash-table make-weak-value-hash-table make-doubly-weak-hash-table weak-key-hash-table? weak-value-hash-table? doubly-weak-hash-table? make-weak-vector weak-vector list->weak-vector weak-vector? make-guardian
" utility functions
syn keyword guileProc object->string make-object-property object-properties set-object-properties! object-property set-object-property! merge merge! sorted? sort sort! stable-sort stable-sort! restricted-vector-sort! copy-tree 
" binding
syn keyword guileKeyword define-once
syn keyword guileProc defined?
" control
syn keyword guileProc break continue guileProc call-with-prompt make-prompt-tag default-prompt-tag abort-to-promp abort reset shift call-with-current-continuation call/cc values call-with-values receive catch with-throw-handler throw error scm-error strerror dynamic-wind display-error with-continuation-barrier
syn keyword guileKeyword false-if-exception
syn keyword schemeOperator %
syn keyword guileErrorKey error-signal system-error numerical-overflow out-of-range wrong-type-arg wrong-number-of-args memory-allocation-error stack-overflow regular-expression-syntax misc-error
" i/o
syn keyword guileProc set-port-encoding! port-encoding set-port-conversion-strategy! port-conversion-strategy char-ready? unread-char unread-string drain-input port-column port-line set-port-column! set-port-line! get-print-state port-with-print-state simple-format write-char force-output flush-all-ports close-port close-input-port port-closed? seek ftell truncate-file read-line read-line! read-delimited read-delimited! write-line read-string!/partial  write-string/partial current-input-port current-output-port current-error-port set-current-input-port set-current-output-port set-current-error-port open-file open-input-file call-with-input-file call-with-output-file with-input-from-file with-error-to-file with-output-to-file port-mode port-filename set-port-filename! file-port? call-with-output-string call-with-input-string with-output-to-string with-input-from-string open-input-string open-output-string get-output-string make-soft-port %make-void-port %read-delimited! %read-line
syn keyword schemeConstant SEEK_SET SEEK_CUR SEEK_END
" regex
syn keyword guileProc string-match make-regexp regexp-exec regexp? list-matches fold-matches regexp-substitute regexp-substitute/global regexp-match? match:substring match:start match:end match:prefix match:suffix match:count match:string regexp-quote 
syn keyword schemeConstant regexp/icase regexp/newline regexp/basic regexp/extended regexp/notbol regexp/noteol
" lalr(1) parsing
syn keyword guileKeyword lalr-parser
syn keyword guileProc lexical-token-category lexical-token-source lexical-token-value make-lexical-token make-source-location source-location-column source-location-input source-location-length source-location-line source-location-offset
" ffi
syn keyword guileProc dynamic-link dynamic-object? dynamic-unlink dynamic-func dynamic-call load-extension dynamic-pointer pointer-address make-pointer pointer? null-pointer? scm->pointer pointer->scm pointer->bytevector bytevector->pointer dereference-pointer string->pointer pointer->string sizeof alignof make-c-struct parse-c-struct
syn keyword guileCType int8 uint8 uint16 int16 uint32 int32 uint64 int64 float double int unsigned-int long unsigned-long size_t void  
syn keyword guileKeyword define-wrapped-pointer-type
" syntax
syn keyword guileProc read-hash-extend 
" scheduling
syn keyword guileProc make-arbiter try-arbiter release-arbiter system-async-mark call-with-blocked-asyncs call-with-unblocked-asyncs async async-mark run-asyncs all-threads current-thread call-with-new-thread thread? join-thread thread-exited? yield cancel-thread set-thread-cleanup! thread-cleanup make-mutex mutex? make-recursive-mutex lock-mutex try-mutex unlock-mutex mutex-owner mutex-level mutex-locked? make-condition-variable condition-variable? wait-condition-variable signal-condition-variable broadcast-condition-variable make-fluid make-unbound-fluid fluid? fluid-ref fluid-set! fluid-unset! fluid-bound? with-fluid* with-fluids* make-dynamic-state dynamic-state? current-dynamic-state set-current-dynamic-state with-dynamic-state make-future future? touch par-map par-for-each n-par-map n-par-for-each n-for-each-par-map
syn keyword guileKeyword make-thread begin-thread with-mutex monitor with-fluids future parallel letpar
" dynamic ffi
syn keyword guileProc pointer->procedure procedure->pointer
" options and config
syn keyword guileProc version effective-version major-version minor-version micro-version %package-data-dir %library-dir %site-dir parse-path search-path provided? provide
syn keyword guileGlobalVar %load-path %guile-build-info %host-type *features*
" i18n
syn keyword guileProc make-locale locale? string-locale<? string-locale>? string-locale-ci<? string-locale-ci>? string-locale-ci=? char-locale<? char-locale>? char-locale-ci<? char-locale-ci>? char-locale-ci=? char-locale-downcase char-locale-upcase char-locale-titlecase string-locale-upcase string-locale-downcase string-locale-titlecase locale-string->integer locale-string->inexact number->locale-string monetary-amount->locale-string locale-encoding locale-day locale-day-short locale-month locale-month-short locale-am-string locale-pm-string locale-date+time-format locale-date-format locale-time-format locale-time+am/pm-format locale-era-date-format locale-era-date+time-format locale-era-time-format locale-era locale-era-year locale-decimal-point locale-thousands-separator locale-digit-grouping locale-monetary-decimal-point locale-monetary-thousands-separator locale-monetary-grouping locale-currency-symbol locale-monetary-fractional-digits locale-currency-symbol-precedes-positive? locale-currency-symbol-precedes-negative? locale-positive-separated-by-space? locale-negative-separated-by-space? locale-monetary-positive-sign locale-monetary-negative-sign locale-positive-sign-position locale-negative-sign-position locale-yes-regexp locale-no-regexp gettext ngettext textdomain bindtextdomain bind-textdomain-codeset
syn keyword guileGlobalVar %global-locale 
syn keyword guileSymbol parenthesize sign-before sign-after sign-before-currency-symbol sign-after-currency-symbol unspecified
" code coverage
syn keyword guileProc with-code-coverage coverage-data? coverage-data->lcov instrumented-source-files line-execution-counts instrumented/executed-lines procedure-execution-count
" macros
syn keyword guileKeyword define-syntax-rule syntax with-syntax eval-when identifier-syntax
syn keyword guileProc identifier? datum->syntax syntax->datum bound-identifier=? free-identifier=? generate-temporaries make-variable-transformer make-syntax-transformer macro? macro-type macro-name macro-binding macro-transformer 
" debugging
syn keyword guileProc make-stack start-stack stack? stack-id stack-length stack-ref display-backtrace frame? frame-previous frame-procedure frame-arguments frame-address frame-instruction-pointer frame-stack-pointer frame-dynamic-link frame-return-address frame-mv-return-address frame-num-locals frame-local-ref frame-local-set! display-application set-source-properties! set-source-property! source-properties source-property cons-source backtrace call-with-error-handling debug-options debug-enable debug-disable vm-next-hook vm-push-continuation-hook vm-pop-continuation-hook vm-apply-hook vm-abort-continuation-hook vm-restore-continuation-hook vm-trace-level set-vm-trace-level! trap-at-procedure-call trap-in-procedure trap-instructions-in-procedure trap-at-procedure-ip-in-range trap-at-source-location trap-frame-finish trap-in-dynamic-extent trap-calls-in-dynamic-extent trap-instructions-in-dynamic-extent trap-calls-to-procedure trap-matching-instructions trace-calls-to-procedure trace-calls-in-procedure trace-instructions-in-procedure call-with-trace add-trap! list-traps trap-name trap-enabled? enable-trap! disable-trap! delete-trap! with-default-trap-handler install-trap-handler! add-trap-at-procedure-call! add-trace-at-procedure-call! add-trap-at-source-location! add-ephemeral-trap-at-frame-finish! add-ephemeral-stepping-trap!
syn keyword guileSymbol on-error post-error trap-handler pass-keys
syn keyword guileKeyword debug-set! 
" read/load/eval/compile
syn keyword guileProc read read-options read-enable read-disable write display print-options eval interaction-environment eval-string apply apply:nconc2last primitive-eval compile compile-file compiled-file-name load load-compiled load-from-path primitive-load primitive-load-path %search-load-path current-load-port file-encoding promise? force 
syn keyword guileKeyword read-set! print-set! delay
syn keyword guileGlobalVar %auto-compilation-options current-reader %load-hook %load-extensions

"==============================================================================

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scheme_syntax_inits")
  if version < 508
    let did_scheme_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink schemeNestedComment Comment
  HiLink schemeEolComment Comment
  HiLink schemeSpecialComment Comment
  HiLink schemeDatumComment Comment
  HiLink guileComment Comment

  HiLink schemeInlineHexEscape SpecialChar
  HiLink schemeEscapedChar SpecialChar
  HiLink schemeCharName SpecialChar
  HiLink schemeExactness Special
  HiLink schemeNumericPrefix Special
  HiLink schemePolar Special
  HiLink schemeMantissaSep Special
  HiLink schemeDelimiter Special
  HiLink schemeSpecialCommentR6RS Special
  HiLink schemeQuoted Special
  HiLink schemeBitvector Special
  HiLink schemeLowLevel Special
  HiLink guileSymbol Special
  HiLink guileErrorKey Special

  HiLink schemeNanInfImag Constant
  HiLink schemeConstant Constant

  HiLink schemeGlobalVar Identifier
  HiLink guileGlobalVar Identifier

  HiLink schemeChar Character 

  HiLink schemeBool Boolean

  HiLink schemeNumber Number

  HiLink schemeString String

  HiLink schemeStringError Error
  HiLink schemeIdentifierError Error

  HiLink schemeTodo Todo

  HiLink schemeType Type
  HiLink schemeCondition Type
  HiLink guileCType Type

  HiLink schemeKeyword Keyword
  HiLink guileKeyword Keyword
  HiLink schemeConditional Conditional
  HiLink schemeOperator Operator
  HiLink schemeException Exception
  HiLink schemeRepeat Repeat
  HiLink schemeProc Function
  HiLink guileProc Function


  delcommand HiLink
endif

let b:current_syntax = "scheme"
