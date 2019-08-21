push = require 'push' -- https://github.com/Ulydev/push
Class = require 'class' -- https://github.com/vrld/hump/blob/master/class.lua

require 'Player'

windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth * 0.75, windowHeight * 0.75

virtualWidth = 384
virtualHeight = 192

local player = Player(virtualWidth / 10, virtualHeight / 2)

function love.load()
    -- set love's default filter to "nearest-neighbor", which essentially
    -- means there will be no filtering of pixels (blurriness), which is
    -- important for a nice crisp, 2D look
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('skeleton')
    math.randomseed(os.time())

    font = love.graphics.newFont('assets/font.ttf', virtualWidth * 0.08)
    love.graphics.setFont(font)

    sounds = {
        ['score'] = love.audio.newSource('assets/score.wav', 'static'),
    }
    
    push:setupScreen(virtualWidth, virtualHeight, windowWidth, windowHeight, {
        fullscreen = false,
        resizable = true, 
        vsync = true,
        pixelperfect = true
    })

    -- ...
end

function love.resize(w, h)
    push:resize(w, h)
end

--[[
    Called every frame, passing in `dt` since the last frame. `dt`
    is short for `deltaTime` and is measured in seconds. Multiplying
    this by any changes we wish to make in our game will allow our
    game to perform consistently across all hardware; otherwise, any
    changes we make will be applied as fast as possible and will vary
    across system hardware.
]]
function love.update(dt)
    -- ...
end

--[[
    A callback that processes key strokes as they happen, just the once.
    Does not account for keys that are held down, which is handled by a
    separate function (`love.keyboard.isDown`). Useful for when we want
    things to happen right away, just once, like when we want to quit.
]]
function love.keypressed(key)
    if key == 'escape' then
        sounds['score']:play()
        love.event.quit()
    end
end

function love.draw()
    love.graphics.clear(40, 45, 52, 255)
    push:apply("start")

    -- ...

    push:apply("end")
end
