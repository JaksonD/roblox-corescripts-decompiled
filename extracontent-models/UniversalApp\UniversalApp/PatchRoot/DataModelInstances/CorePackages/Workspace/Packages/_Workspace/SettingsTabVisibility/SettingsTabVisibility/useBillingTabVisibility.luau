local l_Parent_0 = script:FindFirstAncestor("SettingsTabVisibility").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AmpUpsell);
local l_AmpApiProvider_0 = v2.AmpApiProvider;
local l_AccessResponseEnum_0 = v2.AmpEnums.AccessResponseEnum;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
return function() --[[ Line: 19 ]] --[[ Name: useBillingTabVisibility ]]
    -- upvalues: v1 (copy), l_AmpApiProvider_0 (copy), l_AccessResponseEnum_0 (copy), l_UrlBuilder_0 (copy), l_fetch_0 (copy)
    local v7, v8 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: l_AmpApiProvider_0 (ref), l_AccessResponseEnum_0 (ref), v8 (copy), l_UrlBuilder_0 (ref), l_fetch_0 (ref)
        task.spawn(function() --[[ Line: 26 ]]
            -- upvalues: l_AmpApiProvider_0 (ref), l_AccessResponseEnum_0 (ref), v8 (ref), l_UrlBuilder_0 (ref), l_fetch_0 (ref)
            local v9 = l_AmpApiProvider_0.getFeatureAccess({
                "ShouldHideSpendingSettingsTab"
            });
            local _ = nil;
            if not (not v9.featureAccessList or v9.featureAccessList and #v9.featureAccessList > 0 and v9.featureAccessList[1].access == l_AccessResponseEnum_0.Granted) then
                v8(true);
                return;
            else
                local v11 = l_UrlBuilder_0.fromString("apis:payments-gateway/v1/payment-profiles")();
                l_fetch_0(v11, {
                    method = "GET"
                }):andThen(function(v12) --[[ Line: 47 ]]
                    -- upvalues: v8 (ref)
                    local v13 = v12:json();
                    local v14 = false;
                    if v13 and v13._values and v13._values[1] then
                        v14 = #v13._values[1] > 0;
                    end;
                    v8(v14);
                end):catch(function() --[[ Line: 58 ]]
                    -- upvalues: v8 (ref)
                    v8(true);
                end);
                return;
            end;
        end);
    end, {});
    return {
        showBillingTab = v7
    };
end;