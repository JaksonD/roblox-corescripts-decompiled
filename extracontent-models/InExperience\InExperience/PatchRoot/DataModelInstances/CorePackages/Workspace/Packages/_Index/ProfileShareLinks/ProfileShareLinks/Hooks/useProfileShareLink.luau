local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v9 = require(l_script_FirstAncestor_0.Enums.ProfileSharePolicyEnum);
local v10 = require(l_script_FirstAncestor_0.Hooks.useGetOrGenerateLinkUrl);
local v11 = require(l_script_FirstAncestor_0.Hooks.useShortUrl);
local v12 = require(l_script_FirstAncestor_0.Hooks.useProfileSharePolicy);
local v13 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v14 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v16) --[[ Line: 31 ]]
    -- upvalues: v13 (copy), l_useDispatch_0 (copy), v12 (copy), v10 (copy), v11 (copy), l_useEffectOnce_0 (copy), v9 (copy), v3 (copy), v14 (copy), l_default_0 (copy), l_SetCurrentToastMessage_0 (copy), v15 (copy)
    local v17 = v16.enableFetch == nil or v16.enableFetch;
    local v18 = v13();
    local v19 = l_useDispatch_0();
    local v20 = v12();
    local v21 = v10();
    local v22 = v11();
    local v23 = v22 ~= nil;
    l_useEffectOnce_0(v21, not v23 and v20 ~= v9.Disabled and v17);
    local v26 = v3.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v20 (copy), v9 (ref), v22 (copy), v18 (copy), v14 (ref), v16 (copy), l_default_0 (ref), v19 (copy), l_SetCurrentToastMessage_0 (ref), v15 (ref)
        if v20 == v9.Disabled or v22 == nil then
            return;
        else
            local v24 = tostring(DateTime.now().UnixTimestampMillis);
            local v25 = ("%*&source=ProfileShare&stamp=%*"):format(v22, v24);
            v18.fireAnalyticsEvent(v14.ProfileShareLinkActivated, {
                context = v16.context, 
                shareType = v20, 
                stamp = v24
            });
            l_default_0:shareUrl({
                context = v16.context, 
                url = v25
            });
            if v20 == v9.Copy then
                v19(l_SetCurrentToastMessage_0({
                    toastMessage = v15.LinkCopied
                }));
            end;
            return;
        end;
    end, {
        v20, 
        v22, 
        v16.context, 
        v18, 
        v19
    });
    return {
        hasLoaded = v23, 
        policy = v20, 
        onActivated = v26
    };
end;