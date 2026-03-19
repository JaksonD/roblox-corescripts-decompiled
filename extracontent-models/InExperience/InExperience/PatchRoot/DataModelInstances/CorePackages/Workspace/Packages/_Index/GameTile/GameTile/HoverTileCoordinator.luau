local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy)
    local v3 = {
        changed = l_Signal_0.new(), 
        hoveredKey = nil, 
        waitingForHover = nil
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.requestHover = function(v4, v5) --[[ Line: 34 ]] --[[ Name: requestHover ]]
    if v4.hoveredKey == v5 then
        return;
    elseif v4.waitingForHover == v5 then
        return;
    elseif v4.hoveredKey == nil or v4.waitingForHover ~= nil then
        v4.hoveredKey = v5;
        v4.waitingForHover = nil;
        v4.changed:fire(v4.hoveredKey);
        return;
    else
        v4.waitingForHover = v5;
        return;
    end;
end;
v2.cancelHover = function(v6, v7) --[[ Line: 57 ]] --[[ Name: cancelHover ]]
    if v6.hoveredKey == v7 then
        if v6.waitingForHover ~= nil then
            v6.hoveredKey = v6.waitingForHover;
            v6.waitingForHover = nil;
        else
            v6.hoveredKey = nil;
        end;
        v6.changed:fire(v6.hoveredKey);
        return;
    else
        if v6.waitingForHover == v7 then
            v6.waitingForHover = nil;
        end;
        return;
    end;
end;
v2.reset = function(v8) --[[ Line: 72 ]] --[[ Name: reset ]]
    local l_hoveredKey_0 = v8.hoveredKey;
    v8.waitingForHover = nil;
    v8.hoveredKey = nil;
    if l_hoveredKey_0 ~= nil then
        v8.changed:fire(v8.hoveredKey);
    end;
end;
v2.default = v2.new();
return v2;