
(define (domain llibres_en_la_planificació)
  (:requirements :strips :typing :adl :fluents)
  (:types llibre - object mes - object)

  (:predicates
   (llegit ?l - llibre ?m - mes)
   (es_predecesor_de ?x - llibre ?y - llibre)
   (vol_llegir ?l - llibre)
   (es_anterior ?v - mes ?b - mes)
   (son_paralels ?l - llibre ?p - llibre)
   (sha_de_llegir ?l - llibre ?m - mes)
   (permet_paralel ?m - mes ?n - mes)
   )
   (:functions
        (paginasl ?l - llibre)
        (paginas ?m - mes)
    )
  (:action llegir
    :parameters (?l - llibre ?m - mes)

    :precondition (and
    (forall(?p - llibre) (imply (es_predecesor_de ?p ?l) (exists (?n - mes) (and (llegit ?p ?n) (es_anterior ?n ?m)))))    
    (forall (?n - mes) (imply (sha_de_llegir ?l ?n) (permet_paralel ?n ?m)))
    (forall (?n - mes) (not(llegit ?l ?n))) 
    (<= (+ (paginas ?m) (paginasl ?l)) 800) 
    )

    :effect (and 
    (llegit ?l ?m) 
    (not (vol_llegir ?l)) 
    (forall(?p - llibre) (when (or (son_paralels ?p ?l) (son_paralels ?l ?p)) (and(sha_de_llegir ?p ?m) (vol_llegir ?p) (not(son_paralels ?p ?l)) (not(son_paralels ?l ?p))))) 
    (increase (paginas ?m) (paginasl ?l))
    )
    )
 )
