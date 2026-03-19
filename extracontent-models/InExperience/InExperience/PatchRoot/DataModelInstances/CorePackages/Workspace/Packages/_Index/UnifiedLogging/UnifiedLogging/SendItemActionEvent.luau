local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UnifiedLogging");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v5 = require(l_script_FirstAncestor_0.ContentType);
local v6 = require(l_script_FirstAncestor_0.itemActionEvent);
local v7 = require(l_script_FirstAncestor_0.userEntryUtils);
local _ = require(l_script_FirstAncestor_0.SduiAnalyticsTypes);
local v9 = require(l_script_FirstAncestor_0.calculateRowPositionFields);
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local function v23(v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22) --[[ Line: 19 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy)
    if not v11 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemActionEventNilEntry", ("Entry at index %* was nil when sending item action event for collection %*"):format(v12, v16), {
            entryIndex = v12, 
            collectionId = v16
        });
        return {};
    else
        return {
            collectionComponentType = v19, 
            itemComponentType = v20, 
            collectionId = v16, 
            collectionPosition = v15, 
            totalNumberOfItems = v17, 
            contentType = v14, 
            itemId = v11.id, 
            itemPosition = v12, 
            positionInRow = v21, 
            rowNumber = v13, 
            feedRowNumber = v22, 
            positionInTopic = v12, 
            actionType = v18
        };
    end;
end;
local function _(v24, v25) --[[ Line: 62 ]]
    -- upvalues: v7 (copy)
    local v26 = v7.extractFieldsFromUserEntry(v24);
    return {
        sourceCarousel = v25, 
        presence = v26.presence, 
        friendStatus = v26.friendStatus, 
        presenceUniverseId = v26.presenceUniverseId
    };
end;
local function v42(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37) --[[ Line: 73 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v5 (copy), v23 (copy), v7 (copy), v3 (copy), v6 (copy)
    if not v28 or not v29 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemActionEventNilService", ("Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection %*"):format(v34), {
            eventIngest = v28, 
            appAnalytics = v29, 
            sortId = v34
        });
        return;
    else
        local l_User_0 = v5.User;
        local v39 = v23(v30, v31, 1, l_User_0, v33, v34, v35, v37);
        local v40 = v7.extractFieldsFromUserEntry(v30);
        local v41 = {
            sourceCarousel = v36, 
            presence = v40.presence, 
            friendStatus = v40.friendStatus, 
            presenceUniverseId = v40.presenceUniverseId
        };
        v40 = v3.Dictionary.union(v39, v41);
        v6(v28, v32, l_User_0, v40);
        return;
    end;
end;
local function v61(v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, _, v54, v55, v56) --[[ Line: 119 ]] --[[ Name: sendFromServerDrivenUi ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v9 (copy), v23 (copy), v3 (copy), l_AppStorageService_0 (copy), v6 (copy)
    if not v43 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemActionEventFromSduiNilService", ("Event Ingest was nil when trying to send an itemActionEvent for collection %*"):format(v48), {
            eventIngest = v43, 
            collectionId = v48
        });
        return;
    else
        local v57 = v9(v45, v50, v56);
        local v58 = v23(v44, v45, v57.rowInSort, v49, v51, v48, v52, v54, v46.collectionComponentType, v44.itemComponentType, v57.positionInRow, v57.rowOnPage);
        local v59 = v3.Dictionary.join(v46, v44, v55 or {}, v58);
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
            v59.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
        end;
        if v59.collectionId and type(v59.collectionId) == "string" and type((tonumber(v59.collectionId))) ~= "number" then
            v59.collectionIdStr = v59.collectionId;
            v59.collectionId = nil;
        end;
        v6(v43, v47, v49, v59);
        return;
    end;
end;
local function v74(v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72) --[[ Line: 186 ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v23 (copy), v6 (copy)
    if not v62 or not v63 then
        l_DiscoveryEventErrorLogger_0.reportError("SendItemActionEventNilServiceItemCollection", "Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection", {
            eventIngest = v62, 
            appAnalytics = v63
        });
        return;
    else
        local v73 = v23(v64, v66, v65, v71, v68, v69, v70, v72);
        v6(v62, v67, v71, v73);
        return;
    end;
end;
return {
    sendFromItemCollection = if l_FFlagEnableTopSongsSort_0 then v74 else nil, 
    sendFromFriendsCarousel = v42, 
    sendFromServerDrivenUi = v61
};