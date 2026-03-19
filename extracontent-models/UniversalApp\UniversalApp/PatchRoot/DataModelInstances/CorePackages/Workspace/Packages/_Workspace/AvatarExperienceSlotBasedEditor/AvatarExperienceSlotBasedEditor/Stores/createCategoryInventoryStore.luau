local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Signals);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v5 = require(l_script_FirstAncestor_0.Enums.InventoryItemType);
local _ = require(l_script_FirstAncestor_0.Enums.InventoryItemAvailability);
local _ = require(script.Parent.Parent.Types);
local l_FFlagAXModeratedItemsFlow_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXInventoryDurablesSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
return function() --[[ Line: 46 ]] --[[ Name: createCategoryInventoryStore ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy), v5 (copy), l_mutedError_0 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    local v11 = nil;
    local v12, v13 = v3.createSignal(nil);
    local v14, v15 = v3.createSignal(false);
    local v16, v17 = v3.createSignal(l_HttpService_0:GenerateGUID(true));
    local function v18() --[[ Line: 55 ]] --[[ Name: startNewSearch ]]
        -- upvalues: v11 (ref), v13 (copy), v15 (copy), v17 (copy), l_HttpService_0 (ref)
        v11.nextPageCursor = nil;
        v13(nil);
        v15(false);
        v17(l_HttpService_0:GenerateGUID(true));
    end;
    local function v26(v19) --[[ Line: 63 ]] --[[ Name: addResultsPage ]]
        -- upvalues: v12 (copy), v5 (ref), l_mutedError_0 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v13 (copy), v11 (ref), v15 (copy)
        local v20 = v12(false);
        local v21 = if v20 then table.clone(v20) else {};
        for _, v23 in v19.avatarInventoryItems do
            local v24 = if v23.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then v5.Asset else if v23.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then v5.Outfit else v5.Unknown;
            if v24 == v5.Unknown then
                l_mutedError_0((("Unknown item type received from user inventory endpoint: %*"):format(v23.itemCategory.itemType)));
            else
                table.insert(v21, {
                    itemId = tostring(v23.itemId), 
                    inventoryItemType = v24, 
                    availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v23.availabilityStatus else nil, 
                    expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v23.expirationTime else nil
                });
            end;
        end;
        v13(v21);
        local l_nextPageToken_0 = v19.nextPageToken;
        v11.nextPageCursor = l_nextPageToken_0;
        if l_nextPageToken_0 == nil or l_nextPageToken_0 == "" then
            v15(true);
        end;
    end;
    v11 = {
        getItems = v12, 
        getHasReachedLastPage = v14, 
        getSearchUuid = v16, 
        nextPageCursor = nil, 
        startNewSearch = v18, 
        addResultsPage = v26
    };
    return v11;
end;