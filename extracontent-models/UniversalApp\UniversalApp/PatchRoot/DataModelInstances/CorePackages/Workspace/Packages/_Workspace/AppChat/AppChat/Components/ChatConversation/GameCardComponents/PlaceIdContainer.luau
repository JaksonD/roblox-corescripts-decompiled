local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_Parent_0.Loggers).Logger:new("PlaceIdContainer");
local l_ApiFetchPlaceInfos_0 = require(l_Parent_0.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local v13 = require(script.Parent.GameCardGroupable);
local v14 = require(script.Parent.GameCardContainer);
local v15 = require(script.Parent.GameCardError);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInvalidGameLinkCard);
local v17 = require(l_Parent_0.HttpRequest);
local v21 = {
    networkImpl = v17.config({
        requestFunction = function(v18, v19, v20) --[[ Line: 33 ]] --[[ Name: requestFunction ]]
            -- upvalues: v11 (copy), v17 (copy)
            v11:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v19, v18));
            return v17.requestFunctions.HttpRbxApi(v18, v19, v20);
        end, 
        maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("PlaceIdContainerHttpRetryCount", 4) else nil
    })
};
local function _(v22, v23) --[[ Line: 53 ]] --[[ Name: getPlaceInfo ]]
    return v22.ChatAppReducer.PlaceInfos[v23] or {};
end;
PlaceIdContainer = function(v25) --[[ Line: 57 ]] --[[ Name: PlaceIdContainer ]]
    -- upvalues: v3 (copy), v21 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_ApiFetchPlaceInfos_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v16 (copy), v4 (copy), l_useEffect_0 (copy), v15 (copy), v13 (copy), v14 (copy)
    local v26 = v3.Dictionary.join(v21, v25);
    local v27 = l_useDispatch_0();
    local v30 = l_useCallback_0(function(v28, v29) --[[ Line: 61 ]]
        -- upvalues: v27 (copy), l_ApiFetchPlaceInfos_0 (ref)
        return v27(l_ApiFetchPlaceInfos_0(v28, {
            v29
        }));
    end, l_dependencyArray_0(v27));
    local v33 = l_useSelector_0(function(v31) --[[ Line: 65 ]]
        -- upvalues: v26 (copy)
        local l_placeId_0 = v26.placeId;
        l_placeId_0 = (v31.ChatAppReducer.PlaceInfos[l_placeId_0] or {}).universeId;
        return l_placeId_0 and tostring(l_placeId_0) or nil;
    end);
    local v34 = if v16 then v4.useRef(nil) else {
        current = nil
    };
    local v35 = nil;
    local v36 = nil;
    if v16 then
        local v37, v38 = v4.useState(false);
        v35 = v37;
        v36 = v38;
    end;
    l_useEffect_0(function() --[[ Line: 79 ]]
        -- upvalues: v26 (copy), v30 (copy), v16 (ref), v3 (ref), v33 (copy), v34 (copy), v36 (ref)
        local l_networkImpl_0 = v26.networkImpl;
        local v40 = false;
        v30(l_networkImpl_0, v26.placeId):andThen(function(v41) --[[ Line: 83 ]]
            -- upvalues: v16 (ref), v40 (ref), v3 (ref)
            if v16 then
                v40 = not v3.isEmpty(v41);
            end;
        end);
        if v16 then
            if not v33 then
                if v34.current then
                    task.cancel(v34.current);
                end;
                v34.current = task.delay(1, function() --[[ Line: 95 ]]
                    -- upvalues: v40 (ref), v36 (ref), v34 (ref)
                    if not v40 then
                        v36(true);
                    end;
                    v34.current = nil;
                end);
            end;
            return function() --[[ Line: 103 ]]
                -- upvalues: v34 (ref)
                if v34.current then
                    task.cancel(v34.current);
                    v34.current = nil;
                end;
            end;
        else
            return;
        end;
    end, {});
    if v16 then
        l_useEffect_0(function() --[[ Line: 115 ]]
            -- upvalues: v33 (copy), v34 (copy)
            if v33 and v34.current then
                task.cancel(v34.current);
                v34.current = nil;
            end;
        end, {
            v33
        });
    end;
    if not v33 then
        if v16 and v35 then
            return v4.createElement(v15, {});
        else
            return v4.createElement(v13, {
                isLoading = true, 
                gameName = "", 
                gameThumbnail = ""
            });
        end;
    else
        return v4.createElement(v14, v3.Dictionary.join(v26, {
            universeId = v33
        }));
    end;
end;
return l_memo_0(PlaceIdContainer);