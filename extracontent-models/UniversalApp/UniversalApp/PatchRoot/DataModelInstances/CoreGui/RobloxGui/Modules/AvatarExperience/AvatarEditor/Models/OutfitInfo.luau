local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_GenerateStringId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GenerateStringId;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_game_EngineFeature_0 = game:GetEngineFeature("AESUseModerationStatusEnum");
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXInventoryDurablesSupport_0 = v8.FFlagAXInventoryDurablesSupport;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v8.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = v8.FFlagAXEnableModeratedItemsFlowForDurables;
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local v17 = {
    new = function() --[[ Line: 31 ]] --[[ Name: new ]]
        return {};
    end, 
    MockPantsAssetId = "123", 
    MockHatAssetId = "124"
};
local v18 = {
    Approved = Enum.ModerationStatus.ReviewedApproved, 
    Moderated = Enum.ModerationStatus.ReviewedRejected, 
    Pending = Enum.ModerationStatus.NotReviewed, 
    RequiresIntervention = Enum.ModerationStatus.NotReviewed, 
    Invalid = Enum.ModerationStatus.Invalid
};
local function _(v19) --[[ Line: 49 ]] --[[ Name: convertModerationStatus ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v18 (copy)
    if l_game_EngineFeature_0 then
        return v19;
    else
        return v18[v19 or ""];
    end;
end;
v17.mock = function() --[[ Line: 58 ]] --[[ Name: mock ]]
    -- upvalues: v17 (copy), l_GenerateStringId_0 (copy), v7 (copy), v3 (copy)
    local v21 = v17.new();
    v21.outfitId = l_GenerateStringId_0();
    v21.name = "";
    v21.assets = {
        ["66"] = {
            [v17.MockPantsAssetId] = {
                version = "1", 
                order = 2, 
                type = Enum.AccessoryType.Jacket, 
                isLayered = true
            }
        }, 
        ["8"] = {
            [v17.MockHatAssetId] = {
                version = "1", 
                order = 1, 
                type = Enum.AccessoryType.Hat, 
                isLayered = true
            }
        }
    };
    v21.bodyColor3s = {
        headColor3 = v7.bodyColorToBodyColor3(194), 
        leftArmColor3 = v7.bodyColorToBodyColor3(194), 
        leftLegColor3 = v7.bodyColorToBodyColor3(194), 
        rightArmColor3 = v7.bodyColorToBodyColor3(194), 
        rightLegColor3 = v7.bodyColorToBodyColor3(194), 
        torsoColor3 = v7.bodyColorToBodyColor3(194)
    };
    v21.scales = {
        height = 0, 
        width = 0, 
        head = 0, 
        depth = 0, 
        proportion = 0, 
        bodyType = 0
    };
    v21.avatarType = v3.AvatarType.R15;
    v21.isEditable = true;
    v21.updateCounter = 0;
    v21.outfitType = "Avatar";
    return v21;
end;
v17.mockWithData = function(v22) --[[ Line: 108 ]] --[[ Name: mockWithData ]]
    -- upvalues: v17 (copy), v9 (copy)
    local v23 = v17.mock();
    return (v9.Dictionary.join(v23, v22));
end;
v17.fromWebApi = function(v24, v25, v26) --[[ Line: 116 ]] --[[ Name: fromWebApi ]]
    -- upvalues: v17 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_InventoryItemAvailability_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), v6 (copy), v4 (copy), v7 (copy), v11 (copy), l_game_EngineFeature_0 (copy), v18 (copy)
    local v27 = v17.new();
    v27.containsDynamicHead = false;
    local v28 = {};
    local v29 = l_FFlagAXModeratedItemsFlow_0 and 0 or nil;
    local v30 = l_FFlagAXInventoryDurablesSupport_0 and 0 or nil;
    local v31 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then l_InventoryItemAvailability_0.Available else nil;
    if v26.assets then
        for _, v33 in v26.assets do
            local v34 = tostring(v33.assetType.id);
            local v35 = tostring(v33.id);
            local v36 = if l_FFlagParseHeadShapeFromAPIResponse_0 then v33.supportsHeadShapes else nil;
            local v37 = v28[v34] or {};
            v37[v35] = v6.fromMetadata(v33.meta, v34);
            if l_FFlagParseHeadShapeFromAPIResponse_0 then
                v37[v35].supportsHeadShapes = v36;
            end;
            if l_FFlagAXModeratedItemsFlow_0 then
                v37[v35].availabilityStatus = v33.availabilityStatus;
                if v33.availabilityStatus == l_InventoryItemAvailability_0.Unavailable or v33.availabilityStatus == l_InventoryItemAvailability_0.Revoked then
                    v29 = v29 + 1;
                elseif l_FFlagAXInventoryDurablesSupport_0 and v33.availabilityStatus == l_InventoryItemAvailability_0.Expired then
                    v30 = v30 + 1;
                end;
            end;
            if l_FFlagAXEnableModeratedItemsFlowForDurables_0 and not l_FFlagAXModeratedItemsFlow_0 then
                v37[v35].availabilityStatus = v33.availabilityStatus;
                if l_FFlagAXInventoryDurablesSupport_0 and v33.availabilityStatus == l_InventoryItemAvailability_0.Expired then
                    v30 = v30 + 1;
                end;
            end;
            v28[v34] = v37;
            if v34 == v4.AssetTypeIdStrings.DynamicHead then
                v27.containsDynamicHead = true;
            end;
        end;
        if l_FFlagAXModeratedItemsFlow_0 then
            if v29 == #v26.assets then
                v31 = l_InventoryItemAvailability_0.Unavailable;
            elseif l_FFlagAXInventoryDurablesSupport_0 and v30 == #v26.assets then
                v31 = l_InventoryItemAvailability_0.Expired;
            elseif v29 > 0 then
                v31 = l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems;
            elseif l_FFlagAXInventoryDurablesSupport_0 and v30 > 0 then
                v31 = l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
            end;
        end;
        if l_FFlagAXEnableModeratedItemsFlowForDurables_0 and not l_FFlagAXModeratedItemsFlow_0 then
            if l_FFlagAXInventoryDurablesSupport_0 and v30 == #v26.assets then
                v31 = l_InventoryItemAvailability_0.Expired;
            elseif l_FFlagAXInventoryDurablesSupport_0 and v30 > 0 then
                v31 = l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
            end;
        end;
    end;
    v27.outfitId = v24;
    v27.name = v26.name;
    v27.assets = v28;
    v27.bodyColor3s = v7.convertBodyColor3HexesToColor3s(v26.bodyColor3s);
    v27.scales = v26.scale;
    v27.avatarType = v26.playerAvatarType;
    v27.isEditable = v26.isEditable;
    v27.outfitType = v26.outfitType;
    v27.inventoryType = if v11() then v26.inventoryType else nil;
    v27.creatingUniverseId = if v26.universeId ~= 0 and v26.universeId ~= nil then tostring(v26.universeId) else nil;
    local l_moderationStatus_0 = v26.moderationStatus;
    v27.moderationStatus = if l_game_EngineFeature_0 then l_moderationStatus_0 else v18[l_moderationStatus_0 or ""];
    v27.availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v31 else nil;
    v27.bundleId = tostring(v26.bundleId);
    v27.updateCounter = v25 or 0;
    return v27;
end;
return v17;