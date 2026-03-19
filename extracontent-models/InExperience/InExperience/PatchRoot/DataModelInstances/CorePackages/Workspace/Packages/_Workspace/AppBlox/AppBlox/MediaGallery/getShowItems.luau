local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2) --[[ Line: 6 ]] --[[ Name: getShowItems ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    local v4 = {};
    for v5, v6 in ipairs(v2.items) do
        if v6.isYouTubeVideo then
            table.insert(v3, v1.Dictionary.join(v6, {
                originalIndex = v5
            }));
        else
            table.insert(v4, v1.Dictionary.join(v6, {
                originalIndex = v5
            }));
        end;
    end;
    local v7 = v1.List.join(v3, v4);
    local l_numberOfThumbnails_0 = v2.numberOfThumbnails;
    if l_numberOfThumbnails_0 then
        for v9 = #v7 + 1, l_numberOfThumbnails_0 do
            v7[v9] = {};
        end;
    end;
    return v7, #v3, #v4;
end;