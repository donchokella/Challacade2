function love.load()
    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    player = {}
    player.x = 200
    player.y = 393
    player.speed = 5
    player.spriteSheet = love.graphics.newImage("/sprites/thegirl.png")
    player.grid = anim8.newGrid(100, 100, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-7', 1), 0.12)
    player.animations.up = anim8.newAnimation(player.grid('1-7', 2), 0.12)
    player.animations.right = anim8.newAnimation(player.grid('1-7', 3), 0.12)
    player.animations.left = anim8.newAnimation(player.grid('1-7', 4), 0.12)

    player.anim = player.animations.left

    background = love.graphics.newImage("/sprites/BG/BG.png")



end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end
    
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end
    
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        player.anim = player.animations.right
        isMoving = true
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(1)
    end

    player.anim:update(dt)



end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, 0.8, 0.8)
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, 1)
end
