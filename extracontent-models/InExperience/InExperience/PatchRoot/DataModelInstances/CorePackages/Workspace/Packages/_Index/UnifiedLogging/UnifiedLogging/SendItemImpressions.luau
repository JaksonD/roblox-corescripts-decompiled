local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UnifiedLogging");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Cryo);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v6 = require(l_script_FirstAncestor_0.ContentType);
local v7 = require(l_script_FirstAncestor_0.itemImpressionsEvent);
local v8 = require(l_script_FirstAncestor_0.sduiCustomImpressionsEvent);
local v9 = require(l_script_FirstAncestor_0.userEntryUtils);
local v10 = require(l_script_FirstAncestor_0.buildItemMetadataFields);
local v11 = require(l_script_FirstAncestor_0.buildGameMetadataFields);
local _ = require(l_script_FirstAncestor_0.SduiAnalyticsTypes);
local l_FFlagLuaAppDesktopFriendCarouselClicks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDesktopFriendCarouselClicks;
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
local l_FFlagItemImpressionsAddGameMetadata_0 = require(l_Parent_0.SharedFlags).FFlagItemImpressionsAddGameMetadata;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
local function v41(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27) --[[ Line: 26 ]]
    -- upvalues: v3 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy)
    local v28 = {};
    local v29 = {};
    local v30 = {};
    local v31 = {};
    local v32 = {};
    local v33 = {};
    for _, v35 in v18 do
        local v36 = v19 and v19[v35] or nil;
        if v36 ~= nil then
            table.insert(v28, v36.id);
            table.insert(v29, v35);
            table.insert(v31, v35);
            local v37 = nil;
            local v38 = nil;
            if v21 and v21 > 0 then
                v37 = math.ceil(v35 / v21);
                v38 = v35 % v21;
                if v38 == 0 then
                    v38 = v21;
                end;
                table.insert(v30, v37);
            else
                v3.assert(v21 ~= 0);
                v37 = 1;
                v38 = v35;
            end;
            if v27 then
                table.insert(v32, v27 + v37 - 1);
                table.insert(v33, v38);
            end;
        else
            l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsEventNilEntry", ("Entry at index %* was nil when sending item impressions for collection %*"):format(v35, v23), {
                entryIndex = v35, 
                collectionId = v23
            });
        end;
    end;
    local v39 = #v28;
    v3.assert(v39 == #v29);
    if #v30 > 0 then
        v3.assert(v39 == #v30);
    end;
    if #v32 > 0 then
        v3.assert(v39 == #v32);
    end;
    if #v33 > 0 then
        v3.assert(v39 == #v33);
    end;
    local v40 = {
        contentType = v20, 
        itemIds = table.concat(v28, ","), 
        itemPositions = table.concat(v29, ","), 
        positionsInTopic = table.concat(v31, ","), 
        collectionPosition = v22, 
        collectionId = v23, 
        totalNumberOfItems = if v24 then v24 else if v19 then #v19 else 0, 
        collectionComponentType = v25, 
        collectionIdStr = if l_FFlagProfilePlatformEnableImpressions_0 then v26 else nil
    };
    if #v30 > 0 then
        v40.rowNumbers = table.concat(v30, ",");
    end;
    if #v32 > 0 then
        v40.feedRowNumbers = table.concat(v32, ",");
    end;
    if #v33 > 0 then
        v40.positionsInRow = table.concat(v33, ",");
    end;
    return v40;
end;
local function v52(v42, v43, v44) --[[ Line: 126 ]]
    -- upvalues: l_FFlagLuaAppDesktopFriendCarouselClicks_0 (copy), v9 (copy)
    local v45 = {};
    local v46 = {};
    local v47 = {};
    for _, v49 in v42 do
        local v50 = v43 and v43[v49] or nil;
        if v50 ~= nil then
            if l_FFlagLuaAppDesktopFriendCarouselClicks_0 then
                local v51 = v9.extractFieldsFromUserEntry(v50);
                table.insert(v45, v51.presence);
                table.insert(v46, v51.friendStatus);
                table.insert(v47, v51.presenceUniverseId);
            else
                table.insert(v45, v50.presence and v50.presence.userPresenceType or "");
                table.insert(v46, v50.isFriend and "friend" or "notFriend");
                table.insert(v47, if v50.presence and v50.presence.universeId and v50.presence.universeId ~= "" then v50.presence.universeId else "-1");
            end;
        end;
    end;
    return {
        sourceCarousel = v44, 
        presences = table.concat(v45, ","), 
        friendStatuses = table.concat(v46, ","), 
        presenceUniverseIds = table.concat(v47, ",")
    };
end;
local function v66(v53, v54, v55, v56, v57, v58, v59, v60) --[[ Line: 167 ]]
    -- upvalues: l_FFlagLuaAppDesktopFriendCarouselClicks_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v6 (copy), v41 (copy), v52 (copy), v4 (copy), v7 (copy)
    if not v53 or not v54 then
        if l_FFlagLuaAppDesktopFriendCarouselClicks_0 then
            l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsService", ("Event Ingest or App Analytics was nil when trying to send itemImpressions for collection %*"):format(v59), {
                eventIngest = v53, 
                appAnalytics = v54, 
                sortId = v59
            });
        end;
        return;
    elseif not v55 or #v55 == 0 then
        return;
    elseif not v56 or #v56 == 0 then
        return;
    else
        local v61 = #v56;
        local l_User_0 = v6.User;
        local v63 = v41(v55, v56, l_User_0, v61, v58, v59);
        local v64 = v52(v55, v56, v60);
        local v65 = v4.Dictionary.union(v63, v64);
        v7(v53, v57, l_User_0, v65);
        return;
    end;
end;
local v79 = l_FFlagProfilePlatformEnableImpressions_0 and function(v67, v68, v69, v70, v71, v72, v73, v74, v75) --[[ Line: 215 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v41 (copy), l_FFlagItemImpressionsAddGameMetadata_0 (copy), v6 (copy), v11 (copy), v4 (copy), v7 (copy)
    if not v67 or not v68 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsFromProfile", ("Event Ingest or App Analytics was nil when trying to send itemImpressions for collection %* on Profile Platform"):format(v75), {
            eventIngest = v67, 
            appAnalytics = v68, 
            collectionIdStr = v75
        });
        return;
    elseif not v69 or #v69 == 0 then
        return;
    elseif not v70 or #v70 == 0 then
        return;
    else
        local v76 = v41(v69, v70, v73, v71, v74, nil, #v70, nil, v75);
        if l_FFlagItemImpressionsAddGameMetadata_0 then
            local l_v76_0 = v76;
            if v73 == v6.Game then
                local v78 = v11(v69, v70, v75);
                l_v76_0 = v4.Dictionary.union(l_v76_0, v78);
            end;
            v7(v67, v72, v73, l_v76_0);
            return;
        else
            v7(v67, v72, v73, v76);
            return;
        end;
    end;
end or nil;
local function v95(v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90) --[[ Line: 274 ]] --[[ Name: sendFromServerDrivenUi ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v41 (copy), v10 (copy), v4 (copy), l_AppStorageService_0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), v8 (copy), v7 (copy)
    if not v80 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsFromSduiNilService", ("Event Ingest was nil when trying to send itemImpressions for collection %*"):format(v85), {
            collectionId = v85
        });
        return;
    elseif not v81 or #v81 == 0 then
        return;
    elseif not v82 or #v82 == 0 then
        return;
    elseif not v83 then
        return;
    else
        local v91 = v41(v81, v82, v86, v87, v88, v85, v83.totalNumberOfItems, v83.collectionComponentType, nil, v89);
        local v92 = v10(v81, v82, v85);
        local v93 = v4.Dictionary.join(v83, v92, v91);
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
            v93.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
        end;
        if v93.collectionId and type(v93.collectionId) == "string" and type((tonumber(v93.collectionId))) ~= "number" then
            v93.collectionIdStr = v93.collectionId;
            v93.collectionId = nil;
        end;
        if l_FFlagSduiImpressionHandlerRegistry_0 and v90 then
            v8(v90, v84, v93);
            return;
        else
            v7(v80, v84, v86, v93);
            return;
        end;
    end;
end;
local function v109(v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106) --[[ Line: 347 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v41 (copy), l_FFlagItemImpressionsAddGameMetadata_0 (copy), v6 (copy), v11 (copy), v4 (copy), v7 (copy)
    if not v96 or not v97 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemImpressionsService", ("Event Ingest or App Analytics was nil when trying to send itemImpressions for collection %*"):format(v105), {
            eventIngest = v96, 
            appAnalytics = v97, 
            sortId = v105
        });
        return;
    elseif not v98 or #v98 == 0 then
        return;
    elseif not v99 or #v99 == 0 then
        return;
    else
        local v107 = v41(v98, v99, v103, v100, v102, v105, v104, nil, v106);
        if l_FFlagItemImpressionsAddGameMetadata_0 then
            if v103 == v6.Game then
                local v108 = v11(v98, v99, v106);
                v107 = v4.Dictionary.union(v107, v108);
            end;
            v7(v96, v101, v103, v107);
            return;
        else
            v7(v96, v101, v103, v107);
            return;
        end;
    end;
end;
return {
    sendFromFriendsCarousel = v66, 
    sendFromItemCollection = if l_FFlagEnableTopSongsSort_0 then v109 else nil, 
    sendFromProfile = if l_FFlagProfilePlatformEnableImpressions_0 then v79 else nil, 
    sendFromServerDrivenUi = v95
};