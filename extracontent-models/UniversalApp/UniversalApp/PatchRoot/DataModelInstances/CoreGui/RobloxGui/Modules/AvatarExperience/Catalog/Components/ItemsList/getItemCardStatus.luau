local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogItemCardStatusIconTypeEnum_0 = v2.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesFooter_0 = v7.FFlagAXDurablesFooter;
local l_FFlagAXDurablesSupportForPermanent_0 = v7.FFlagAXDurablesSupportForPermanent;
local function v11(v10) --[[ Line: 17 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v5 (copy)
    if v10 == v5.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v10 == v5.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function v15(v12) --[[ Line: 26 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v12 or not v12.timedOptions then
        return nil;
    else
        for _, v14 in v12.timedOptions do
            if v14.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v14.days > 0 then tostring(v14.days) else "" else tostring(v14.days)
                };
            end;
        end;
        return {
            type = "badge", 
            iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
            text = ""
        };
    end;
end;
return function(v16, v17, v18, v19, v20) --[[ Line: 54 ]] --[[ Name: getItemCardStatus ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), v11 (copy), v15 (copy)
    if v16 then
        return v16;
    elseif v17 == l_ItemTypeEnum_0.Look then
        return (v11(v18));
    elseif v19 then
        return {
            type = "text", 
            text = v19
        };
    else
        return (v15(v20));
    end;
end;