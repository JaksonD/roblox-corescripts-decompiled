local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetFavorites");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_StatusCodes_0 = require(l_script_FirstAncestor_0.Parent.Http).StatusCodes;
local v4 = require(l_script_FirstAncestor_0.Parent.HttpRequest);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v6 = require(l_script_FirstAncestor_0.Hooks.useLocalUserId);
local v7 = require(l_script_FirstAncestor_0.Requests.GetFavoriteForAsset);
local v8 = require(l_script_FirstAncestor_0.Requests.PostFavoriteForAsset);
local v9 = require(l_script_FirstAncestor_0.Requests.DeleteFavoriteForAsset);
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v11 = require(l_script_FirstAncestor_0.Parent.Promise);
local v12 = require(l_script_FirstAncestor_0.logger);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local l_useRef_0 = v2.useRef;
local l_useMemo_0 = v2.useMemo;
local v18 = v4.config({
    requestFunction = v4.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("UseAssetFavoritingHttpRetryCount", 4) else nil
});
return function(v19) --[[ Line: 32 ]] --[[ Name: useAssetFavoriting ]]
    -- upvalues: v6 (copy), l_useState_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v12 (copy), v11 (copy), v9 (copy), v18 (copy), v8 (copy), l_useMemo_0 (copy), v1 (copy), l_useEffect_0 (copy), v7 (copy), l_StatusCodes_0 (copy)
    local v20 = v6();
    local v21, v22 = l_useState_0({});
    local v23 = l_useRef_0({});
    local v25 = l_useCallback_0(function(v24) --[[ Line: 42 ]]
        -- upvalues: v12 (ref), v20 (copy)
        if not v24 then
            return false;
        elseif v24 <= 0 or v24 % 1 ~= 0 then
            v12:warning((("validation failed (assetId must be a positive int, got %*)"):format(v24)));
            return false;
        elseif not v20 or v20 <= 0 then
            v12:warning((("validation failed (userId must be a positive int, got %*)"):format(v20)));
            return false;
        else
            return true;
        end;
    end, {
        v20
    });
    local v26 = l_useCallback_0(function() --[[ Line: 62 ]]
        -- upvalues: v21 (copy)
        return v21;
    end, {
        v21
    });
    local v29 = l_useCallback_0(function(v27) --[[ Line: 66 ]]
        -- upvalues: v21 (copy)
        local v28 = v21[tostring(v27)];
        if v28 ~= nil then
            return v28;
        else
            return false;
        end;
    end, {
        v21
    });
    local v31 = l_useCallback_0(function(v30) --[[ Line: 71 ]]
        -- upvalues: v21 (copy)
        return v21[tostring(v30)] ~= nil;
    end, {
        v21
    });
    local v33 = l_useCallback_0(function(v32) --[[ Line: 75 ]]
        -- upvalues: v23 (copy)
        return v23.current[tostring(v32)] ~= nil;
    end, {});
    local v38 = l_useCallback_0(function(v34, v35) --[[ Line: 79 ]]
        -- upvalues: v22 (copy)
        v22(function(v36) --[[ Line: 80 ]]
            -- upvalues: v34 (copy), v35 (copy)
            local v37 = table.clone(v36);
            v37[tostring(v34)] = v35;
            return v37;
        end);
    end, {});
    local v43 = l_useCallback_0(function(v39) --[[ Line: 87 ]]
        -- upvalues: v25 (copy), v11 (ref), v29 (copy), v38 (copy), v9 (ref), v18 (ref), v20 (copy), v8 (ref), v12 (ref)
        if not v25(v39) then
            return v11.resolve(nil);
        else
            local v40 = v29(v39);
            local _ = nil;
            v38(v39, not v40);
            return (if v40 then v9(v18, tostring(v20), (tostring(v39))) else v8(v18, tostring(v20), (tostring(v39)))):catch(function(v42) --[[ Line: 106 ]]
                -- upvalues: v38 (ref), v39 (copy), v40 (copy), v12 (ref)
                v38(v39, v40);
                v12:warning(v42.StatusMessage);
            end):andThenReturn(not v40);
        end;
    end, {
        v20, 
        v25, 
        v29
    });
    local v45 = l_useMemo_0(function() --[[ Line: 114 ]]
        -- upvalues: v1 (ref), v19 (copy), v25 (copy), v31 (copy), v33 (copy)
        return v1.List.filter(v19, function(v44) --[[ Line: 115 ]]
            -- upvalues: v25 (ref), v31 (ref), v33 (ref)
            return v25(v44) and not v31(v44) and not v33(v44);
        end);
    end, v1.List.join(v19, {
        v31, 
        v33, 
        v25
    }));
    l_useEffect_0(function() --[[ Line: 120 ]]
        -- upvalues: v45 (copy), v23 (copy), v38 (copy), v12 (ref), v7 (ref), v18 (ref), v20 (copy), l_StatusCodes_0 (ref)
        for _, v47 in v45 do
            local v48 = tostring(v47);
            v23.current[v48] = true;
            v38(v47, false);
            v12:debug((("fetching initial favorite status for asset %*"):format(v47)));
            v7(v18, tostring(v20), v48):andThen(function(v49) --[[ Line: 129 ]]
                -- upvalues: l_StatusCodes_0 (ref), v38 (ref), v47 (copy)
                if v49.responseCode == l_StatusCodes_0.OK and v49.responseBody then
                    v38(v47, true);
                end;
            end):catch(function(v50) --[[ Line: 138 ]]
                -- upvalues: v12 (ref)
                v12:warning(v50.StatusMessage);
            end):finally(function() --[[ Line: 141 ]]
                -- upvalues: v23 (ref), v48 (copy)
                v23.current[v48] = nil;
            end);
        end;
    end, {
        v45, 
        v20
    });
    return {
        getAll = v26, 
        getByAssetId = v29, 
        toggleFavorite = v43, 
        isLoading = v33
    };
end;