local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({}, v2));
end;
v2.registerURL = function(_, _) --[[ Line: 16 ]] --[[ Name: registerURL ]]

end;
v2.detectURL = function(_, _) --[[ Line: 20 ]] --[[ Name: detectURL ]]

end;
v2.listenForLuaURLs = function(_, _) --[[ Line: 24 ]] --[[ Name: listenForLuaURLs ]]

end;
v2.stopListeningForLuaURLs = function(_) --[[ Line: 28 ]] --[[ Name: stopListeningForLuaURLs ]]

end;
v2.openURL = function(v10, v11) --[[ Line: 32 ]] --[[ Name: openURL ]]
    -- upvalues: v1 (copy)
    v10.lastOpenedURL = v11;
    return v1.resolve(true);
end;
v2.isURLRegistered = function(_, _) --[[ Line: 37 ]] --[[ Name: isURLRegistered ]]
    -- upvalues: v1 (copy)
    return v1.resolve(true);
end;
return v2;