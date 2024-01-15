(import (scheme base)
        (scheme write)
        (scheme read)
        (chicken foreign)
        (prefix (termbox2) tb:))

(define (with-resource init thunk clean)
  ;;++ Yuck!
  ;; http://wiki.call-cc.org/man/5/Module%20(chicken%20condition)#with-exception-handler
  ((call/cc
    (lambda (k)
      (with-exception-handler
       (lambda (exception)
         (k (lambda () (raise exception))))
       (lambda ()
         (dynamic-wind
             init
             (lambda ()
               (let ((output (thunk)))
                 (lambda () output)))
             clean)))))))

(define-record-type <position>
  (make-position x y)
  position?
  (x position-x)
  (y position-y))

(define (key-pressed? event c)
  (and event
       (or (equal? c (tb:event-ch event))
           (equal? c (tb:event-key event)))))

(define (bool->int b)
  (if b 1 0))

(define (update-position position event)
  (define up    (bool->int (key-pressed? event tb:KEY-ARROW-UP)))
  (define down  (bool->int (key-pressed? event tb:KEY-ARROW-DOWN)))
  (define left  (bool->int (key-pressed? event tb:KEY-ARROW-LEFT)))
  (define right (bool->int (key-pressed? event tb:KEY-ARROW-RIGHT)))
  (make-position (+ (position-x position)
                    right
                    (- left))
                 (+ (position-y position)
                    down
                    (- up))))


(define (game position event)
  (tb:clear)

  (tb:printf 0 0 tb:DEFAULT tb:RED "Hello, Roguelike!")
  (tb:printf (position-x position)
             (position-y position)
             tb:DEFAULT
             tb:RED
             "~A"
             #\@)

  (tb:present)
  (unless (key-pressed? event #\q)
    (game (update-position position event)
          (tb:peek-event 10))))

(define (main)
  (game (make-position 30 30) (tb:peek-event 10)))

(with-resource tb:init main tb:shutdown)
