#!/bin/sh

# Zip the whole source into a .love file
cd src &&
zip -r ../game.love main.lua &&
# Build a HTML version using love.js
cd .. &&
love.js -t "game" game.love output -c &&
mv -f output/love.wasm output/love.js output/game.data output/game.js www/
