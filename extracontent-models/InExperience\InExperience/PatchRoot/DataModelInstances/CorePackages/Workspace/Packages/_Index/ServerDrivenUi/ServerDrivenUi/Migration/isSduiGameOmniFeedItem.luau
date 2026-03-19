local v0 = game:DefineFastString("SduiNonGameTopicIds", "300000000, 600000000, 100000010");
local v1 = {};
for v2 in v0:gmatch("(%w+)") do
    v1[v2] = true;
end;
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: isSduiGameOmniFeedItem ]]
    -- upvalues: v1 (copy)
    if v3 ~= "sdui" then
        return false;
    elseif v4 == nil then
        return false;
    else
        return not v1[tostring(v4)];
    end;
end;