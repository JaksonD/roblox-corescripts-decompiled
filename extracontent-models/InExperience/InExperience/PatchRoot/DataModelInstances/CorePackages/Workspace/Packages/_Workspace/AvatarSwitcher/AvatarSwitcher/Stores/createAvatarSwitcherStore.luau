local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Signals);
local l_createSignal_0 = v6.createSignal;
local l_createComputed_0 = v6.createComputed;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v10 = require(l_Parent_0.Cryo);
local l_InventoryItemAvailability_0 = require(l_Parent_0.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local l_sendAXCounterV2_0 = require(l_Parent_0.AvatarExperienceAnalytics).sendAXCounterV2;
local v13 = require(l_script_FirstAncestor_0.Utils.applyOutfit);
local v14 = require(l_script_FirstAncestor_0.Enums.ExperienceAvatarSupportType);
local v15 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherUseAvatarInventoryEndpoint;
local l_FFlagAvatarSwitcherAccurateAvatarWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning;
local l_FFlagAvatarSwitcherCounters_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherCounters;
local l_FFlagAvatarSwitcherExpiredItemsWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning;
local v20 = game:DefineFastFlag("AvatarSwitcherPcallApplyOutfit", false);
local _ = require(l_script_FirstAncestor_0.types);
local v22 = l_Url_0.AVATAR_URL .. "v1/avatar-inventory?";
local v23 = l_Url_0.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support";
return function() --[[ Line: 40 ]] --[[ Name: createAvatarSwitcherStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), l_AvatarEditorService_0 (copy), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (copy), v10 (copy), l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 (copy), v22 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_FFlagAvatarSwitcherCounters_0 (copy), l_sendAXCounterV2_0 (copy), v15 (copy), l_InventoryItemAvailability_0 (copy), l_FFlagAvatarSwitcherExpiredItemsWarning_0 (copy), v20 (copy), v13 (copy), v23 (copy), v14 (copy), l_Players_0 (copy)
    local v24, v25 = l_createSignal_0({});
    local v26, v27 = l_createSignal_0({});
    local v28, v29 = l_createSignal_0(false);
    local v30, v31 = l_createSignal_0(nil);
    local v32, v33 = l_createSignal_0(false);
    local v34, v35 = l_createSignal_0(false);
    local v36, v37 = l_createSignal_0(nil);
    local v38, v39 = l_createSignal_0(nil);
    local v40, v41 = l_createSignal_0(nil);
    local v43 = l_createComputed_0(function(v42) --[[ Line: 52 ]]
        -- upvalues: v28 (copy), v24 (copy)
        return v28(v42) and #v24(v42) == 0;
    end);
    local v46 = l_createComputed_0(function(v44) --[[ Line: 56 ]]
        -- upvalues: v30 (copy), v26 (copy)
        local v45 = v30(v44);
        if v45 == nil then
            return nil;
        else
            return v26(v44)[v45];
        end;
    end);
    local function v48(v47) --[[ Line: 65 ]] --[[ Name: toggleRespawnPrompt ]]
        -- upvalues: v33 (copy)
        v33(v47);
    end;
    local function v57(v49) --[[ Line: 69 ]] --[[ Name: fetchOutfitDetails ]]
        -- upvalues: l_AvatarEditorService_0 (ref), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (ref), v27 (copy), v10 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v49 (copy)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:GetOutfitDetailsAsync(v49);
            else
                return l_AvatarEditorService_0:GetOutfitDetails(v49);
            end;
        end);
        if l_status_0 then
            local v52 = nil;
            if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then
                v52 = {};
                if l_result_0.Assets then
                    for _, v54 in l_result_0.Assets do
                        table.insert(v52, v54.Id);
                    end;
                end;
            end;
            local v55 = {
                id = l_result_0.Id, 
                name = l_result_0.Name, 
                rigType = if l_result_0.PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15, 
                assetIds = if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then v52 else nil
            };
            v27(function(v56) --[[ Line: 94 ]]
                -- upvalues: v10 (ref), v49 (copy), v55 (copy)
                return v10.Dictionary.join(v56, {
                    [v49] = v55
                });
            end);
            return;
        else
            warn(("Avatar Switcher: failed to fetch outfit details for outfitId %*."):format(v49), l_result_0);
            return;
        end;
    end;
    local function v59(v58) --[[ Line: 103 ]] --[[ Name: selectOutfit ]]
        -- upvalues: v31 (copy), l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 (ref), v46 (copy), v57 (copy)
        v31(v58);
        if not l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 and v58 ~= nil and v46(false) == nil then
            v57(v58);
        end;
    end;
    local v60 = nil;
    local v61 = false;
    local function v71() --[[ Line: 120 ]] --[[ Name: fetchNextOutfitsPage_DEPRECATED ]]
        -- upvalues: v61 (ref), v28 (copy), v60 (ref), v29 (copy), l_AvatarEditorService_0 (ref), v25 (copy)
        if v61 or v28(false) then
            return;
        else
            v61 = true;
            if v60 then
                if v60.IsFinished then
                    return;
                else
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 130 ]]
                        -- upvalues: v60 (ref)
                        v60:AdvanceToNextPageAsync();
                    end);
                    if not l_status_1 then
                        warn("Avatar Switcher: failed to fetch next page of user outfits.", l_result_1);
                        v29(true);
                    end;
                end;
            else
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 138 ]]
                    -- upvalues: l_AvatarEditorService_0 (ref)
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_AvatarEditorService_0:GetOutfitsAsync(Enum.OutfitSource.Created, Enum.OutfitType.Avatar);
                    else
                        return l_AvatarEditorService_0:GetOutfits(Enum.OutfitSource.Created, Enum.OutfitType.Avatar);
                    end;
                end);
                if l_status_2 then
                    v60 = l_result_2;
                else
                    warn("Avatar Switcher: failed to fetch first page of user outfits.", l_result_2);
                    v29(true);
                end;
            end;
            if v60 then
                local l_v60_CurrentPage_0 = v60:GetCurrentPage();
                v25(function(v67) --[[ Line: 155 ]]
                    -- upvalues: l_v60_CurrentPage_0 (copy)
                    local v68 = table.clone(v67);
                    for _, v70 in l_v60_CurrentPage_0 do
                        table.insert(v68, {
                            id = v70.Id, 
                            name = v70.Name
                        });
                    end;
                    return v68;
                end);
                if v60.IsFinished then
                    v29(true);
                end;
            end;
            v61 = false;
            return;
        end;
    end;
    local v72 = nil;
    local function v92() --[[ Line: 174 ]] --[[ Name: fetchNextOutfitsPage ]]
        -- upvalues: v61 (ref), v28 (copy), v72 (ref), v22 (ref), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v15 (ref), v29 (copy), v38 (copy), l_InventoryItemAvailability_0 (ref), l_FFlagAvatarSwitcherExpiredItemsWarning_0 (ref), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (ref), v25 (copy), v10 (ref), v27 (copy)
        if v61 or v28(false) then
            return;
        else
            v61 = true;
            local v73 = {
                pageToken = v72, 
                pageLimit = 25, 
                sortOption = "recentAdded", 
                ["itemCategories[0].itemType"] = "outfit", 
                ["itemCategories[0].itemSubType"] = 3
            };
            local v74 = v22 .. l_Url_0:makeQueryString(v73);
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 189 ]]
                -- upvalues: l_HttpRbxApiService_0 (ref), v74 (copy), l_HttpService_0 (ref)
                local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v74);
                return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
            end);
            if not l_status_3 then
                warn("Avatar Switcher: failed to fetch user outfits.", l_result_3);
                if l_FFlagAvatarSwitcherCounters_0 then
                    l_sendAXCounterV2_0(v15.Counters.OutfitFetchFailed);
                end;
                v29(true);
                v61 = false;
                return;
            else
                if l_result_3.nextPageToken then
                    v72 = l_result_3.nextPageToken;
                else
                    v29(true);
                end;
                local v78 = l_result_3.avatarInventoryItems or {};
                local v79 = {};
                local v80 = {};
                local v81 = v38(false);
                for _, v83 in v78 do
                    if v83.availabilityStatus ~= l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems then
                        local v84 = if v83.outfitDetail and v83.outfitDetail.playerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15;
                        local v85 = false;
                        if v81 == Enum.HumanoidRigType.R6 then
                            v85 = v84 == Enum.HumanoidRigType.R15;
                        end;
                        local v86 = nil;
                        if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then
                            v86 = v83.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
                        end;
                        local v87 = nil;
                        if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then
                            v87 = {};
                            if v83.outfitDetail and v83.outfitDetail.assets then
                                for _, v89 in v83.outfitDetail.assets do
                                    table.insert(v87, v89.id);
                                end;
                            end;
                        end;
                        table.insert(v79, {
                            id = v83.itemId, 
                            name = v83.itemName, 
                            hasWarning = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v85 or v86 else v85
                        });
                        v80[v83.itemId] = {
                            id = v83.itemId, 
                            name = v83.itemName, 
                            rigType = v84, 
                            availabilityStatus = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v83.availabilityStatus else nil, 
                            assetIds = if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then v87 else nil
                        };
                    end;
                end;
                v25(function(v90) --[[ Line: 259 ]]
                    -- upvalues: v10 (ref), v79 (copy)
                    return v10.List.join(v90, v79);
                end);
                v27(function(v91) --[[ Line: 262 ]]
                    -- upvalues: v10 (ref), v80 (copy)
                    return v10.Dictionary.join(v91, v80);
                end);
                v61 = false;
                return;
            end;
        end;
    end;
    local function v96() --[[ Line: 270 ]] --[[ Name: switchAvatar ]]
        -- upvalues: v46 (copy), v35 (copy), l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v15 (ref), v20 (ref), v13 (ref), v41 (copy)
        local v93 = v46(false);
        if not v93 then
            return;
        else
            v35(true);
            if l_FFlagAvatarSwitcherCounters_0 then
                l_sendAXCounterV2_0(v15.Counters.SwitchAvatar);
            end;
            if v20 then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 282 ]]
                    -- upvalues: v13 (ref), v93 (copy)
                    v13(v93.id, v93.rigType);
                end);
                if not l_status_4 then
                    l_sendAXCounterV2_0(v15.Counters.ApplyOutfitFailed, {
                        errorMessage = tostring(l_result_4)
                    });
                end;
            else
                v13(v93.id, v93.rigType);
            end;
            v41(v93.name);
            v35(false);
            return;
        end;
    end;
    local function v104() --[[ Line: 296 ]] --[[ Name: fetchExperienceAvatarSupportType ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v23 (ref), l_HttpService_0 (ref), v14 (ref), v37 (copy), v39 (copy), l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v15 (ref)
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 297 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v23 (ref), l_HttpService_0 (ref)
            local l_l_HttpRbxApiService_0_AsyncFullUrl_1 = l_HttpRbxApiService_0:GetAsyncFullUrl(v23);
            return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_1);
        end);
        if l_status_5 then
            local l_experienceAvatarSupportType_0 = l_result_5.experienceAvatarSupportType;
            local v101 = if l_experienceAvatarSupportType_0 == 0 then v14.NoSupport else if l_experienceAvatarSupportType_0 == 2 then v14.FullSupport else v14.UnknownSupport;
            v37(v101);
            local l_experienceAvatarType_0 = l_result_5.experienceAvatarType;
            local v103 = if l_experienceAvatarType_0 == 1 then Enum.HumanoidRigType.R6 else if l_experienceAvatarType_0 == 3 then Enum.HumanoidRigType.R15 else nil;
            v39(v103);
            if l_FFlagAvatarSwitcherCounters_0 then
                l_sendAXCounterV2_0(v15.Counters.AvatarSupportTypeFetched, {
                    supportType = tostring(l_experienceAvatarSupportType_0), 
                    avatarType = tostring(l_experienceAvatarType_0)
                });
                return;
            end;
        else
            v37(v14.UnknownSupport);
            v39(nil);
            if l_FFlagAvatarSwitcherCounters_0 then
                l_sendAXCounterV2_0(v15.Counters.AvatarSupportTypeFetchFailed);
            end;
        end;
    end;
    local function v105() --[[ Line: 332 ]] --[[ Name: clearPendingAvatarName ]]
        -- upvalues: v41 (copy)
        v41(nil);
    end;
    if l_Players_0.LocalPlayer then
        l_Players_0.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 337 ]]
            -- upvalues: v41 (copy)
            v41(nil);
        end);
    end;
    return {
        getOutfits = v24, 
        getLastPageReached = v28, 
        getSelectedOutfitId = v30, 
        getSelectedOutfitDetails = v46, 
        getRespawnPromptShown = v32, 
        getIsSwitching = v34, 
        getIsEmpty = v43, 
        getExperienceAvatarSupportType = v36, 
        getExperienceAvatarType = v38, 
        getPendingAvatarName = v40, 
        toggleRespawnPrompt = v48, 
        selectOutfit = v59, 
        fetchNextOutfitsPage = if l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 then v92 else v71, 
        switchAvatar = v96, 
        fetchExperienceAvatarSupportType = v104, 
        clearPendingAvatarName = v105
    };
end;