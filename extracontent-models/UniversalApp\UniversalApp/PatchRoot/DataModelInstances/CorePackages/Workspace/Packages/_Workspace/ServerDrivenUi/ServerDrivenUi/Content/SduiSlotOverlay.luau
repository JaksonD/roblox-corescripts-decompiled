local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v3 = {
    topLeftSlot = {
        AnchorPoint = Vector2.zero, 
        Position = UDim2.fromScale(0, 0)
    }, 
    topMiddleSlot = {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.fromScale(0.5, 0)
    }, 
    topRightSlot = {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0)
    }, 
    centerLeftSlot = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.fromScale(0, 0.5)
    }, 
    centerMiddleSlot = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    }, 
    centerRightSlot = {
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = UDim2.fromScale(1, 0.5)
    }, 
    bottomLeftSlot = {
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1)
    }, 
    bottomMiddleSlot = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.fromScale(0.5, 1)
    }, 
    bottomRightSlot = {
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.fromScale(1, 1)
    }
};
return v1.memo(function(v4) --[[ Line: 77 ]] --[[ Name: SduiSlotOverlay ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v1 (copy), v3 (copy)
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    if l_FFlagSduiServerCompat_0 then
        v5 = v4.layoutOrder;
        v6 = v4.anchorPoint;
        v7 = v4.automaticSize;
        v8 = v4.size;
        v9 = v4.position;
    else
        v5 = v4.LayoutOrder;
        v6 = v4.AnchorPoint;
        v7 = v4.AutomaticSize;
        v8 = v4.Size;
        v9 = v4.Position;
    end;
    local v10 = v4.padding or 0;
    local v14 = v1.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: v1 (ref), v10 (copy), v3 (ref), v4 (copy)
        local v11 = {
            UIPadding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v10), 
                PaddingTop = UDim.new(0, v10), 
                PaddingRight = UDim.new(0, v10), 
                PaddingBottom = UDim.new(0, v10)
            })
        };
        for v12, v13 in v3 do
            if v4[v12] ~= nil then
                v11[v12] = v1.createElement("Frame", {
                    AnchorPoint = v13.AnchorPoint, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Position = v13.Position, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    [v1.Tag] = ("data-testid=--sdui-slot-%*"):format(v12)
                }, {
                    item = v4[v12]
                });
            end;
        end;
        return v11;
    end, {
        v4.topLeftSlot, 
        v4.topMiddleSlot, 
        v4.topRightSlot, 
        v4.centerLeftSlot, 
        v4.centerMiddleSlot, 
        v4.centerRightSlot, 
        v4.bottomLeftSlot, 
        v4.bottomMiddleSlot, 
        v4.bottomRightSlot, 
        v10
    });
    return v1.createElement("Frame", {
        LayoutOrder = v5, 
        AnchorPoint = v6, 
        AutomaticSize = v7, 
        Size = v8 or UDim2.new(1, 0, 1, 0), 
        Position = v9, 
        BackgroundTransparency = 1, 
        [v1.Tag] = "data-testid=--sdui-slot-overlay"
    }, v14);
end);