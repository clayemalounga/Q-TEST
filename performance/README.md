# k6 Load Test

Ce document explique comment installer k6 et lancer le test de charge contenu dans `loadTest.js`.

Pré-requis
- Node.js non requis pour k6. k6 est un binaire indépendant.
- Votre application doit être accessible depuis la machine qui lance k6. Par défaut: http://localhost:9090

Installation (Windows - Chocolatey)
1. Ouvrez PowerShell en administrateur.
2. Installez Chocolatey si vous ne l'avez pas: https://chocolatey.org/install
3. Installez k6:

```powershell
choco install k6
```

Installation (macOS - Homebrew)

```bash
brew install k6
```

Installation (Linux - Debian/Ubuntu)

```bash
sudo apt install -y gnupg2 ca-certificates curl
curl -s https://dl.k6.io/key.gpg | sudo apt-key add -
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt update
sudo apt install k6
```

Exécution du test localement

```bash
# Lancer le test contre http://localhost:9090
cd performance
k6 run loadTest.js
```

Passer une URL différente (par ex. si vous testez une IP de cluster) :

```bash
BASE_URL=http://10.0.2.15:30080 k6 run loadTest.js
# Sur Windows PowerShell:
$env:BASE_URL = 'http://10.0.2.15:30080'; k6 run loadTest.js
```

Conseils pour tester un déploiement Docker Desktop / Kubernetes
- Assurez-vous que le service est exposé sur un port accessible depuis l'hôte (vous avez indiqué `9090:80`).
- Lancez k6 depuis votre machine hôte en pointant sur `http://localhost:9090`.

Analyse des résultats
- k6 affichera un résumé en fin de test (moyenne, p95, erreurs).
- Pour exécutions avancées, utilisez `k6 run --out influxdb=...` pour exporter les métriques.

Fichier de test
- Le test d'exemple est `loadTest.js` et effectue des GET sur `/`.

Si vous voulez, je peux ajouter un script `package.json` pour lancer k6 via `npm run test:load` ou créer un job Kubernetes pour exécuter k6 depuis un pod. Dites-moi ce que vous préférez.
