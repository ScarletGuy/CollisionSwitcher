---@class Floor : Interactable
---@overload fun(...) : Floor
local Floor, super = Class(Interactable)

function Floor:init(data)
    super.init(self, data)

    local properties = data.properties
    properties = properties or {}
    self.group = properties["group"]

    self.solid = true
    self:setHitbox(data.w, data.h, data.width, data.height)
    self.box = Hitbox(self, 0, 0, data.width, data.height)

    self.font = Assets.getFont("small", 10)
    self.id = data.id

    if self.group then
        self.flag = Game:getFlag("#c-" + self.group)
        if self.flag == nil then
            Game:setFlag("#c-" + self.group, 0)
        end
    end
end

function Floor:update()
    self.flag = Game:getFlag("#c-" + self.group)
    if self.flag == 1 then
        self.solid = true
    elseif self.flag == 0 then
        self.solid = false
    end
end

function Floor:draw()
    if DEBUG_RENDER then
        self.box:draw(0, 0, 255)
        love.graphics.setFont(self.font)
        love.graphics.printf(self.group, 0, -10, SCREEN_WIDTH/2 - 100, "left")
    end
end

return Floor