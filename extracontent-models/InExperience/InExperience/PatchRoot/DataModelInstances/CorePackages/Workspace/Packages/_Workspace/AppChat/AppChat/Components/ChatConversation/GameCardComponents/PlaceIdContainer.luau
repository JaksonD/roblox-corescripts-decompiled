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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v22 = {
    networkImpl = v17.config({
        requestFunction = function(v19, v20, v21) --[[ Line: 35 ]] --[[ Name: requestFunction ]]
            -- upvalues: v11 (copy), v17 (copy)
            v11:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v20, v19));
            return v17.requestFunctions.HttpRbxApi(v19, v20, v21);
        end, 
        maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("PlaceIdContainerHttpRetryCount", 4) else nil
    })
};
local function _(v23, v24) --[[ Line: 55 ]] --[[ Name: getPlaceInfo ]]
    return v23.ChatAppReducer.PlaceInfos[v24] or {};
end;
PlaceIdContainer = function(v26) --[[ Line: 59 ]] --[[ Name: PlaceIdContainer ]]
    -- upvalues: v3 (copy), v22 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_ApiFetchPlaceInfos_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v16 (copy), v4 (copy), l_useEffect_0 (copy), v15 (copy), v13 (copy), v14 (copy)
    local v27 = v3.Dictionary.join(v22, v26);
    local v28 = l_useDispatch_0();
    local v31 = l_useCallback_0(function(v29, v30) --[[ Line: 63 ]]
        -- upvalues: v28 (copy), l_ApiFetchPlaceInfos_0 (ref)
        return v28(l_ApiFetchPlaceInfos_0(v29, {
            v30
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v28
    } else l_dependencyArray_0(v28));
    local v34 = l_useSelector_0(function(v32) --[[ Line: 67 ]]
        -- upvalues: v27 (copy)
        local l_placeId_0 = v27.placeId;
        l_placeId_0 = (v32.ChatAppReducer.PlaceInfos[l_placeId_0] or {}).universeId;
        return l_placeId_0 and tostring(l_placeId_0) or nil;
    end);
    local v35 = if v16 then v4.useRef(nil) else {
        current = nil
    };
    local v36 = nil;
    local v37 = nil;
    if v16 then
        local v38, v39 = v4.useState(false);
        v36 = v38;
        v37 = v39;
    end;
    l_useEffect_0(function() --[[ Line: 81 ]]
        -- upvalues: v27 (copy), v31 (copy), v16 (ref), v3 (ref), v34 (copy), v35 (copy), v37 (ref)
        local l_networkImpl_0 = v27.networkImpl;
        local v41 = false;
        v31(l_networkImpl_0, v27.placeId):andThen(function(v42) --[[ Line: 85 ]]
            -- upvalues: v16 (ref), v41 (ref), v3 (ref)
            if v16 then
                v41 = not v3.isEmpty(v42);
            end;
        end);
        if v16 then
            if not v34 then
                if v35.current then
                    task.cancel(v35.current);
                end;
                v35.current = task.delay(1, function() --[[ Line: 97 ]]
                    -- upvalues: v41 (ref), v37 (ref), v35 (ref)
                    if not v41 then
                        v37(true);
                    end;
                    v35.current = nil;
                end);
            end;
            return function() --[[ Line: 105 ]]
                -- upvalues: v35 (ref)
                if v35.current then
                    task.cancel(v35.current);
                    v35.current = nil;
                end;
            end;
        else
            return;
        end;
    end, {});
    if v16 then
        l_useEffect_0(function() --[[ Line: 117 ]]
            -- upvalues: v34 (copy), v35 (copy)
            if v34 and v35.current then
                task.cancel(v35.current);
                v35.current = nil;
            end;
        end, {
            v34
        });
    end;
    if not v34 then
        if v16 and v36 then
            return v4.createElement(v15, {});
        else
            return v4.createElement(v13, {
                isLoading = true, 
                gameName = "", 
                gameThumbnail = ""
            });
        end;
    else
        return v4.createElement(v14, v3.Dictionary.join(v27, {
            universeId = v34
        }));
    end;
end;
return l_memo_0(PlaceIdContainer);