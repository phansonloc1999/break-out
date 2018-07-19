Player = Class {}

local speed = 150

function Player:init()
    self.m_width = 10
    self.m_height = 40
    self.m_x = 50
    self.m_y = love.graphics.getHeight() / 2 - self.m_height / 2
    self.m_score = 0
end

function Player:render()
    love.graphics.rectangle("fill", self.m_x, self.m_y, self.m_width, self.m_height)
    love.graphics.print("Score: "..self.m_score, 0, 0)
end

function Player:update(dt)
    if (love.keyboard.isDown("up")) then
        self.m_y = math.max(0, self.m_y - speed * dt)
    elseif (love.keyboard.isDown("down")) then
        self.m_y = math.min(self.m_y + speed * dt, WINDOW_HEIGHT - self.m_height)
    end
end
