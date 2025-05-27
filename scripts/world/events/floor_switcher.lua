---@class Floor_Switcher : Interactable
---@overload fun(...) : Floor_Switcher
local Floor_Switcher, super = Class(Interactable)

function Floor_Switcher:init(data)
    super.init(self, data)

    local properties = data.properties
    properties = properties or {}
    self.group = properties["group"]
    self.turn = properties["turn"]
    --Write the name of the layer you want to go(IT SHOULD BE TILE LAYER)
    self.l = properties["l"]
    if self.l then
        self.send_layer = Game.world.map:getTileLayer(self.l).layer + 0.1
    end

    self.solid = false
    self:setHitbox(data.w, data.h, data.width, data.height)
    self.box = Hitbox(self, 0, 0, data.width, data.height)

    self.font = Assets.getFont("small", 10)
    self.sfont = Assets.getFont("small", 2)
    self.id = data.id

    if self.group then
        self.flag = Game:getFlag("#c-" + self.group)
        if self.flag == nil then
            Game:setFlag("#c-" + self.group, 0)
        end
        self.c = Game:getFlag("#c-" + "c-" + self.group)
        if self.c == nil then
            Game:setFlag("#c-" + "c-" + self.group, 0)
        end
    end
end

function Floor_Switcher:onEnter()
    self.flag = Game:getFlag("#c-" + self.group)
    if self.turn == "on" then
        Game:setFlag("#c-" + self.group, 1)
        if DEBUG_RENDER then
            Assets.stopAndPlaySound("equip")
        end
    elseif self.turn == "off" then
        Game:setFlag("#c-" + self.group, 0)
        if DEBUG_RENDER then
            Assets.stopAndPlaySound("error")
        end
    elseif self.turn == "toggle" then
        if self.flag == 0 then
            Game:setFlag("#c-" + self.group, 1)
            if DEBUG_RENDER then
                Assets.stopAndPlaySound("equip")
            end
        elseif self.flag == 1 then
            Game:setFlag("#c-" + self.group, 0)
            if DEBUG_RENDER then
                Assets.stopAndPlaySound("error")
            end
        end
    end
    if self.l then
        Game.world.player:setLayer(self.send_layer)
    end
end

function Floor_Switcher:draw()
    if DEBUG_RENDER then
        self.box:draw(255, 0, 0)
        love.graphics.setFont(self.font)
        love.graphics.printf(self.group, 0, -10, SCREEN_WIDTH/2 - 100, "left")
        if self.l then
            love.graphics.printf(self.send_layer, 0, 0, SCREEN_WIDTH/2 - 100, "left")
        end
    end
end

return Floor_Switcher