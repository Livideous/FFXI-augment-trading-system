--Func: capme
--desc: caps player at lvl 50

local commandObj = {}

commandObj.cmdprops = 
{
    permission = 0,
    parameters = 'i'
}

local capped = function(player)--create level cap function 

  player:addStatusEffect(xi.effect.LEVEL_RESTRICTION, 50, 0, 0)--cap player at lvl 50
end

local uncapped = function(player)--create level cap removal function

    player:delStatusEffect(xi.effect.LEVEL_RESTRICTION)--remove cap from player
end

commandObj.onTrigger = function(player) --trigger function to activate command
    local state = player:getCharVar('50cap') --create database state variable

    if state == 0 then --checks if flag is off
        player:setCharVar('50cap', 1) --turns flag on
        capped(player) --calls function to remove level cap
        player:printToPlayer('Level 50 Cap enabled.') --message printed to player
    elseif state == 1 then --checks if flag is on
        player:setCharVar('50cap', 0) --turns flag off
        uncapped(player) --calls function to remove level cap
        player:printToPlayer('Level Cap disabled.') --message printed to player
    end
end

return commandObj
