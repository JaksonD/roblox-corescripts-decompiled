local l_game_EngineFeature_0 = game:GetEngineFeature("AXMarketplaceHeadTooltipKeys");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = game:DefineFastInt("AXHeadCategoryCombineTooltipExpirationDurationDays", 7);
local l_l_AppStorageService_0_0 = l_AppStorageService_0;
local function v10() --[[ Line: 15 ]] --[[ Name: getMockAppStorageService ]]
    return {
        storage = {}, 
        GetItem = function(v4, v5) --[[ Line: 18 ]] --[[ Name: GetItem ]]
            return v4.storage[v5];
        end, 
        SetItem = function(v6, v7, v8) --[[ Line: 21 ]] --[[ Name: SetItem ]]
            v6.storage[v7] = v8;
        end, 
        Flush = function(_) --[[ Line: 24 ]] --[[ Name: Flush ]]

        end
    };
end;
if not l_game_EngineFeature_0 then
    l_l_AppStorageService_0_0 = v10();
end;
local function _() --[[ Line: 37 ]] --[[ Name: getStoredState ]]
    -- upvalues: l_l_AppStorageService_0_0 (ref)
    local v11 = nil;
    pcall(function() --[[ Line: 39 ]]
        -- upvalues: v11 (ref), l_l_AppStorageService_0_0 (ref)
        v11 = l_l_AppStorageService_0_0:GetItem("AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestamp") or nil;
    end);
    return v11;
end;
local v17 = {
    __mockAppStorageService = function(v13) --[[ Line: 51 ]] --[[ Name: __mockAppStorageService ]]
        -- upvalues: l_l_AppStorageService_0_0 (ref), v10 (copy)
        l_l_AppStorageService_0_0 = v13 or v10();
    end, 
    getSeenTimestamp = function() --[[ Line: 55 ]] --[[ Name: getSeenTimestamp ]]
        -- upvalues: l_l_AppStorageService_0_0 (ref)
        local v14 = nil;
        local v15;
        do
            local l_v14_0 = v14;
            pcall(function() --[[ Line: 39 ]]
                -- upvalues: l_v14_0 (ref), l_l_AppStorageService_0_0 (ref)
                l_v14_0 = l_l_AppStorageService_0_0:GetItem("AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestamp") or nil;
            end);
            v15 = l_v14_0;
        end;
        if v15 then
            return (tonumber(v15));
        else
            return nil;
        end;
    end, 
    setSeenTimestamp = function() --[[ Line: 60 ]] --[[ Name: setSeenTimestamp ]]
        -- upvalues: l_l_AppStorageService_0_0 (ref)
        pcall(function() --[[ Line: 61 ]]
            -- upvalues: l_l_AppStorageService_0_0 (ref)
            l_l_AppStorageService_0_0:SetItem("AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestamp", (tostring(os.time())));
            l_l_AppStorageService_0_0:Flush();
        end);
    end
};
v17.shouldShowTooltip = function() --[[ Line: 67 ]] --[[ Name: shouldShowTooltip ]]
    -- upvalues: v17 (copy), v2 (copy)
    local v18 = v17.getSeenTimestamp();
    if not v18 then
        return true;
    else
        return os.difftime(os.time(), v18) >= v2 * 86400;
    end;
end;
return v17;