local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_ItemTile_0 = require(l_CorePackages_0.Packages.UIBlox).Tile.ItemTile;
local v7 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v7.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_CatalogItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetails);
local v15 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return function(v17) --[[ Line: 34 ]] --[[ Name: LookEmotePickerTile ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_useSelector_0 (copy), v15 (copy), v13 (copy), l_useDispatch_0 (copy), v2 (copy), v5 (copy), v14 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_CatalogItemCard_0 (copy), l_ItemCardThumbnail_0 (copy), l_Focusable_0 (copy), l_ItemTile_0 (copy)
    local v18 = l_getRbxthumbWithTypeSizeAndOptions_0(v17.itemId, l_Constants_0.RbxthumbTypes.Asset, 150);
    local v21 = l_useSelector_0(function(v19) --[[ Line: 38 ]]
        -- upvalues: v15 (ref), v17 (copy), v13 (ref)
        local v20 = v15(v19.AvatarExperience, v17.itemId, v13.ItemType.Asset);
        if v20 then
            return v20.name;
        else
            return nil;
        end;
    end);
    local v23 = l_useSelector_0(function(v22) --[[ Line: 43 ]]
        -- upvalues: v13 (ref)
        return v22.AvatarExperience.AvatarScene.Looks[v13.DraftLookId];
    end);
    local v24 = l_useDispatch_0();
    local v25 = v23 and v23.displayProperties.emoteAssetId == v17.itemId;
    local v28 = v2.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v23 (copy), v5 (ref), v25 (copy), v17 (copy), v24 (copy), v14 (ref), v13 (ref)
        local l_displayProperties_0 = v23.displayProperties;
        local v27 = v5.Dictionary.join(l_displayProperties_0, {
            emoteAssetId = if v25 then v5.None else v17.itemId
        });
        v24(v14(v13.DraftLookId, {
            displayProperties = v27
        }));
    end, {
        v23, 
        v24, 
        v17.itemId, 
        v25
    });
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        return v2.createElement(l_CatalogItemCard_0, {
            onActivated = v28, 
            presentationSlot = if v18 then v2.createElement(l_ItemCardThumbnail_0, {
                url = v18
            }) else nil, 
            title = v21, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            isSelected = v25
        });
    else
        return v2.createElement(l_Focusable_0[l_ItemTile_0], {
            thumbnail = v18, 
            name = v21, 
            isSelected = v25, 
            onActivated = v28
        });
    end;
end;