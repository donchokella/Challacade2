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
    player.animations.down = anim8.newAnimation(player.grid('1-8', 1), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-8', 2), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-8', 3), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-8', 4), 0.2)

    player.anim = player.animations.left

    background = love.graphics.newImage("/sprites/BG/BG.png")



end

function love.update(dt)
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
    
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end

    player.animations.down: update(dt)
    player.animations.up: update(dt)
    player.animations.right: update(dt)
    player.animations.left: update(dt)


end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, 0.8, 0.8)
    player.animations.down:draw(player.spriteSheet, player.x, player.y, nil, 1)
end
