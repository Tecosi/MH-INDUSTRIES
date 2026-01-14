procédure Socket_RechargerEnregistrement(nIDEnreg est un entier)
LogSocket("[RECHARGE] 🔄Demande de rechargement ID=" + nIDEnreg)
LogSocket("[RECHARGE] 🧵Thread actuel : " + ThreadCourant())
gnIDEnregARecharger = nIDEnreg
ExécuteThreadPrincipal(Socket_RechargerEnregistrement_ThreadPrincipal)
LogSocket("[RECHARGE] ✅
Demande envoyée au thread principal"
)
Procédure globale Socket_RechargerEnregistrement_ThreadPrincipal

