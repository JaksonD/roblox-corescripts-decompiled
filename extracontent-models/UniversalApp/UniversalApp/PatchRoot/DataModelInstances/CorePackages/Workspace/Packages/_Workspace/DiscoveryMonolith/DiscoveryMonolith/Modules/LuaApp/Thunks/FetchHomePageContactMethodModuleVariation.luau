local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = script:FindFirstAncestor("DiscoveryMonolith").Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetHomePageUpsellCardVariation);
local v3 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local v4 = game:DefineFastString("DebugHomePageUpsellCardVariationResponseBody", "");
return function(v5) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v4 (copy), l_HttpService_0 (copy), v3 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v5 (copy), v4 (ref), l_HttpService_0 (ref), v3 (ref)
        return v2(v5):andThen(function(v7) --[[ Line: 14 ]]
            -- upvalues: v4 (ref), l_HttpService_0 (ref), v6 (copy), v3 (ref)
            if v7 and v7.responseBody then
                local l_responseBody_0 = v7.responseBody;
                if v4 ~= "" then
                    local _, l_result_0 = pcall(function() --[[ Line: 19 ]]
                        -- upvalues: l_HttpService_0 (ref), v4 (ref)
                        return l_HttpService_0:JSONDecode(v4);
                    end);
                    if l_result_0 then
                        l_responseBody_0 = l_result_0;
                    end;
                end;
                v6:dispatch(v3(l_responseBody_0.upsellCardType or "", l_responseBody_0.localizedTitleTextOverride or "", l_responseBody_0.localizedBodyTextOverride or "", l_responseBody_0.upsellCardV2Config or nil));
                return;
            else
                v6:dispatch(v3("", "", ""));
                return;
            end;
        end, function(_) --[[ Line: 37 ]]
            -- upvalues: v6 (copy), v3 (ref)
            v6:dispatch(v3("", "", ""));
        end);
    end;
end;