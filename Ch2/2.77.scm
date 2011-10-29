; (magnitude z)
; = (apply-generic 'magnitude z)
; the first tag of z is '(complex)
; so it call (get 'magnitude '(complex))
; after fixed
; it call (magnitude '(rectangular 3 . 4))
; = (apply-generic 'magnitude '(rectangular 3 . 4))
; so call (get 'magnitude 'rectangular)
; so get the correct function.
