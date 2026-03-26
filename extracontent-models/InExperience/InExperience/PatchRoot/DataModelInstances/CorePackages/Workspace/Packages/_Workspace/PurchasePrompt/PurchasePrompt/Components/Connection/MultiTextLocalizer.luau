local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.PurchasePromptDeps);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local v5 = require(l_script_FirstAncestor_0.Localization.LocalizationService);
local v6 = require(script.Parent.LocalizationContextConsumer);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptUseAppLocales);
local v8 = l_t_0.strictInterface({
    locKeys = l_t_0.table, 
    render = l_t_0.callback
});
local v9 = l_t_0.strictInterface({
    key = l_t_0.string, 
    params = l_t_0.optional(l_t_0.table)
});
return function(v10) --[[ Line: 24 ]] --[[ Name: MultiTextLocalizer ]]
    -- upvalues: v8 (copy), v9 (copy), l_Roact_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    assert(v8(v10));
    for _, v12 in pairs(v10.locKeys) do
        assert(v9(v12));
    end;
    local l_render_0 = v10.render;
    return l_Roact_0.createElement(v6, {
        render = function(v14) --[[ Line: 33 ]] --[[ Name: render ]]
            -- upvalues: v10 (copy), v7 (ref), v5 (ref), l_render_0 (copy)
            local v15 = {};
            for v16, v17 in pairs(v10.locKeys) do
                if v7 then
                    v15[v16] = v14:Format(v17.key, v17.params);
                else
                    v15[v16] = v5.getString(v14, v17.key, v17.params);
                end;
            end;
            return l_render_0(v15);
        end
    });
end;