Class = require("./lib/class")

require("constants")
require("collision")
require("player")
require("AI")
require("ball")

function love.load()
    player = Player()
    player:init()

    ball = Ball()
    ball:init()

    bot = AI()
    bot:init()
end

function love.draw()
    player:render()
    ball:render()
    bot:render()
end

function love.update(dt)
    if (dt <= 1) then -- Prevent delta time delay when game window isnt focused or initializing 
        player:update(dt)
        ball:update(dt)
        bot:update(dt)
    end
end
