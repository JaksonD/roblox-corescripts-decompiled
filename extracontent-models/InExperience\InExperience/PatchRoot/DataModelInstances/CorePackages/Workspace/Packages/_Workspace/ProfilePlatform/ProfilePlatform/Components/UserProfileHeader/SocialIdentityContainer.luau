local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.DataHydration);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v9 = require(l_Parent_0.Signals);
local v10 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v11 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialIdentity);
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v13 = if l_FFlagLegacyProfileTCIndicator_0 then v7.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v14) --[[ Line: 45 ]] --[[ Name: SocialIdentityContainer ]]
    -- upvalues: v10 (copy), l_useLocalUserId_0 (copy), l_AppStorageService_0 (copy), v3 (copy), l_useEffectOnce_0 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v9 (copy), v13 (copy), l_useSignalState_0 (copy), v11 (copy), v6 (copy)
    local l_profileId_0 = v10().profileId;
    local v16 = l_profileId_0 == l_useLocalUserId_0();
    local v17 = v16 and "NamesDisplayNameTooltipImpressionCount" or "NamesProfileTooltip";
    local v18 = tonumber(l_AppStorageService_0:GetItem(v17)) or 0;
    local v19 = v3.useRef(v18);
    local v21 = v3.useCallback(function(v20) --[[ Line: 58 ]]
        -- upvalues: l_AppStorageService_0 (ref), v17 (copy)
        l_AppStorageService_0:SetItem(v17, (tostring(v20 or 0)));
        l_AppStorageService_0:Flush();
    end);
    local v22 = v3.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v19 (copy), v21 (copy)
        v19.current = 3;
        v21(3);
    end);
    l_useEffectOnce_0(function() --[[ Line: 68 ]]
        -- upvalues: v19 (copy), v21 (copy)
        if v19.current then
            v21(v19.current + 1);
        end;
    end, false);
    local v23 = nil;
    if l_FFlagLegacyProfileTCIndicator_0 then
        local v25 = v3.useMemo(function() --[[ Line: 76 ]]
            -- upvalues: v9 (ref), l_profileId_0 (copy), v13 (ref)
            return v9.createComputed(function(v24) --[[ Line: 77 ]]
                -- upvalues: l_profileId_0 (ref), v13 (ref)
                if l_profileId_0 and l_profileId_0 ~= "" then
                    return (v13.getIsTrustedConnection(l_profileId_0).data(v24));
                else
                    return nil;
                end;
            end);
        end, {
            l_profileId_0
        });
        v23 = l_useSignalState_0(v25);
    end;
    return v3.createElement(v11, (v6.Dictionary.union(v14, {
        isLocalUser = v16, 
        isTooltipActive = false, 
        dismissTooltip = v22, 
        isTrustedConnection = if l_FFlagLegacyProfileTCIndicator_0 then v23 else nil
    })));
end;