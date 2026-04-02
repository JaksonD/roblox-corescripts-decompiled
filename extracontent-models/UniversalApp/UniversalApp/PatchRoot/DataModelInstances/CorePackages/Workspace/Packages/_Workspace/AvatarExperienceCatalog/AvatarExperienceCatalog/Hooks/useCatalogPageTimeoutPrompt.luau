local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local v5 = require(l_Parent_0.AvatarExperienceNavigation);
local l_getTimeoutStatusStore_0 = v3.Stores.getTimeoutStatusStore;
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_FFlagAXRefetchAvatarOnTimeout_0 = v4.FFlagAXRefetchAvatarOnTimeout;
return function(v9, v10) --[[ Line: 19 ]] --[[ Name: useCatalogPageTimeoutPrompt ]]
    -- upvalues: l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v1 (copy), l_AvatarScreen_0 (copy), l_FFlagAXRefetchAvatarOnTimeout_0 (copy)
    local v11 = l_getTimeoutStatusStore_0();
    local v12 = l_useSignalState_0(v11.getStatus);
    local v13 = l_useSignalState_0(v11.getIsTimedOut);
    local v14 = v1.useRef(false);
    local v15 = v1.useRef(false);
    local v16 = v1.useRef(v9);
    v16.current = v9;
    v1.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v15 (copy), v11 (copy)
        if not v15.current then
            v15.current = true;
            v11.fetchStatus();
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy), v14 (copy), v15 (copy), v16 (copy), l_AvatarScreen_0 (ref)
        if v12 and not v14.current and v15.current and v12.details then
            v14.current = true;
            v16.current.navigate(l_AvatarScreen_0.TimeoutStatusPrompt);
        end;
    end, {
        v12
    });
    if l_FFlagAXRefetchAvatarOnTimeout_0 then
        v1.useEffect(function() --[[ Line: 45 ]]
            -- upvalues: v10 (copy), v13 (copy)
            if v10 and v13 then
                v10();
            end;
        end, {
            v13, 
            v10
        });
    end;
end;