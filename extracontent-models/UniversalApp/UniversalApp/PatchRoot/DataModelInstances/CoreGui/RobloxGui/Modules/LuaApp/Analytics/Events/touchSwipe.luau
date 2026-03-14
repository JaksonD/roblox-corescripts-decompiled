local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = {
    [Enum.SwipeDirection.Up] = "up", 
    [Enum.SwipeDirection.Right] = "right", 
    [Enum.SwipeDirection.Down] = "down", 
    [Enum.SwipeDirection.Left] = "left"
};
return function(v3, v4, v5, v6, v7) --[[ Line: 17 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.isType(v4, "string", "eventContext");
    v1.isType(v5, "string", "elementName");
    local v8 = {
        elt = v5, 
        dir = v2[v6]
    };
    if v7 ~= nil then
        v1.isType(v7, "string", "extraData");
        v8.cstm = v7;
    end;
    v3:setRBXEventStream(v4, "touchSwipe", v8);
end;