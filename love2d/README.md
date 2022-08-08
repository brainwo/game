# LÖVE

## Setup

#### Instal the LÖVE binary:

Official site : https://love2d.org/ \
Arch Linux : `pacman -S love`\
Homebrew : `brew install --cask love`\
Chocolatey : `choco install love`

#### Setup the Lua environment:

##### lua-language-server

Main repo: https://github.com/sumneko/lua-language-server

Neovim (coc): Install `coc-lua`: `CocInstall coc-lua`\
VSCode: Install sumneko's Lua extension

Setup up the `.luarc.json` on the root of your git folder:

```json
{
  "$schema": "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
  "Lua.runtime.version": "LuaJIT",
  "Lua.workspace.checkThirdParty": false,
  "Lua.workspace.library": ["${3rd}/love2d/library"]
}
```

#### HTML5 build using `love.js`:

Prerequirements:\
\- Node Package Manager `npm`\
\- Any program to zip your folder (e.g. `zip`)\
\- Any HTTP server (e.g. `basic-http-server`)

1. Install `love.js` globally:

```
npm -g i love.js
```

2. Compress your source code into a .zip file ended with .love extension:

```
zip -r game.love .
```

3. Build your .love file into HTML5 game using `love.js`:

```
love.js game.love game
```

4. Finally run the web build using a HTTP server:

```
basic-http-server game
```

## Community

Forum: https://love2d.org/forums/ \
Discord: https://discord.gg/rhUets9 \
IRC: [#love@irc.oftc.net](https://webchat.oftc.net/?channels=love) \
Twitter: [@obey_love](https://twitter.com/obey_love)
