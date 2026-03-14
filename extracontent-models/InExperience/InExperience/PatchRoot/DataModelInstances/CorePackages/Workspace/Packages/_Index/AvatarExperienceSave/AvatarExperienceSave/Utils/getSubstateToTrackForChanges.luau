local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local v5 = game:DefineFastFlag("AXPickStateInsteadOfOmit", false);
local l_FFlagAXCustomizeMakeupSupport_0 = v4.FFlagAXCustomizeMakeupSupport;
return function(v7, v8) --[[ Line: 26 ]] --[[ Name: getSubstateToTrackForChanges ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), v2 (copy), v5 (copy)
    local v9 = if l_FFlagAXCustomizeMakeupSupport_0 then {} else nil;
    if l_FFlagAXCustomizeMakeupSupport_0 and v7.tryOn.OutfitTryOn.TryOnItems then
        for v10, v11 in v7.tryOn.OutfitTryOn.TryOnItems do
            v9[v10] = if v8 then v2.omit(v11, {
                "order"
            }) else v11;
        end;
    end;
    local v12 = if l_FFlagAXCustomizeMakeupSupport_0 then {} else nil;
    if l_FFlagAXCustomizeMakeupSupport_0 and v7.equipped.EquippedAssets then
        for v13, v14 in v7.equipped.EquippedAssets do
            v12[v13] = {};
            for v15, v16 in v14 do
                v12[v13][v15] = if v8 then v2.omit(v16, {
                    "order"
                }) else v16;
            end;
        end;
    end;
    return {
        OutfitTryOn = if v5 then {
            TryOnItems = if l_FFlagAXCustomizeMakeupSupport_0 then v9 else v7.tryOn.OutfitTryOn.TryOnItems, 
            LookId = v7.tryOn.OutfitTryOn.LookId, 
            LookType = v7.tryOn.OutfitTryOn.LookType, 
            BodyColor3s = v7.tryOn.OutfitTryOn.BodyColor3s, 
            BodyPartColorRangeIds = v7.tryOn.OutfitTryOn.BodyPartColorRangeIds, 
            Scale = v7.tryOn.OutfitTryOn.Scale
        } else v2.omit(v7.tryOn.OutfitTryOn, {
            "OutfitIdMap", 
            "LastAnimOrEmoteToggledItem", 
            "LastToggledItem", 
            "LookAnalyticsInfo", 
            "DefaultTryOnBodyColorsToggled"
        }), 
        LastSavedTriedOnOutfit = v7.tryOn.LastSavedTriedOnOutfit, 
        AvatarType = v7.equipped.AvatarType, 
        AvatarScales = v7.equipped.AvatarScales, 
        BodyColor3s = v7.equipped.BodyColor3s, 
        BodyPartRangeIds = v7.equipped.BodyPartRangeIds, 
        EquippedAssets = if l_FFlagAXCustomizeMakeupSupport_0 then v12 else v7.equipped.EquippedAssets, 
        EquippedEmotes = if v5 then {
            slotInfo = v7.equipped.EquippedEmotes.slotInfo
        } else v2.omit(v7.equipped.EquippedEmotes, {
            "selectedSlot"
        })
    };
end;