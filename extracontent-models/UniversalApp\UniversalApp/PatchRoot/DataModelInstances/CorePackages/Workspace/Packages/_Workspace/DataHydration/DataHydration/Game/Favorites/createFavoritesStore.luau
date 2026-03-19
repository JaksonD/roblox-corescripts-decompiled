local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.createDataCache);
local v3 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v5 = require(script.Parent.FavoritesStoreTypes);
local v6 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v6.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v6.DiscoveryEventErrorLogger;
local v9 = require(script.Parent.fetchFavorite);
local v10 = require(script.Parent.requestFavoriteUpdate);
local v11 = require(l_Parent_0.Signals);
local v12 = require(script.Parent.FavoritesUrlBuilder);
local _ = require(l_Parent_0.LuauPolyfill);
local l_FFlagLuaAppDataHydrationUpdateItem_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDataHydrationUpdateItem;
return function() --[[ Line: 19 ]] --[[ Name: createFavoritesStore ]]
    -- upvalues: v2 (copy), v3 (copy), l_logResponseError_0 (copy), v12 (copy), v9 (copy), v5 (copy), l_DiscoveryEventErrorLogger_0 (copy), v11 (copy), v10 (copy), l_FFlagLuaAppDataHydrationUpdateItem_0 (copy)
    local v15 = v2();
    local v21 = v3({
        cache = v15, 
        supportsMultiGet = false, 
        logError = function(v16) --[[ Line: 24 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), v12 (ref)
            l_logResponseError_0(v12.FAVORITE_URL, v16);
        end, 
        fetchFn = function(v17, _) --[[ Line: 27 ]] --[[ Name: fetchFn ]]
            -- upvalues: v9 (ref), v5 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            return v9(v17):andThen(function(v19) --[[ Line: 31 ]]
                -- upvalues: v5 (ref), l_DiscoveryEventErrorLogger_0 (ref), v17 (copy)
                local l_responseBody_0 = v19.responseBody;
                if not v5.favoriteResponseValidator(l_responseBody_0) then
                    l_DiscoveryEventErrorLogger_0.reportError("createFavoritesStore", "Invalid favorite response", {
                        universeId = v17, 
                        responseBody = l_responseBody_0
                    });
                    error({
                        StatusCode = v19.responseCode
                    });
                end;
                return l_responseBody_0.isFavorited;
            end);
        end
    });
    local function v31(v22, v23) --[[ Line: 46 ]] --[[ Name: updateFavorite ]]
        -- upvalues: v11 (ref), v15 (copy), v10 (ref), l_DiscoveryEventErrorLogger_0 (ref), l_logResponseError_0 (ref), v12 (ref)
        local v24, v25 = v11.createSignal(nil);
        local v26 = v15.getItem(v22).data(false);
        v15.updateItem(v22, v23);
        v10(v22, v23):andThen(function(_) --[[ Line: 61 ]]
            -- upvalues: v25 (copy), v23 (copy)
            v25({
                type = "success", 
                isFavorited = v23
            });
        end):catch(function(v28) --[[ Line: 67 ]]
            -- upvalues: v15 (ref), v22 (copy), v26 (copy), l_DiscoveryEventErrorLogger_0 (ref), l_logResponseError_0 (ref), v12 (ref), v25 (copy)
            v15.updateItem(v22, v26);
            local v29 = if type(v28) == "table" and v28.StatusCode then v28.StatusCode else nil;
            local v30 = if type(v28) == "table" and v28.StatusMessage then v28.StatusMessage else nil;
            l_DiscoveryEventErrorLogger_0.reportError("updateFavorite", "Error updating favorite", {
                universeId = v22, 
                statusCode = v29, 
                statusMessage = v30
            });
            l_logResponseError_0(v12.FAVORITE_UPDATE_URL, {
                StatusCode = v29
            });
            v25({
                type = "error", 
                error = tostring(v28)
            });
        end);
        return v24;
    end;
    return {
        fetchFavorite = v21.fetchItem, 
        fetchFavorites = v21.fetchItems, 
        getFavorite = v21.getCachedItem, 
        getFavorites = v21.getCachedItems, 
        getAndFetchFavorite = v21.getAndFetchItem, 
        getAndFetchFavorites = v21.getAndFetchItems, 
        updateFavorite = v31, 
        updateItem = if l_FFlagLuaAppDataHydrationUpdateItem_0 then v15.updateItem else nil, 
        clear = function() --[[ Line: 90 ]] --[[ Name: clear ]]
            -- upvalues: v15 (copy), v21 (copy)
            v15.clear();
            v21.clear();
        end, 
        dispose = function() --[[ Line: 95 ]] --[[ Name: dispose ]]
            -- upvalues: v21 (copy)
            v21.dispose();
        end
    };
end;