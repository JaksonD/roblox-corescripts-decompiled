local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GetHomePageUpsellCardVariation);
local v5 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local l_FFlagEnableAEGIS1HomePageBanner_0 = require(l_Parent_0.SocialUpsell).Flags.FFlagEnableAEGIS1HomePageBanner;
local v7 = game:DefineFastString("DebugHomePageUpsellCardVariationResponseBody", "");
return function(v8) --[[ Line: 16 ]]
    -- upvalues: v4 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), v7 (copy), l_HttpService_0 (copy), v5 (copy)
    return function(v9) --[[ Line: 17 ]]
        -- upvalues: v4 (ref), v8 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (ref), v7 (ref), l_HttpService_0 (ref), v5 (ref)
        return v4(v8):andThen(function(v10) --[[ Line: 18 ]]
            -- upvalues: l_FFlagEnableAEGIS1HomePageBanner_0 (ref), v7 (ref), l_HttpService_0 (ref), v9 (copy), v5 (ref)
            if v10 and v10.responseBody then
                local l_responseBody_0 = v10.responseBody;
                if l_FFlagEnableAEGIS1HomePageBanner_0 then
                    if v7 ~= "" then
                        local _, l_result_0 = pcall(function() --[[ Line: 24 ]]
                            -- upvalues: l_HttpService_0 (ref), v7 (ref)
                            return l_HttpService_0:JSONDecode(v7);
                        end);
                        if l_result_0 then
                            l_responseBody_0 = l_result_0;
                        end;
                    end;
                    v9:dispatch(v5(l_responseBody_0.upsellCardType or "", l_responseBody_0.localizedTitleTextOverride or "", l_responseBody_0.localizedBodyTextOverride or "", l_responseBody_0.upsellCardV2Config or nil));
                    return;
                else
                    v9:dispatch(v5(l_responseBody_0.upsellCardType or "", l_responseBody_0.localizedTitleTextOverride or "", l_responseBody_0.localizedBodyTextOverride or ""));
                    return;
                end;
            else
                v9:dispatch(v5("", "", ""));
                return;
            end;
        end, function(_) --[[ Line: 51 ]]
            -- upvalues: v9 (copy), v5 (ref)
            v9:dispatch(v5("", "", ""));
        end);
    end;
end;