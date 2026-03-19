local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UnifiedLogging");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Cryo);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v6 = require(l_script_FirstAncestor_0.ContentType);
local v7 = require(l_script_FirstAncestor_0.itemImpressionsEvent);
local v8 = require(l_script_FirstAncestor_0.userEntryUtils);
local v9 = require(l_script_FirstAncestor_0.buildItemMetadataFields);
local v10 = require(l_script_FirstAncestor_0.buildGameMetadataFields);
local _ = require(l_script_FirstAncestor_0.SduiAnalyticsTypes);
local l_FFlagLuaAppDesktopFriendCarouselClicks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDesktopFriendCarouselClicks;
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
local l_FFlagItemImpressionsAddGameMetadata_0 = require(l_Parent_0.SharedFlags).FFlagItemImpressionsAddGameMetadata;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local function v39(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) --[[ Line: 24 ]]
    -- upvalues: v3 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy)
    local v26 = {};
    local v27 = {};
    local v28 = {};
    local v29 = {};
    local v30 = {};
    local v31 = {};
    for _, v33 in v16 do
        local v34 = v17 and v17[v33] or nil;
        if v34 ~= nil then
            table.insert(v26, v34.id);
            table.insert(v27, v33);
            table.insert(v29, v33);
            local v35 = nil;
            local v36 = nil;
            if v19 and v19 > 0 then
                v35 = math.ceil(v33 / v19);
                v36 = v33 % v19;
                if v36 == 0 then
                    v36 = v19;
                end;
                table.insert(v28, v35);
            else
                v3.assert(v19 ~= 0);
                v35 = 1;
                v36 = v33;
            end;
            if v25 then
                table.insert(v30, v25 + v35 - 1);
                table.insert(v31, v36);
            end;
        else
            l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsEventNilEntry", ("Entry at index %* was nil when sending item impressions for collection %*"):format(v33, v21), {
                entryIndex = v33, 
                collectionId = v21
            });
        end;
    end;
    local v37 = #v26;
    v3.assert(v37 == #v27);
    if #v28 > 0 then
        v3.assert(v37 == #v28);
    end;
    if #v30 > 0 then
        v3.assert(v37 == #v30);
    end;
    if #v31 > 0 then
        v3.assert(v37 == #v31);
    end;
    local v38 = {
        contentType = v18, 
        itemIds = table.concat(v26, ","), 
        itemPositions = table.concat(v27, ","), 
        positionsInTopic = table.concat(v29, ","), 
        collectionPosition = v20, 
        collectionId = v21, 
        totalNumberOfItems = if v22 then v22 else if v17 then #v17 else 0, 
        collectionComponentType = v23, 
        collectionIdStr = if l_FFlagProfilePlatformEnableImpressions_0 then v24 else nil
    };
    if #v28 > 0 then
        v38.rowNumbers = table.concat(v28, ",");
    end;
    if #v30 > 0 then
        v38.feedRowNumbers = table.concat(v30, ",");
    end;
    if #v31 > 0 then
        v38.positionsInRow = table.concat(v31, ",");
    end;
    return v38;
end;
local function v50(v40, v41, v42) --[[ Line: 124 ]]
    -- upvalues: l_FFlagLuaAppDesktopFriendCarouselClicks_0 (copy), v8 (copy)
    local v43 = {};
    local v44 = {};
    local v45 = {};
    for _, v47 in v40 do
        local v48 = v41 and v41[v47] or nil;
        if v48 ~= nil then
            if l_FFlagLuaAppDesktopFriendCarouselClicks_0 then
                local v49 = v8.extractFieldsFromUserEntry(v48);
                table.insert(v43, v49.presence);
                table.insert(v44, v49.friendStatus);
                table.insert(v45, v49.presenceUniverseId);
            else
                table.insert(v43, v48.presence and v48.presence.userPresenceType or "");
                table.insert(v44, v48.isFriend and "friend" or "notFriend");
                table.insert(v45, if v48.presence and v48.presence.universeId and v48.presence.universeId ~= "" then v48.presence.universeId else "-1");
            end;
        end;
    end;
    return {
        sourceCarousel = v42, 
        presences = table.concat(v43, ","), 
        friendStatuses = table.concat(v44, ","), 
        presenceUniverseIds = table.concat(v45, ",")
    };
end;
local function v64(v51, v52, v53, v54, v55, v56, v57, v58) --[[ Line: 165 ]]
    -- upvalues: l_FFlagLuaAppDesktopFriendCarouselClicks_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v6 (copy), v39 (copy), v50 (copy), v4 (copy), v7 (copy)
    if not v51 or not v52 then
        if l_FFlagLuaAppDesktopFriendCarouselClicks_0 then
            l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsService", ("Event Ingest or App Analytics was nil when trying to send itemImpressions for collection %*"):format(v57), {
                eventIngest = v51, 
                appAnalytics = v52, 
                sortId = v57
            });
        end;
        return;
    elseif not v53 or #v53 == 0 then
        return;
    elseif not v54 or #v54 == 0 then
        return;
    else
        local v59 = #v54;
        local l_User_0 = v6.User;
        local v61 = v39(v53, v54, l_User_0, v59, v56, v57);
        local v62 = v50(v53, v54, v58);
        local v63 = v4.Dictionary.union(v61, v62);
        v7(v51, v55, l_User_0, v63);
        return;
    end;
end;
local v77 = l_FFlagProfilePlatformEnableImpressions_0 and function(v65, v66, v67, v68, v69, v70, v71, v72, v73) --[[ Line: 213 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v39 (copy), l_FFlagItemImpressionsAddGameMetadata_0 (copy), v6 (copy), v10 (copy), v4 (copy), v7 (copy)
    if not v65 or not v66 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsFromProfile", ("Event Ingest or App Analytics was nil when trying to send itemImpressions for collection %* on Profile Platform"):format(v73), {
            eventIngest = v65, 
            appAnalytics = v66, 
            collectionIdStr = v73
        });
        return;
    elseif not v67 or #v67 == 0 then
        return;
    elseif not v68 or #v68 == 0 then
        return;
    else
        local v74 = v39(v67, v68, v71, v69, v72, nil, #v68, nil, v73);
        if l_FFlagItemImpressionsAddGameMetadata_0 then
            local l_v74_0 = v74;
            if v71 == v6.Game then
                local v76 = v10(v67, v68, v73);
                l_v74_0 = v4.Dictionary.union(l_v74_0, v76);
            end;
            v7(v65, v70, v71, l_v74_0);
            return;
        else
            v7(v65, v70, v71, v74);
            return;
        end;
    end;
end or nil;
local function v92(v78, v79, v80, v81, v82, v83, v84, v85, v86, v87) --[[ Line: 272 ]] --[[ Name: sendFromServerDrivenUi ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v39 (copy), v9 (copy), v4 (copy), l_AppStorageService_0 (copy), v7 (copy)
    if not v78 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsFromSduiNilService", ("Event Ingest was nil when trying to send itemImpressions for collection %*"):format(v83), {
            collectionId = v83
        });
        return;
    elseif not v79 or #v79 == 0 then
        return;
    elseif not v80 or #v80 == 0 then
        return;
    elseif not v81 then
        return;
    else
        local v88 = v39(v79, v80, v84, v85, v86, v83, v81.totalNumberOfItems, v81.collectionComponentType, nil, v87);
        local v89 = v9(v79, v80, v83);
        local v90 = v4.Dictionary.join(v81, v89, v88);
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
            v90.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
        end;
        if v90.collectionId and type(v90.collectionId) == "string" and type((tonumber(v90.collectionId))) ~= "number" then
            v90.collectionIdStr = v90.collectionId;
            v90.collectionId = nil;
        end;
        v7(v78, v82, v84, v90);
        return;
    end;
end;
local function v106(v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103) --[[ Line: 340 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v39 (copy), l_FFlagItemImpressionsAddGameMetadata_0 (copy), v6 (copy), v10 (copy), v4 (copy), v7 (copy)
    if not v93 or not v94 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsService", ("Event Ingest or App Analytics was nil when trying to send itemImpressions for collection %*"):format(v102), {
            eventIngest = v93, 
            appAnalytics = v94, 
            sortId = v102
        });
        return;
    elseif not v95 or #v95 == 0 then
        return;
    elseif not v96 or #v96 == 0 then
        return;
    else
        local v104 = v39(v95, v96, v100, v97, v99, v102, v101, nil, v103);
        if l_FFlagItemImpressionsAddGameMetadata_0 then
            if v100 == v6.Game then
                local v105 = v10(v95, v96, v103);
                v104 = v4.Dictionary.union(v104, v105);
            end;
            v7(v93, v98, v100, v104);
            return;
        else
            v7(v93, v98, v100, v104);
            return;
        end;
    end;
end;
return {
    sendFromFriendsCarousel = v64, 
    sendFromItemCollection = if l_FFlagEnableTopSongsSort_0 then v106 else nil, 
    sendFromProfile = if l_FFlagProfilePlatformEnableImpressions_0 then v77 else nil, 
    sendFromServerDrivenUi = v92
};