#!/bin/bash

# Variables
VERSION="2.325.0"
ARCHIVO="actions-runner-linux-x64-${VERSION}.tar.gz"
URL="https://github.com/actions/runner/releases/download/v${VERSION}/${ARCHIVO}"
CHECKSUM="5020da7139d85c776059f351e0de8fdec753affc9c558e892472d43ebeb518f4"
REPO_URL="https://github.com/Dfauben/CI-CD-Simulacion-PHP"
TOKEN="BGNQAW65E6Y35EYE3QMSUXDIIQZWO"

# Crear carpeta runner
mkdir -p ~/actions-runner && cd ~/actions-runner

# Descargar el runner
echo "📥 Descargando runner de GitHub..."
curl -o $ARCHIVO -L $URL

# Verificar el checksum
echo "🔐 Verificando integridad del archivo..."
echo "$CHECKSUM  $ARCHIVO" | shasum -a 256 -c

# Extraer el archivo
echo "📦 Extrayendo runner..."
tar xzf ./$ARCHIVO

# Configurar el runner
echo "⚙️  Configurando el runner..."
./config.sh --url $REPO_URL --token $TOKEN

echo "✅ Runner instalado y configurado."
