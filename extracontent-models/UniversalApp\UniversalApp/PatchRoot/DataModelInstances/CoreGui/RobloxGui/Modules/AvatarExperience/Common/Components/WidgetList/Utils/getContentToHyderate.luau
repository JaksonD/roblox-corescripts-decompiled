local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Flags.FIntAXCarouselWidgetMaxItems);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableWidgetHydrationCacheForLooks);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: getContentToHyderate ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v9 = {};
    if v6 and v6.content and not v1.isEmpty(v6.content) then
        local v10 = v8 or math.min(#v6.content, v3);
        for v11 = 1, v10 do
            local v12 = v6.content[v11];
            if v12 and (v4() and v12.type == v5.ItemType.Look or not v7[v12.type] or not v7[v12.type][tostring(v12.id)]) then
                table.insert(v9, v12);
            end;
        end;
    end;
    return v9;
end;