procédure AfficheIconesDoc()
// Vider d'abord toutes les icônes de la ligne en cours
TABLE_Prod_TL21.COL_Doc1 = ""
TABLE_Prod_TL21.COL_Doc2 = ""
TABLE_Prod_TL21.COL_Doc3 = ""
TABLE_Prod_TL21.COL_Doc4 = ""
TABLE_Prod_TL21.COL_Doc5 = ""
si TABLE_Prod_TL21.COL_Doc <> "" alors
comptedoc est un entier = 0
pour toute chaîne LigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
comptedoc++
selon comptedoc
cas 1 : si LigneDoc <> "" alors TABLE_Prod_TL21.COL_Doc1 = IMG_Doc
cas 2 : si LigneDoc <> "" alors TABLE_Prod_TL21.COL_Doc2 = IMG_Doc
cas 3 : si LigneDoc <> "" alors TABLE_Prod_TL21.COL_Doc3 = IMG_Doc
cas 4 : si LigneDoc <> "" alors TABLE_Prod_TL21.COL_Doc4 = IMG_Doc
cas 5 : si LigneDoc <> "" alors TABLE_Prod_TL21.COL_Doc5 = IMG_Doc
fin
si comptedoc >= 5 alors sortir
fin
fin
Procédure locale BackupProd
// Procédure automatique :
// La procédure est exécutée automatiquement, après le code d'initialisation de la fenêtre, avec un
différé de 5 minutes
// Elle sera répétée en boucle, en attendant 1 heure entre chaque appel
// Chaque appel suivant déclenche un nouveau timer
//

