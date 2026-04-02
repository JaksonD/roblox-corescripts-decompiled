local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogItemCardStatusIconTypeEnum_0 = v2.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesSupport_0 = v7.FFlagAXDurablesSupport;
local l_FFlagAXDurablesFooter_0 = v7.FFlagAXDurablesFooter;
local l_FFlagAXDurablesSupportForPermanent_0 = v7.FFlagAXDurablesSupportForPermanent;
local function v12(v11) --[[ Line: 18 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v5 (copy)
    if v11 == v5.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v11 == v5.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function v16(v13) --[[ Line: 27 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if not l_FFlagAXDurablesSupport_0 or l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v13 or not v13.timedOptions then
        return nil;
    else
        for _, v15 in v13.timedOptions do
            if v15.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v15.days > 0 then tostring(v15.days) else "" else tostring(v15.days)
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
return function(v17, v18, v19, v20, v21) --[[ Line: 55 ]] --[[ Name: getItemCardStatus ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), v12 (copy), v16 (copy)
    if v17 then
        return v17;
    elseif v18 == l_ItemTypeEnum_0.Look then
        return (v12(v19));
    elseif v20 then
        return {
            type = "text", 
            text = v20
        };
    else
        return (v16(v21));
    end;
end;