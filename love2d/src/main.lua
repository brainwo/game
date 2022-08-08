local keyboard = love.keyboard
local graphics = love.graphics
local player_size = 100

Player = { x = 0, y = 0 }

function Player:New(o, x, y)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = x or 0
    self.y = y or 0
    return o
end

function Player:draw()
    graphics.setColor(0, 0.2, 0.2)
    graphics.rectangle("fill", 0, 0, player_size, player_size)
end

function love.load()
    X, Y, W, H = 20, 20, 60, 20
    P = Player:New(nil, 10, 10)
end

function love.update(dt)
    --X = 200 + math.sin(love.timer.getTime() * math.pi / 2) * 100
    --Y = 200 + math.cos(love.timer.getTime() * math.pi / 2) * 100
    if keyboard.isDown("k") then
	Y = Y - 1
    elseif keyboard.isDown("l") then
	X = X + 1
    elseif keyboard.isDown("h") then
	X = X - 1
    elseif keyboard.isDown("j") then
	Y = Y + 1
    end
end

function love.draw()
    P.draw()
    graphics.setColor(0, 0.4, 0.4)
    graphics.rectangle("fill", X, Y, W, H)
end

