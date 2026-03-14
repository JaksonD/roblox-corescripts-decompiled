local v0 = require(script.Parent["Symbol.roblox"]);
local v1 = newproxy(true);
local v2 = {};
local function _(v3) --[[ Line: 32 ]] --[[ Name: addType ]]
    -- upvalues: v2 (copy), v0 (copy)
    v2[v3] = v0.named("Roact" .. v3);
end;
v2.HostChangeEvent = v0.named("RoactHostChangeEvent");
v2.HostEvent = v0.named("RoactHostEvent");
v2.of = function(v5) --[[ Line: 39 ]] --[[ Name: of ]]
    -- upvalues: v1 (copy)
    if typeof(v5) ~= "table" then
        return nil;
    else
        return v5[v1];
    end;
end;
getmetatable(v1).__index = v2;
getmetatable(v1).__tostring = function() --[[ Line: 49 ]]
    return "RoactType";
end;
return v1;