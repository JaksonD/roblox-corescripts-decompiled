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
local v13 = require(script.Parent.GameCard);
local v14 = require(script.Parent.GameCardGroupable);
local v15 = require(script.Parent.GameCardContainer);
local v16 = require(script.Parent.GameCardError);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInvalidGameLinkCard);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewGameCardUI);
local v19 = require(l_Parent_0.HttpRequest);
local v23 = {
    networkImpl = v19.config({
        requestFunction = function(v20, v21, v22) --[[ Line: 35 ]] --[[ Name: requestFunction ]]
            -- upvalues: v11 (copy), v19 (copy)
            v11:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v21, v20));
            return v19.requestFunctions.HttpRbxApi(v20, v21, v22);
        end, 
        maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("PlaceIdContainerHttpRetryCount", 4) else nil
    })
};
local function _(v24, v25) --[[ Line: 55 ]] --[[ Name: getPlaceInfo ]]
    return v24.ChatAppReducer.PlaceInfos[v25] or {};
end;
PlaceIdContainer = function(v27) --[[ Line: 59 ]] --[[ Name: PlaceIdContainer ]]
    -- upvalues: v3 (copy), v23 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_ApiFetchPlaceInfos_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v17 (copy), v4 (copy), l_useEffect_0 (copy), v16 (copy), v18 (copy), v14 (copy), v13 (copy), v15 (copy)
    local v28 = v3.Dictionary.join(v23, v27);
    local v29 = l_useDispatch_0();
    local v32 = l_useCallback_0(function(v30, v31) --[[ Line: 63 ]]
        -- upvalues: v29 (copy), l_ApiFetchPlaceInfos_0 (ref)
        return v29(l_ApiFetchPlaceInfos_0(v30, {
            v31
        }));
    end, l_dependencyArray_0(v29));
    local v35 = l_useSelector_0(function(v33) --[[ Line: 67 ]]
        -- upvalues: v28 (copy)
        local l_placeId_0 = v28.placeId;
        l_placeId_0 = (v33.ChatAppReducer.PlaceInfos[l_placeId_0] or {}).universeId;
        return l_placeId_0 and tostring(l_placeId_0) or nil;
    end);
    local v36 = if v17 then v4.useRef(nil) else {
        current = nil
    };
    local v37 = nil;
    local v38 = nil;
    if v17 then
        local v39, v40 = v4.useState(false);
        v37 = v39;
        v38 = v40;
    end;
    l_useEffect_0(function() --[[ Line: 81 ]]
        -- upvalues: v28 (copy), v32 (copy), v17 (ref), v3 (ref), v35 (copy), v36 (copy), v38 (ref)
        local l_networkImpl_0 = v28.networkImpl;
        local v42 = false;
        v32(l_networkImpl_0, v28.placeId):andThen(function(v43) --[[ Line: 85 ]]
            -- upvalues: v17 (ref), v42 (ref), v3 (ref)
            if v17 then
                v42 = not v3.isEmpty(v43);
            end;
        end);
        if v17 then
            if not v35 then
                if v36.current then
                    task.cancel(v36.current);
                end;
                v36.current = task.delay(1, function() --[[ Line: 97 ]]
                    -- upvalues: v42 (ref), v38 (ref), v36 (ref)
                    if not v42 then
                        v38(true);
                    end;
                    v36.current = nil;
                end);
            end;
            return function() --[[ Line: 105 ]]
                -- upvalues: v36 (ref)
                if v36.current then
                    task.cancel(v36.current);
                    v36.current = nil;
                end;
            end;
        else
            return;
        end;
    end, {});
    if v17 then
        l_useEffect_0(function() --[[ Line: 117 ]]
            -- upvalues: v35 (copy), v36 (copy)
            if v35 and v36.current then
                task.cancel(v36.current);
                v36.current = nil;
            end;
        end, {
            v35
        });
    end;
    if not v35 then
        if v17 and v37 then
            return v4.createElement(v16, {});
        else
            return v4.createElement(if v18 then v14 else v13, {});
        end;
    else
        return v4.createElement(v15, v3.Dictionary.join(v28, {
            universeId = v35
        }));
    end;
end;
return l_memo_0(PlaceIdContainer);