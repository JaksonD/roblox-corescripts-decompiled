local l_Players_0 = game:GetService("Players");
game:DefineFastString("AXCommunityAvatarsEntryPointWhiteList", "");
return function() --[[ Line: 5 ]]
    -- upvalues: l_Players_0 (copy)
    local v1 = game:GetFastString("AXCommunityAvatarsEntryPointWhiteList") or "";
    local v2 = string.split(v1, ",") or {};
    local v3 = tostring(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
    return table.find(v2, v3) ~= nil;
end;