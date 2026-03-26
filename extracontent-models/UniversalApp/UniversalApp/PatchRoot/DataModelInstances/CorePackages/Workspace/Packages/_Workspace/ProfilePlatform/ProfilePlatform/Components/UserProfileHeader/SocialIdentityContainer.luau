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
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v15 = if l_FFlagLegacyProfileTCIndicator_0 then v7.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v16) --[[ Line: 48 ]] --[[ Name: SocialIdentityContainer ]]
    -- upvalues: v10 (copy), l_useLocalUserId_0 (copy), l_AppStorageService_0 (copy), v3 (copy), l_useEffectOnce_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v9 (copy), v15 (copy), l_useSignalState_0 (copy), v11 (copy), v6 (copy)
    local l_profileId_0 = v10().profileId;
    local v18 = l_profileId_0 == l_useLocalUserId_0();
    local v19 = v18 and "NamesDisplayNameTooltipImpressionCount" or "NamesProfileTooltip";
    local v20 = tonumber(l_AppStorageService_0:GetItem(v19)) or 0;
    local v21 = v3.useRef(v20);
    local v23 = v3.useCallback(function(v22) --[[ Line: 61 ]]
        -- upvalues: l_AppStorageService_0 (ref), v19 (copy)
        l_AppStorageService_0:SetItem(v19, (tostring(v22 or 0)));
        l_AppStorageService_0:Flush();
    end);
    local v24 = v3.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v21 (copy), v23 (copy)
        v21.current = 3;
        v23(3);
    end);
    l_useEffectOnce_0(function() --[[ Line: 71 ]]
        -- upvalues: v21 (copy), v23 (copy)
        if v21.current then
            v23(v21.current + 1);
        end;
    end, false);
    local v25 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v25 = l_useIsRobloxSubscriber_0(l_profileId_0 or nil);
    end;
    local v26 = nil;
    if l_FFlagLegacyProfileTCIndicator_0 then
        local v28 = v3.useMemo(function() --[[ Line: 84 ]]
            -- upvalues: v9 (ref), l_profileId_0 (copy), v15 (ref)
            return v9.createComputed(function(v27) --[[ Line: 85 ]]
                -- upvalues: l_profileId_0 (ref), v15 (ref)
                if l_profileId_0 and l_profileId_0 ~= "" then
                    return (v15.getIsTrustedConnection(l_profileId_0).data(v27));
                else
                    return nil;
                end;
            end);
        end, {
            l_profileId_0
        });
        v26 = l_useSignalState_0(v28);
    end;
    return v3.createElement(v11, (v6.Dictionary.union(v16, {
        isLocalUser = v18, 
        isTooltipActive = false, 
        dismissTooltip = v24, 
        isTrustedConnection = if l_FFlagLegacyProfileTCIndicator_0 then v26 else nil, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v25 else nil
    })));
end;