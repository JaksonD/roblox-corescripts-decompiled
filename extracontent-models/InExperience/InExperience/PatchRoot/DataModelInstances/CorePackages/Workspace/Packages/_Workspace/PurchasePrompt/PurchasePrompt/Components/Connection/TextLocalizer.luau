local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v3 = require(l_script_FirstAncestor_0.Localization.LocalizationService);
local v4 = require(script.Parent.LocalizationContextConsumer);
return function(v5) --[[ Line: 10 ]] --[[ Name: TextLocalizer ]]
    -- upvalues: l_Roact_0 (copy), v4 (copy), v3 (copy)
    local l_locKey_0 = v5.locKey;
    local l_params_0 = v5.params;
    local l_render_0 = v5.render;
    assert(typeof(l_locKey_0) == "string", "String prop 'locKey' must be provided");
    assert(typeof(l_render_0) == "function", "Render prop must be a function");
    return l_Roact_0.createElement(v4, {
        render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
            -- upvalues: l_render_0 (copy), v3 (ref), l_locKey_0 (copy), l_params_0 (copy)
            return l_render_0(v3.getString(v9, l_locKey_0, l_params_0));
        end
    });
end;