procédure réactive Cherche_doc3()
si Taille(SAI_Piece) > 2 alors
HExécuteRequête(REQ_Documents3,hRequêteDéfaut,SAI_Piece)
TableSupprimeTout(TABLE_Doc)
pour tout REQ_Documents3
si HNbEnr (REQ_Documents3) > 0 alors
TableAjouteLigne(TABLE_Doc,REQ_Documents3.DESIGN,REQ_Documents3.NomFichier,REQ_Documents3.
GPCLEUNIK)
fin
fin
fin
Procédure locale EnregistrerLigneModifiee

