local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.PostHomePageUpsellCardVariationDismiss);
local v5 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local function _(v7, v8) --[[ Line: 14 ]]
    -- upvalues: l_flaggedMutedError_0 (copy)
    l_flaggedMutedError_0("HomePageContactMethodModuleVariationDismiss", v7, {
        cardType = v8
    });
end;
return function(v10, v11) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy), l_flaggedMutedError_0 (copy)
    return function(v12) --[[ Line: 21 ]]
        -- upvalues: v5 (ref), v11 (copy), v3 (ref), v4 (ref), v10 (copy), l_flaggedMutedError_0 (ref)
        v12:dispatch(v5("", "", "", {}));
        if not v11 or v11 == "" then
            return v3.resolve();
        else
            return v4(v10, v11):andThen(function(v13) --[[ Line: 28 ]]
                -- upvalues: v11 (ref), l_flaggedMutedError_0 (ref)
                if not v13 then
                    l_flaggedMutedError_0("HomePageContactMethodModuleVariationDismiss", "Unexpected response to post upsell card variation dismiss", {
                        cardType = v11
                    });
                end;
            end, function(_) --[[ Line: 32 ]]
                -- upvalues: v11 (ref), l_flaggedMutedError_0 (ref)
                l_flaggedMutedError_0("HomePageContactMethodModuleVariationDismiss", "Failed to post upsell card variation dismiss", {
                    cardType = v11
                });
            end):catch(function(_) --[[ Line: 34 ]]
                -- upvalues: v11 (ref), l_flaggedMutedError_0 (ref)
                l_flaggedMutedError_0("HomePageContactMethodModuleVariationDismiss", "Failed to post upsell card variation dismiss", {
                    cardType = v11
                });
            end);
        end;
    end;
end;