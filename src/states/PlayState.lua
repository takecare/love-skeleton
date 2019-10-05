local Player = require('src/Paddle')
local PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.isPaused = false
    -- TODO
end

function PlayState:update(dt)
    -- TODO
end

function PlayState:keyPressed(key)
    if key == 'escape' then
        self:pause()
    end
end

function PlayState:pause()
    self.isPaused = not self.isPaused
end

function PlayState:render()
    if self.isPaused then
        love.graphics.setColor({ 0.5, 0.5, 0.5, 0.5 })
    end

    -- TODO

    if self.isPaused then
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    end
end

return PlayState
