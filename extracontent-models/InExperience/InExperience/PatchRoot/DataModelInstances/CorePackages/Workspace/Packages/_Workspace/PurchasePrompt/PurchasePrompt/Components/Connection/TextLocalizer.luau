local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v3 = require(l_script_FirstAncestor_0.Localization.LocalizationService);
local v4 = require(script.Parent.LocalizationContextConsumer);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptUseAppLocales);
return function(v6) --[[ Line: 12 ]] --[[ Name: TextLocalizer ]]
    -- upvalues: l_Roact_0 (copy), v4 (copy), v5 (copy), v3 (copy)
    local l_locKey_0 = v6.locKey;
    local l_params_0 = v6.params;
    local l_render_0 = v6.render;
    assert(typeof(l_locKey_0) == "string", "String prop 'locKey' must be provided");
    assert(typeof(l_render_0) == "function", "Render prop must be a function");
    return l_Roact_0.createElement(v4, {
        render = function(v10) --[[ Line: 21 ]] --[[ Name: render ]]
            -- upvalues: v5 (ref), l_render_0 (copy), l_locKey_0 (copy), l_params_0 (copy), v3 (ref)
            if v5 then
                return l_render_0(v10:Format(l_locKey_0, l_params_0));
            else
                return l_render_0(v3.getString(v10, l_locKey_0, l_params_0));
            end;
        end
    });
end;