(define-library (termbox2)
  (export OK
          ERR
          ERR-NEED-MORE
          ERR-INIT-ALREADY
          ERR-INIT-OPEN
          ERR-MEM
          ERR-NO-EVENT
          ERR-NO-TERM
          ERR-NOT-INIT
          ERR-OUT-OF-BOUNDS
          ERR-READ
          ERR-RESIZE-IOCTL
          ERR-RESIZE-PIPE
          ERR-RESIZE-SIGACTION
          ERR-POLL
          ERR-TCGETATTR
          ERR-TCSETATTR
          ERR-UNSUPPORTED-TERM
          ERR-RESIZE-WRITE
          ERR-RESIZE-POLL
          ERR-RESIZE-READ
          ERR-RESIZE-SSCANF
          ERR-CAP-COLLISION
          ERR-SELECT
          ERR-RESIZE-SELECT
          KEY-CTRL-TILDE
          KEY-CTRL-2
          KEY-CTRL-A
          KEY-CTRL-B
          KEY-CTRL-C
          KEY-CTRL-D
          KEY-CTRL-E
          KEY-CTRL-F
          KEY-CTRL-G
          KEY-CTRL-BACKSPACE
          KEY-CTRL-H
          KEY-CTRL-TAB
          KEY-CTRL-I
          KEY-CTRL-J
          KEY-CTRL-K
          KEY-CTRL-L
          KEY-CTRL-ENTER
          KEY-CTRL-M
          KEY-CTRL-N
          KEY-CTRL-O
          KEY-CTRL-P
          KEY-CTRL-Q
          KEY-CTRL-R
          KEY-CTRL-S
          KEY-CTRL-T
          KEY-CTRL-U
          KEY-CTRL-V
          KEY-CTRL-W
          KEY-CTRL-X
          KEY-CTRL-Y
          KEY-CTRL-Z
          KEY-ESC
          KEY-CTRL-LSQ-BRACKET
          KEY-CTRL-3
          KEY-CTRL-4
          KEY-CTRL-BACKSLASH
          KEY-CTRL-5
          KEY-CTRL-RSQ-BRACKET
          KEY-CTRL-6
          KEY-CTRL-7
          KEY-CTRL-SLASH
          KEY-CTRL-UNDERSCORE
          KEY-CTRL-SPACE
          KEY-CTRL-BACKSPACE2
          KEY-CTRL-8
          KEY-F1
          KEY-F2
          KEY-F3
          KEY-F4
          KEY-F5
          KEY-F6
          KEY-F7
          KEY-F8
          KEY-F9
          KEY-F10
          KEY-F11
          KEY-F12
          KEY-INSERT
          KEY-DELETE
          KEY-HOME
          KEY-END
          KEY-PGUP
          KEY-PGDN
          KEY-ARROW-UP
          KEY-ARROW-DOWN
          KEY-ARROW-LEFT
          KEY-ARROW-RIGHT
          KEY-BACK-TAB
          KEY-MOUSE-LEFT
          KEY-MOUSE-RIGHT
          KEY-MOUSE-MIDDLE
          KEY-MOUSE-RELEASE
          KEY-MOUSE-WHEEL-UP
          KEY-MOUSE-WHEEL-DOWN
          CAP-F1
          CAP-F2
          CAP-F3
          CAP-F4
          CAP-F5
          CAP-F6
          CAP-F7
          CAP-F8
          CAP-F9
          CAP-F10
          CAP-F11
          CAP-F12
          CAP-INSERT
          CAP-DELETE
          CAP-HOME
          CAP-END
          CAP-PGUP
          CAP-PGDN
          CAP-ARROW-UP
          CAP-ARROW-DOWN
          CAP-ARROW-LEFT
          CAP-ARROW-RIGHT
          CAP-BACK-TAB
          CAP--COUNT-KEYS
          CAP-ENTER-CA
          CAP-EXIT-CA
          CAP-SHOW-CURSOR
          CAP-HIDE-CURSOR
          CAP-CLEAR-SCREEN
          CAP-SGR0
          CAP-UNDERLINE
          CAP-BOLD
          CAP-BLINK
          CAP-ITALIC
          CAP-REVERSE
          CAP-ENTER-KEYPAD
          CAP-EXIT-KEYPAD
          CAP-DIM
          CAP-INVISIBLE
          CAP--COUNT

          HARDCAP-ENTER-MOUSE
          HARDCAP-EXIT-MOUSE
          HARDCAP-STRIKEOUT
          HARDCAP-UNDERLINE-2
          HARDCAP-OVERLINE

          DEFAULT
          BLACK
          RED
          GREEN
          YELLOW
          BLUE
          MAGENTA
          CYAN
          WHITE

          BOLD
          UNDERLINE
          REVERSE
          ITALIC
          BLINK
          HI-BLACK
          BRIGHT
          DIM

          TRUECOLOR-BOLD
          TRUECOLOR-UNDERLINE
          TRUECOLOR-REVERSE
          TRUECOLOR-ITALIC
          TRUECOLOR-BLINK
          TRUECOLOR-BLACK

          STRIKEOUT
          UNDERLINE-2
          OVERLINE
          INVISIBLE

          EVENT-KEY
          EVENT-RESIZE
          EVENT-MOUSE

          MOD-ALT
          MOD-CTRL
          MOD-SHIFT
          MOD-MOTION

          INPUT-CURRENT
          INPUT-ESC
          INPUT-ALT
          INPUT-MOUSE

          OUTPUT-CURRENT
          OUTPUT-NORMAL
          OUTPUT-256
          OUTPUT-216
          OUTPUT-GRAYSCALE

          init
          shutdown
          width
          height
          clear
          set-clear-attrs
          present
          invalidate
          set-cursor
          hide-cursor
          set-cell
          set-input-mode
          set-output-mode
          peek-event
          poll-event
          event-type
          event-mod
          event-key
          event-ch
          event-w
          event-h
          event-x
          event-y
          print
          printf
          send
          version
          reset
          deinit)
  (import (scheme base)
          (scheme case-lambda)
          (srfi 160 s8)
          (chicken foreign)
          (only (chicken format) format))
  (begin
    (foreign-declare "#define TB_IMPL")
    (foreign-declare "#include \"termbox2.h\"")

    (define-foreign-type uintattr unsigned-integer64)

    (define OK 0)

    (define ERR -1)

    (define ERR-NEED-MORE -2)
    (define ERR-INIT-ALREADY -3)
    (define ERR-INIT-OPEN -4)
    (define ERR-MEM -5)
    (define ERR-NO-EVENT -6)
    (define ERR-NO-TERM -7)
    (define ERR-NOT-INIT -8)
    (define ERR-OUT-OF-BOUNDS -9)
    (define ERR-READ -10)
    (define ERR-RESIZE-IOCTL -11)
    (define ERR-RESIZE-PIPE -12)
    (define ERR-RESIZE-SIGACTION -13)
    (define ERR-POLL -14)
    (define ERR-TCGETATTR -15)
    (define ERR-TCSETATTR -15)
    (define ERR-UNSUPPORTED-TERM -17)
    (define ERR-RESIZE-WRITE -18)
    (define ERR-RESIZE-POLL -19)
    (define ERR-RESIZE-READ -20)
    (define ERR-RESIZE-SSCANF -21)
    (define ERR-CAP-COLLISION -22)

    (define ERR-SELECT ERR-POLL)
    (define ERR-RESIZE-SELECT ERR-RESIZE-POLL)

    (define KEY-CTRL-TILDE #x00)
    (define KEY-CTRL-2 #x00)
    (define KEY-CTRL-A #x01)
    (define KEY-CTRL-B #x02)
    (define KEY-CTRL-C #x03)
    (define KEY-CTRL-D #x04)
    (define KEY-CTRL-E #x05)
    (define KEY-CTRL-F #x06)
    (define KEY-CTRL-G #x07)
    (define KEY-CTRL-BACKSPACE #x08)
    (define KEY-CTRL-H #x08)
    (define KEY-CTRL-TAB #x09)
    (define KEY-CTRL-I #x09)
    (define KEY-CTRL-J #x0a)
    (define KEY-CTRL-K #x0b)
    (define KEY-CTRL-L #x0c)
    (define KEY-CTRL-ENTER #x0d)
    (define KEY-CTRL-M #x0d)
    (define KEY-CTRL-N #x0e)
    (define KEY-CTRL-O #x0f)
    (define KEY-CTRL-P #x10)
    (define KEY-CTRL-Q #x11)
    (define KEY-CTRL-R #x12)
    (define KEY-CTRL-S #x13)
    (define KEY-CTRL-T #x14)
    (define KEY-CTRL-U #x15)
    (define KEY-CTRL-V #x16)
    (define KEY-CTRL-W #x17)
    (define KEY-CTRL-X #x18)
    (define KEY-CTRL-Y #x19)
    (define KEY-CTRL-Z #x1a)
    (define KEY-ESC #x1b)
    (define KEY-CTRL-LSQ-BRACKET #x1b)
    (define KEY-CTRL-3 #x1b)
    (define KEY-CTRL-4 #x1c)
    (define KEY-CTRL-BACKSLASH #x1c)
    (define KEY-CTRL-5 #x1d)
    (define KEY-CTRL-RSQ-BRACKET #x1d)
    (define KEY-CTRL-6 #x1e)
    (define KEY-CTRL-7 #x1f)
    (define KEY-CTRL-SLASH #x1f)
    (define KEY-CTRL-UNDERSCORE #x1f)
    (define KEY-CTRL-SPACE #x20)
    (define KEY-CTRL-BACKSPACE2 #x7f)
    (define KEY-CTRL-8 #x7f)

    (define (key-i i)
      (- #xffff i))

    (define KEY-F1               (key-i 0))
    (define KEY-F2               (key-i 1))
    (define KEY-F3               (key-i 2))
    (define KEY-F4               (key-i 3))
    (define KEY-F5               (key-i 4))
    (define KEY-F6               (key-i 5))
    (define KEY-F7               (key-i 6))
    (define KEY-F8               (key-i 7))
    (define KEY-F9               (key-i 8))
    (define KEY-F10              (key-i 9))
    (define KEY-F11              (key-i 10))
    (define KEY-F12              (key-i 11))
    (define KEY-INSERT           (key-i 12))
    (define KEY-DELETE           (key-i 13))
    (define KEY-HOME             (key-i 14))
    (define KEY-END              (key-i 15))
    (define KEY-PGUP             (key-i 16))
    (define KEY-PGDN             (key-i 17))
    (define KEY-ARROW-UP         (key-i 18))
    (define KEY-ARROW-DOWN       (key-i 19))
    (define KEY-ARROW-LEFT       (key-i 20))
    (define KEY-ARROW-RIGHT      (key-i 21))
    (define KEY-BACK-TAB         (key-i 22))
    (define KEY-MOUSE-LEFT       (key-i 23))
    (define KEY-MOUSE-RIGHT      (key-i 24))
    (define KEY-MOUSE-MIDDLE     (key-i 25))
    (define KEY-MOUSE-RELEASE    (key-i 26))
    (define KEY-MOUSE-WHEEL-UP   (key-i 27))
    (define KEY-MOUSE-WHEEL-DOWN (key-i 28))
    (define CAP-F1               0)
    (define CAP-F2               1)
    (define CAP-F3               2)
    (define CAP-F4               3)
    (define CAP-F5               4)
    (define CAP-F6               5)
    (define CAP-F7               6)
    (define CAP-F8               7)
    (define CAP-F9               8)
    (define CAP-F10              9)
    (define CAP-F11              10)
    (define CAP-F12              11)
    (define CAP-INSERT           12)
    (define CAP-DELETE           13)
    (define CAP-HOME             14)
    (define CAP-END              15)
    (define CAP-PGUP             16)
    (define CAP-PGDN             17)
    (define CAP-ARROW-UP         18)
    (define CAP-ARROW-DOWN       19)
    (define CAP-ARROW-LEFT       20)
    (define CAP-ARROW-RIGHT      21)
    (define CAP-BACK-TAB         22)
    (define CAP--COUNT-KEYS      23)
    (define CAP-ENTER-CA         23)
    (define CAP-EXIT-CA          24)
    (define CAP-SHOW-CURSOR      25)
    (define CAP-HIDE-CURSOR      26)
    (define CAP-CLEAR-SCREEN     27)
    (define CAP-SGR0             28)
    (define CAP-UNDERLINE        29)
    (define CAP-BOLD             30)
    (define CAP-BLINK            31)
    (define CAP-ITALIC           32)
    (define CAP-REVERSE          33)
    (define CAP-ENTER-KEYPAD     34)
    (define CAP-EXIT-KEYPAD      35)
    (define CAP-DIM              36)
    (define CAP-INVISIBLE        37)
    (define CAP--COUNT           38)

    (define HARDCAP-ENTER-MOUSE  "\x1b[?1000h\x1b[?1002h\x1b[?1015h\x1b[?1006h")
    (define HARDCAP-EXIT-MOUSE   "\x1b[?1006l\x1b[?1015l\x1b[?1002l\x1b[?1000l")
    (define HARDCAP-STRIKEOUT    "\x1b[9m")
    (define HARDCAP-UNDERLINE-2  "\x1b[21m")
    (define HARDCAP-OVERLINE     "\x1b[53m")

    (define DEFAULT              #x0000)
    (define BLACK                #x0001)
    (define RED                  #x0002)
    (define GREEN                #x0003)
    (define YELLOW               #x0004)
    (define BLUE                 #x0005)
    (define MAGENTA              #x0006)
    (define CYAN                 #x0007)
    (define WHITE                #x0008)

    (define BOLD                #x01000000)
    (define UNDERLINE           #x02000000)
    (define REVERSE             #x04000000)
    (define ITALIC              #x08000000)
    (define BLINK               #x10000000)
    (define HI-BLACK            #x20000000)
    (define BRIGHT              #x40000000)
    (define DIM                 #x80000000)

    (define TRUECOLOR-BOLD      BOLD)
    (define TRUECOLOR-UNDERLINE UNDERLINE)
    (define TRUECOLOR-REVERSE   REVERSE)
    (define TRUECOLOR-ITALIC    ITALIC)
    (define TRUECOLOR-BLINK     BLINK)
    (define TRUECOLOR-BLACK     HI-BLACK)

    (define STRIKEOUT   #x0000000100000000)
    (define UNDERLINE-2 #x0000000200000000)
    (define OVERLINE    #x0000000400000000)
    (define INVISIBLE   #x0000000800000000)

    (define EVENT-KEY        1)
    (define EVENT-RESIZE     2)
    (define EVENT-MOUSE      3)

    (define MOD-ALT          1)
    (define MOD-CTRL         2)
    (define MOD-SHIFT        4)
    (define MOD-MOTION       8)

    (define INPUT-CURRENT    0)
    (define INPUT-ESC        1)
    (define INPUT-ALT        2)
    (define INPUT-MOUSE      4)

    (define OUTPUT-CURRENT   0)
    (define OUTPUT-NORMAL    1)
    (define OUTPUT-256       2)
    (define OUTPUT-216       3)
    (define OUTPUT-GRAYSCALE 4)

    (define %init
      (foreign-lambda int tb_init))

    (define %init-file
      (foreign-lambda int tb_init_file (const c-string)))

    (define init
      (case-lambda
       (() (%init))
       ((file) (%init-file file))))

    (define shutdown
      (foreign-lambda int tb_shutdown))

    (define width
      (foreign-lambda int tb_width))

    (define height
      (foreign-lambda int tb_height))

    (define clear
      (foreign-lambda int tb_clear))

    (define set-clear-attrs
      (foreign-lambda int tb_set_clear_attrs uintattr uintattr))

    (define present
      (foreign-lambda int tb_present))

    (define invalidate
      (foreign-lambda int tb_invalidate))

    (define set-cursor
      (foreign-lambda int tb_set_cursor int int))

    (define hide-cursor
      (foreign-lambda int tb_hide_cursor))

    (define set-cell
      (foreign-lambda int tb_set_cell int int unsigned-int32 uintattr uintattr))

    (define set-input-mode
      (foreign-lambda int tb_set_input_mode int))

    (define set-output-mode
      (foreign-lambda int tb_set_output_mode int))

    (define peek-event
      (foreign-primitive scheme-object ((int timeout))
                         "
struct tb_event e;
int error = tb_peek_event(&e, timeout);
if(TB_OK != error) C_return(C_SCHEME_FALSE);

C_word* space = C_alloc(C_SIZEOF_VECTOR(8));
C_word vector = C_vector(
    &space,
    8,
    C_fix(e.type),
    C_fix(e.mod),
    C_fix(e.key),
    C_make_character(e.ch),
    C_fix(e.w),
    C_fix(e.h),
    C_fix(e.x),
    C_fix(e.y)
);
C_return(vector);
    "))

    (define poll-event
      (foreign-primitive scheme-object ()
                         "
struct tb_event e;
int error = tb_poll_event(&e);
if(TB_OK != error) C_return(C_SCHEME_FALSE);

C_word* space = C_alloc(C_SIZEOF_VECTOR(8));
C_word vector = C_vector(
    &space,
    8,
    C_fix(e.type),
    C_fix(e.mod),
    C_fix(e.key),
    C_make_character(e.ch),
    C_fix(e.w),
    C_fix(e.h),
    C_fix(e.x),
    C_fix(e.y)
);
C_return(vector);
    "))

    (define (event-type e)
      (vector-ref e 0))

    (define (event-mod e)
      (vector-ref e 1))

    (define (event-key e)
      (vector-ref e 2))

    (define (event-ch e)
      (vector-ref e 3))

    (define (event-w e)
      (vector-ref e 4))

    (define (event-h e)
      (vector-ref e 5))

    (define (event-x e)
      (vector-ref e 6))

    (define (event-y e)
      (vector-ref e 7))

    (define print
      (foreign-lambda int tb_print int int uintattr uintattr (const c-string)))

    (define (printf x y fg bg fmt . objs)
      (print x y fg bg (apply format #f fmt objs)))

    (define %send
      (foreign-lambda int tb_send s8vector size_t))

    (define (send v)
      (%send v (s8vector-length v)))

    (define version
      (foreign-lambda c-string tb_version))

    (define reset
      (foreign-lambda int tb_reset))

    (define deinit
      (foreign-lambda int tb_deinit))))
