local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local v4 = require(l_Parent_0.AvatarExperienceNavigation);
local l_getTimeoutStatusStore_0 = v3.Stores.getTimeoutStatusStore;
local l_AvatarScreen_0 = v4.Enums.AvatarScreen;
return function(v7) --[[ Line: 17 ]] --[[ Name: useCatalogPageTimeoutPrompt ]]
    -- upvalues: l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v1 (copy), l_AvatarScreen_0 (copy)
    local v8 = l_getTimeoutStatusStore_0();
    local v9 = l_useSignalState_0(v8.getStatus);
    local v10 = v1.useRef(false);
    local v11 = v1.useRef(false);
    local v12 = v1.useRef(v7);
    v12.current = v7;
    v1.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), v8 (copy)
        if not v11.current then
            v11.current = true;
            v8.fetchStatus();
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy), l_AvatarScreen_0 (ref)
        if v9 and not v10.current and v11.current and v9.details then
            v10.current = true;
            v12.current.navigate(l_AvatarScreen_0.TimeoutStatusPrompt);
        end;
    end, {
        v9
    });
end;