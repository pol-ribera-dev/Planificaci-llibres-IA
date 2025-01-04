;;prova generada amb generador.py
;;Semilla utilizada: 1704580999
;;Introdueix el nombre de llibres total: 10
;;Introdueix la fracció D. La probabilitat de generar propietats serà 1/D a cada oportunitat. D > 1: 10

(define (problem planifiacació)
  (:domain llibres_en_la_planificació)
  (:objects
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 - llibre
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 - mes
  )

  (:init
    (= (paginasl l1) 349)
    (= (paginasl l2) 267)
    (= (paginasl l3) 138)
    (= (paginasl l4) 493)
    (= (paginasl l5) 489)
    (= (paginasl l6) 461)
    (= (paginasl l7) 378)
    (= (paginasl l8) 111)
    (= (paginasl l9) 800)
    (= (paginasl l10) 560)

    (= (paginas m0) 800)
    (= (paginas m1) 0)
    (= (paginas m2) 0)
    (= (paginas m3) 0)
    (= (paginas m4) 0)
    (= (paginas m5) 0)
    (= (paginas m6) 0)
    (= (paginas m7) 0)
    (= (paginas m8) 0)
    (= (paginas m9) 0)
    (= (paginas m10) 0)
    (= (paginas m11) 0)
    (= (paginas m12) 0)

    (es_predecesor_de l1 l2)
    (es_predecesor_de l2 l4)
    (es_predecesor_de l2 l8)
    (es_predecesor_de l3 l7)
    (es_predecesor_de l4 l5)
    (es_predecesor_de l5 l9)
    (es_predecesor_de l5 l10)
    (es_predecesor_de l6 l7)
    (es_predecesor_de l7 l9)

    (vol_llegir l7)
    (vol_llegir l8)
    (vol_llegir l9)
    (vol_llegir l10)
    (vol_llegir l4)
    (vol_llegir l1)
    (vol_llegir l5)
    (vol_llegir l2)

    (llegit l3 m0)
    (llegit l6 m0)


    (es_anterior m0 m1)
    (es_anterior m0 m2)
    (es_anterior m0 m3)
    (es_anterior m0 m4)
    (es_anterior m0 m5)
    (es_anterior m0 m6)
    (es_anterior m0 m7)
    (es_anterior m0 m8)
    (es_anterior m0 m9)
    (es_anterior m0 m10)
    (es_anterior m0 m11)
    (es_anterior m0 m12)

    (permet_paralel m0 m0)
    (permet_paralel m0 m1)

    (es_anterior m1 m2)
    (es_anterior m1 m3)
    (es_anterior m1 m4)
    (es_anterior m1 m5)
    (es_anterior m1 m6)
    (es_anterior m1 m7)
    (es_anterior m1 m8)
    (es_anterior m1 m9)
    (es_anterior m1 m10)
    (es_anterior m1 m11)
    (es_anterior m1 m12)

    (permet_paralel m1 m0)
    (permet_paralel m1 m1)
    (permet_paralel m1 m2)

    (es_anterior m2 m3)
    (es_anterior m2 m4)
    (es_anterior m2 m5)
    (es_anterior m2 m6)
    (es_anterior m2 m7)
    (es_anterior m2 m8)
    (es_anterior m2 m9)
    (es_anterior m2 m10)
    (es_anterior m2 m11)
    (es_anterior m2 m12)

    (permet_paralel m2 m1)
    (permet_paralel m2 m2)
    (permet_paralel m2 m3)

    (es_anterior m3 m4)
    (es_anterior m3 m5)
    (es_anterior m3 m6)
    (es_anterior m3 m7)
    (es_anterior m3 m8)
    (es_anterior m3 m9)
    (es_anterior m3 m10)
    (es_anterior m3 m11)
    (es_anterior m3 m12)

    (permet_paralel m3 m2)
    (permet_paralel m3 m3)
    (permet_paralel m3 m4)

    (es_anterior m4 m5)
    (es_anterior m4 m6)
    (es_anterior m4 m7)
    (es_anterior m4 m8)
    (es_anterior m4 m9)
    (es_anterior m4 m10)
    (es_anterior m4 m11)
    (es_anterior m4 m12)

    (permet_paralel m4 m3)
    (permet_paralel m4 m4)
    (permet_paralel m4 m5)

    (es_anterior m5 m6)
    (es_anterior m5 m7)
    (es_anterior m5 m8)
    (es_anterior m5 m9)
    (es_anterior m5 m10)
    (es_anterior m5 m11)
    (es_anterior m5 m12)

    (permet_paralel m5 m4)
    (permet_paralel m5 m5)
    (permet_paralel m5 m6)

    (es_anterior m6 m7)
    (es_anterior m6 m8)
    (es_anterior m6 m9)
    (es_anterior m6 m10)
    (es_anterior m6 m11)
    (es_anterior m6 m12)

    (permet_paralel m6 m5)
    (permet_paralel m6 m6)
    (permet_paralel m6 m7)

    (es_anterior m7 m8)
    (es_anterior m7 m9)
    (es_anterior m7 m10)
    (es_anterior m7 m11)
    (es_anterior m7 m12)

    (permet_paralel m7 m6)
    (permet_paralel m7 m7)
    (permet_paralel m7 m8)

    (es_anterior m8 m9)
    (es_anterior m8 m10)
    (es_anterior m8 m11)
    (es_anterior m8 m12)

    (permet_paralel m8 m7)
    (permet_paralel m8 m8)
    (permet_paralel m8 m9)

    (es_anterior m9 m10)
    (es_anterior m9 m11)
    (es_anterior m9 m12)

    (permet_paralel m9 m8)
    (permet_paralel m9 m9)
    (permet_paralel m9 m10)

    (es_anterior m10 m11)
    (es_anterior m10 m12)

    (permet_paralel m10 m9)
    (permet_paralel m10 m10)
    (permet_paralel m10 m11)

    (es_anterior m11 m12)

    (permet_paralel m11 m10)
    (permet_paralel m11 m11)
    (permet_paralel m11 m12)


    (permet_paralel m12 m11)
    (permet_paralel m12 m12)

  )
  (:goal
    (forall (?l - llibre) (not (vol_llegir ?l)))
  )
)
