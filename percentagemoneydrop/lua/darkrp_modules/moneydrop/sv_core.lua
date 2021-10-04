-- #NoSimplerr#

-- ==========
-- Config start
-- ==========

-- How many percents (%) of money player will lose on death
local PERCENTAGE = 20

-- ==========
-- Config end
-- ==========

local multiplier = (PERCENTAGE / 100)

hook.Add("PlayerDeath", "PercentageMoneyDrop", function(ply)
    local money = ply:getDarkRPVar("money")
    local amount = math.Round(money * multiplier)

    if amount > 0 and (money >= amount) then
        ply:addMoney(-amount)

        DarkRP.createMoneyBag(ply:GetPos(), amount)
    end
end)

hook.Add("OnReloaded", "PercentageMoneyDrop", function()
    GAMEMODE.Config.dropmoneyondeath = false
end)

hook.Add("PostGamemodeLoaded", "PercentageMoneyDrop", function()
    GAMEMODE.Config.dropmoneyondeath = false
end)