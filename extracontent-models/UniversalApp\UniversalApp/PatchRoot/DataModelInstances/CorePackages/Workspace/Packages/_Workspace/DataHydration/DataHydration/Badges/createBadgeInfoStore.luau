local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.createDataCache);
local v5 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(script.Parent.BadgesTypes);
local v8 = require(script.Parent.requestRemoveBadge);
local v9 = require(script.Parent.BadgesUrlBuilder);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local v11 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v11.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v11.DiscoveryEventErrorLogger;
return function() --[[ Line: 28 ]] --[[ Name: createBadgeInfoStore ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v2 (copy), v8 (copy), l_logResponseError_0 (copy), v9 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
    local v14 = v4();
    local v16 = v5({
        cache = v14, 
        fetchFn = function(_) --[[ Line: 32 ]] --[[ Name: fetchFn ]]
            -- upvalues: v3 (ref)
            return v3.resolve({});
        end
    });
    local function v25(v17) --[[ Line: 39 ]] --[[ Name: removeBadge ]]
        -- upvalues: v2 (ref), v14 (copy), v8 (ref), l_logResponseError_0 (ref), v9 (ref), l_DiscoveryEventErrorLogger_0 (ref)
        local v18, v19 = v2.createSignal(nil);
        local v20 = v14.getItem(v17).data(false);
        local v21 = if v20 then v20.isEarnedByUser else nil;
        if v21 == true then
            v14.updateItem(v17, {
                isEarnedByUser = false
            });
        end;
        v8(v17):andThen(function() --[[ Line: 58 ]]
            -- upvalues: v19 (copy)
            v19({
                type = "success"
            });
        end):catch(function(v22) --[[ Line: 63 ]]
            -- upvalues: v20 (copy), v14 (ref), v17 (copy), v21 (copy), v19 (copy), l_logResponseError_0 (ref), v9 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            if v20 then
                v14.updateItem(v17, {
                    isEarnedByUser = v21
                });
            end;
            local v23 = if type(v22) == "table" and v22.StatusCode then v22.StatusCode else nil;
            local v24 = if type(v22) == "table" and v22.StatusMessage then v22.StatusMessage else if type(v22) == "string" then v22 else nil;
            v19({
                type = "error", 
                errorType = "NetworkError", 
                statusCode = v23, 
                statusMessage = v24
            });
            l_logResponseError_0(v9.BADGE_REMOVE_URL, {
                StatusCode = v23
            });
            l_DiscoveryEventErrorLogger_0.reportError("removeBadge", "Error removing badge", {
                badgeId = v17, 
                statusCode = v23, 
                method = "DELETE", 
                statusMessage = v24
            });
        end);
        return v18;
    end;
    return {
        getBadgeInfo = v16.getCachedItem, 
        getBadgeInfos = v16.getCachedItems, 
        updateBadges = v14.updateItems, 
        removeBadge = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v25 else nil, 
        clear = v16.clear, 
        dispose = v16.dispose
    };
end;