local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.TCBannerImpressionCache);
local v3 = require(script.Parent.FIntAddFriendsTrustedContactsImpressionCap);
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local function v10() --[[ Line: 16 ]] --[[ Name: isBannerHiddenInitState ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8 = v2.getValue();
    local v9 = true;
    if v8 >= 0 then
        v9 = v3 <= v8;
    end;
    return v9;
end;
return function() --[[ Line: 21 ]] --[[ Name: useShowTrustedContactsEducationBanner ]]
    -- upvalues: v1 (copy), v10 (copy), l_AmpApiProvider_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), v2 (copy)
    local v11, v12 = v1.useState(v10);
    local v13, v14 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: l_AmpApiProvider_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v14 (copy)
        if l_AmpApiProvider_0.upsellFeatureAccess(l_FStringCanAccessTrustedContactsAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v14(true);
        end;
    end, {});
    return not v11 and v13, v1.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v2 (ref)
        v12(true);
        v2.dismissValue();
    end, {
        v12
    }), (v1.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v2 (ref)
        v2.incrementValue();
    end, {}));
end;