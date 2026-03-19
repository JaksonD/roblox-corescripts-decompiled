local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
return function(v4, v5) --[[ Line: 13 ]] --[[ Name: getWidgetTileFooterProps ]]
    -- upvalues: v2 (copy)
    local v6 = nil;
    local v7 = nil;
    local v8 = v4.template and v4.template.itemFooters or {};
    for _, v10 in v8 do
        if v10.contentType == "AgentName" then
            v6 = true;
        end;
        if v10.contentType == "Price" then
            v7 = true;
        end;
    end;
    local v11 = v2.getCreatorNameTileFooterEnabled(v5);
    return {
        creatorNameFooterEnabled = v6, 
        priceFooterEnabled = v7, 
        creatorNameTileFooterEnabled = v11
    };
end;