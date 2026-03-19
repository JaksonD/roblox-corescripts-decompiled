local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v3) --[[ Line: 28 ]] --[[ Name: SduiDivider ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v1 (copy)
    local v4 = nil;
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    if l_FFlagSduiServerCompat_0 then
        v4 = v3.size;
        v5 = v3.layoutOrder;
        v6 = v3.position;
        v7 = v3.anchorPoint;
        v8 = v3.backgroundColor3;
        v9 = v3.backgroundTransparency;
    else
        v4 = v3.Size;
        v5 = v3.LayoutOrder;
        v6 = v3.Position;
        v7 = v3.AnchorPoint;
        v8 = v3.BackgroundColor3;
        v9 = v3.BackgroundTransparency;
    end;
    return v1.createElement("Frame", {
        Size = v4 or UDim2.new(1, 0, 0, 1), 
        LayoutOrder = v5, 
        Position = v6, 
        AnchorPoint = v7, 
        BackgroundColor3 = v8 or Color3.new(1, 1, 1), 
        BackgroundTransparency = v9 or 0.85, 
        BorderSizePixel = 0, 
        [v1.Tag] = "data-testid=--sdui-divider"
    });
end);