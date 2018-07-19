AI = Class{}

local speed = 150

function AI:init()
    self.m_width = player.m_width
    self.m_height = player.m_height
    self.m_x = WINDOW_WIDTH - player.m_x
    self.m_y = player.m_y
    self.m_score = 0
end

function AI:render()
    love.graphics.rectangle("fill", self.m_x, self.m_y, self.m_width, self.m_height)
    love.graphics.print("Score: "..self.m_score, WINDOW_WIDTH - 55, 0)
end

function AI:update(dt)
    if (ball.m_direction == 2) then
        if (self.m_y > ball.m_y + ball.m_height) then
            self.m_y = math.max(0, self.m_y - speed * dt)
        elseif (self.m_y + self.m_height < ball.m_y) then
            self.m_y = math.min(self.m_y + speed * dt, WINDOW_HEIGHT - self.m_height)
        end
    end
end
