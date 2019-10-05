local Object = require('src/Object')
local Player = Class{__includes = Object}

local QUAD_KEY = 'player'

function Player:init(x, y)
    self.x = x ~= nil and x or VIRTUAL_WIDTH / 2 - PADDLE_X_OFFSET
    self.y = y ~= nil and y or VIRTUAL_HEIGHT - PADDLE_Y_OFFSET
    self.dx = 0
end

function Player:handleInput()
    if love.keyboard.isDown('left') then
        -- TODO
    elseif love.keyboard.isDown('right') then
        -- TODO
    else
        self.dx = 0
    end
end

function Player:keyPressed(key)
    if key == 'space' then
        -- TODO
    end
end

function Player:update(dt)
    self:handleInput()
    -- TODO
end

function Player:render()
    love.graphics.draw(gTextures['breakout'], self:sprite(), self.x, self.y)
end

function Player:quad()
    local quadIndex = 1 -- TODO
    return gSprites[QUAD_KEY][quadIndex]
end

function Player:sprite()
    return self:quad().sprite
end

function Player:boundingBox()
    local quad = self:quad()
    return {
        x = self.x,
        y = self.y,
        width = quad.width,
        height = quad.height
    }
end

function Player:collidesWith(object)
    local myBox = self:boundingBox()
    local box = object:boundingBox()
    return myBox.x < box.x + box.width and myBox.x + myBox.width > box.x
        and myBox.y < box.y + box.height and myBox.y + myBox.height > box.y
end

return Player
