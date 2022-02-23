function love.load()
    background = love.graphics.newImage("/wintertileset/background.jpg")
    player1 = love.graphics.newImage("/theboy/Idle (1).png")
    player = {}
    player.x = 200
    player.y = 393

end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 1
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 1
    end


end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, 0.8, 0.8)
    love.graphics.draw(player1, player.x, player.y, 0, 0.2, 0.2)
end
