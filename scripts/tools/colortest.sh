#!/usr/bin/env bash
# Lagoon Colors — Compact Color Showcase
# Usage: bash scripts/tools/colortest.sh

printf "\n  \033[1m🌊 Lagoon Colors\033[0m\n\n"

# ANSI-16 palette blocks (more reliable in JetBrains terminal than 48;5;N)
printf "  "
for i in 40 41 42 43 44 45 46 47; do printf "\033[${i}m    \033[0m"; done
printf "\n  "
for i in 100 101 102 103 104 105 106 107; do printf "\033[${i}m    \033[0m"; done
printf "\n\n"

# Foreground ANSI check
printf "  "
for i in 30 31 32 33 34 35 36 37; do printf "\033[${i}m██\033[0m "; done
printf "\n  "
for i in 90 91 92 93 94 95 96 97; do printf "\033[${i}m██\033[0m "; done
printf "\n\n"

# Syntax preview
printf "  \033[90m// Perceptually uniform terminal colors via ANSI-16\033[0m\n"
printf "  \033[35mimport\033[0m { \033[34mcreateServer\033[0m } \033[35mfrom\033[0m \033[36m'node:http'\033[0m;\n\n"
printf "  \033[35mconst\033[0m \033[33mConfig\033[0m = { port: \033[95m3000\033[0m, host: \033[36m'localhost'\033[0m };\n\n"
printf "  \033[35masync function\033[0m \033[34mstart\033[0m() {\n"
printf "    \033[31mtry\033[0m { \033[35mawait\033[0m \033[34mconnect\033[0m(\033[33mConfig\033[0m.host); }\n"
printf "    \033[31mcatch\033[0m (e) { \033[34mconsole\033[0m.\033[31merror\033[0m(\033[36m'Failed'\033[0m, e); }\n"
printf "  }\n\n"

printf "  \033[32m➜\033[0m main \033[36m⟫\033[0m git status        \033[92m✓ 24 tests passed\033[0m\n"
printf "    \033[32m new:  server.ts\033[0m          \033[93m⚠ Missing 'timeout'\033[0m\n"
printf "    \033[33m mod:  package.json\033[0m       \033[91m✗ Port 5432 refused\033[0m\n"
printf "    \033[31m del:  old-config.yml\033[0m     \033[94mℹ Using fallback DB\033[0m\n\n"
