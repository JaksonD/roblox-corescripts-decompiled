local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.AXCommon);
local v5 = require(l_Parent_0.Dash);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_SafeAppStorageService_0 = v4.Lib.SafeAppStorageService;
local v8 = require(script.Parent.getLocalUserId);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFIntAXMaxRecentlyViewedSearchItems);
local v10 = game:DefineFastFlag("AXEnableRecentlyViewedSearchItemsErrorLogging", false);
local function _() --[[ Line: 31 ]] --[[ Name: getUserId ]]
    -- upvalues: v8 (copy), l_Players_0 (copy)
    return v8(l_Players_0) or "defaultUserId";
end;
local function v18() --[[ Line: 38 ]] --[[ Name: getItems ]]
    -- upvalues: v8 (copy), l_Players_0 (copy), l_SafeAppStorageService_0 (copy), l_HttpService_0 (copy), v10 (copy), l_mutedError_0 (copy)
    local v12 = v8(l_Players_0) or "defaultUserId";
    local v13 = l_SafeAppStorageService_0.getItem("AXMarketplaceRecentlyViewedItems");
    if not v13 or v13 == "" then
        v13 = "{}";
    end;
    local v14 = {};
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
        -- upvalues: l_HttpService_0 (ref), v13 (ref), v12 (copy), v14 (ref)
        local v15 = l_HttpService_0:JSONDecode(v13);
        if v15.userId == v12 then
            v14 = v15.items;
        end;
    end);
    if v10 and l_status_0 == false then
        l_mutedError_0((("RecentlyViewedSearchItemsAppStorage getItems JSONDecode error: %*"):format(l_result_0)));
    end;
    return v14;
end;
local function _(v19, v20) --[[ Line: 67 ]] --[[ Name: removeItem ]]
    -- upvalues: v18 (copy), v5 (copy)
    local v21 = v18();
    return v5.filter(v21, function(v22) --[[ Line: 69 ]]
        -- upvalues: v19 (copy), v20 (copy)
        local v23 = true;
        if v22.id == v19 then
            v23 = v22.itemType ~= v20;
        end;
        return v23;
    end);
end;
local function _(v25) --[[ Line: 74 ]] --[[ Name: saveItems ]]
    -- upvalues: v8 (copy), l_Players_0 (copy), l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v10 (copy), l_mutedError_0 (copy)
    local v26 = v8(l_Players_0) or "defaultUserId";
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 77 ]]
        -- upvalues: l_HttpService_0 (ref), v26 (copy), v25 (copy), l_SafeAppStorageService_0 (ref)
        local v27 = l_HttpService_0:JSONEncode({
            userId = v26, 
            items = v25
        });
        l_SafeAppStorageService_0.setItem("AXMarketplaceRecentlyViewedItems", v27);
        l_SafeAppStorageService_0.flush();
    end);
    if v10 and l_status_1 == false then
        l_mutedError_0((("RecentlyViewedSearchItemsAppStorage saveItems JSONEncode error: %*"):format(l_result_1)));
    end;
end;
return {
    clearItems = function() --[[ Line: 93 ]] --[[ Name: clearItems ]]
        -- upvalues: l_SafeAppStorageService_0 (copy)
        l_SafeAppStorageService_0.setItem("AXMarketplaceRecentlyViewedItems", "{}");
        l_SafeAppStorageService_0.flush();
    end, 
    getItems = function() --[[ Line: 98 ]] --[[ Name: getItems ]]
        -- upvalues: v18 (copy)
        return (v18());
    end, 
    removeItem = function(v31, v32) --[[ Line: 102 ]] --[[ Name: removeItem ]]
        -- upvalues: v18 (copy), v5 (copy), v8 (copy), l_Players_0 (copy), l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v10 (copy), l_mutedError_0 (copy)
        local v33 = v18();
        local v36 = v5.filter(v33, function(v34) --[[ Line: 69 ]]
            -- upvalues: v31 (copy), v32 (copy)
            local v35 = true;
            if v34.id == v31 then
                v35 = v34.itemType ~= v32;
            end;
            return v35;
        end);
        v33 = v8(l_Players_0) or "defaultUserId";
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 77 ]]
            -- upvalues: l_HttpService_0 (ref), v33 (copy), v36 (copy), l_SafeAppStorageService_0 (ref)
            local v37 = l_HttpService_0:JSONEncode({
                userId = v33, 
                items = v36
            });
            l_SafeAppStorageService_0.setItem("AXMarketplaceRecentlyViewedItems", v37);
            l_SafeAppStorageService_0.flush();
        end);
        if v10 and l_status_2 == false then
            l_mutedError_0((("RecentlyViewedSearchItemsAppStorage saveItems JSONEncode error: %*"):format(l_result_2)));
        end;
        return v36;
    end, 
    addItem = function(v40, v41) --[[ Line: 108 ]] --[[ Name: addItem ]]
        -- upvalues: v18 (copy), v5 (copy), v9 (copy), v8 (copy), l_Players_0 (copy), l_HttpService_0 (copy), l_SafeAppStorageService_0 (copy), v10 (copy), l_mutedError_0 (copy)
        local v42 = v18();
        local v45 = v5.filter(v42, function(v43) --[[ Line: 69 ]]
            -- upvalues: v40 (copy), v41 (copy)
            local v44 = true;
            if v43.id == v40 then
                v44 = v43.itemType ~= v41;
            end;
            return v44;
        end);
        table.insert(v45, 1, {
            id = v40, 
            itemType = v41
        });
        if #v45 > v9() then
            table.remove(v45);
        end;
        v42 = v8(l_Players_0) or "defaultUserId";
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 77 ]]
            -- upvalues: l_HttpService_0 (ref), v42 (copy), v45 (copy), l_SafeAppStorageService_0 (ref)
            local v46 = l_HttpService_0:JSONEncode({
                userId = v42, 
                items = v45
            });
            l_SafeAppStorageService_0.setItem("AXMarketplaceRecentlyViewedItems", v46);
            l_SafeAppStorageService_0.flush();
        end);
        if v10 and l_status_3 == false then
            l_mutedError_0((("RecentlyViewedSearchItemsAppStorage saveItems JSONEncode error: %*"):format(l_result_3)));
        end;
        return v45;
    end
};