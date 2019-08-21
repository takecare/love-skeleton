Player = Class{}

function Player:init(x, y)
    self.sprite = love.graphics.newImage("assets/player.png")
    
    self.x = x ~= nil and x or 25
    self.y = y ~= nil and y or 25
    self.width = 8
    self.height = 8


end

function Player:update(dt)
    -- ...
end

function Player:render()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width, self.height)
end

function Player:handleInput()
    if love.keyboard.isDown("w") then
        -- ...
    elseif love.keyboard.isDown("s") then
        -- ...
    else
        -- ...
    end

    if love.mouse.isDown(1) then
        -- ...
    end
end