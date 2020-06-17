#lang racket

; Aufgabe 6

; 1.
     ; 1.
     ; Erstelle ein Pair mit dem Tail der Liste (1 2 3)
     ; und dem ersten Element der Liste (1 2)
     ; --> '((2 3) . 1)
     (cons (cdr (quote (1 2 3))) (car (quote (1 2))))


     ; 2.
     ; Mappe pro Listenelement eine 0, wenn x positiv ist
     ; --> '(0 0 -1 0 0)
     (map (lambda (x) (if (positive? x) 0 x)) (quote (1 0 -1 0 1)))
     

     ; 3.
     ; compose: last proc first and first proc last
     ; compose1: first proc first and last proc last 
     ; Filter alle negativen Zahlen aus der Liste
     ; --> '(1 0 0 1)
     (filter (compose not negative?) (quote (1 0 -1 0 1)))


     ; 4.
     ; Multipliziere jede Zahl der Liste mit 2 und bilde dann
     ; elementweise die absolute Zahl der Zahl (Entferne Vorzeichen)
     ; --> '(2 0 2 0 2) 
     (map (compose abs (curry * 2)) (quote (1 0 -1 0 1)))

; 2.
; Eine Closure ist z.B. ((curry * 2) 2)
; Sie sorgt für semantische Freiheiten hinsichtlich der Umgebung
; und bildet eine wichtige Basis für objektorientierte Konzepte.
; Im obigen Beispiel findet ohne expliziten Aufruf einer vom Nutzer
; definierten Funktion tatsächlich Bindung statt und ein Resultat
; kann ausgegeben werden (4)


; 3.
; Die Funktion berechnet linearrekursiv die Summe der Liste

; 4.
; Siehe gprotKlausur.pl

; 5.
; Blabla

