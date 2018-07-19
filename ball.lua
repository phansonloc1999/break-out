Ball = Class {}

math.randomseed(os.time())

local dxSpeed = 100
local dySpeed = 100

function Ball:init()
    self.m_width = 10
    self.m_height = 10
    self.m_x = WINDOW_WIDTH / 2 - self.m_width / 2
    self.m_y = WINDOW_HEIGHT / 2 - self.m_height / 2

    self.m_direction = math.random(1, 2)
end

function Ball:render()
    love.graphics.rectangle("fill", self.m_x, self.m_y, self.m_width, self.m_height)
end

function Ball:update(dt)
    if (self.m_direction == 1) then
        self.m_x = self.m_x - dxSpeed * dt
    elseif (self.m_direction == 2) then
        self.m_x = self.m_x + dxSpeed * dt
    end

    -- bounces back when touches players
    if
        (checkCollision(
            self.m_x,
            self.m_y,
            self.m_width,
            self.m_height,
            player.m_x,
            player.m_y,
            player.m_width,
            player.m_height
        ))
     then
        self.m_direction = 2
        hit:play()
    elseif (checkCollision(self.m_x, self.m_y, self.m_width, self.m_height, bot.m_x, bot.m_y, bot.m_width, bot.m_height)) then
        self.m_direction = 1
        hit:play()
    end

    -- bounces back when touches top and bottom
    if (self.m_y <= 0) or (self.m_y >= WINDOW_HEIGHT - self.m_height) then
        dySpeed = dySpeed * (-1)
        hit:play()
    end

    -- update y position
    self.m_y = self.m_y + dySpeed * dt

    if (self.m_x - self.m_width < 0) then
        bot.m_score = bot.m_score + 1
        self.m_x, self.m_y = WINDOW_WIDTH / 2 - self.m_width / 2, WINDOW_HEIGHT / 2 - self.m_height / 2
        self.m_direction = math.random(1, 2)
    elseif (self.m_x > WINDOW_WIDTH) then
        player.m_score = player.m_score + 1
        self.m_x, self.m_y = WINDOW_WIDTH / 2 - self.m_width / 2, WINDOW_HEIGHT / 2 - self.m_height / 2
        self.m_direction = math.random(1, 2)
    end
end
