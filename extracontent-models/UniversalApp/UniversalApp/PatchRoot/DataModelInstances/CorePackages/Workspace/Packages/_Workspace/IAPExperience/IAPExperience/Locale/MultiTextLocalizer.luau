local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Locale.LocaleService);
local v5 = require(script.Parent.LocaleConsumer);
local v6 = require(script.Parent.LocaleRoactContext);
local v7 = require(l_Parent_0.Flags.FFlagIAPExperienceUseAppLocales);
local v8 = v3.strictInterface({
    keys = v3.table, 
    render = v3.callback
});
local v9 = v3.strictInterface({
    key = v3.string, 
    params = v3.optional(v3.table)
});
return function(v10) --[[ Line: 24 ]] --[[ Name: MultiTextLocalizer ]]
    -- upvalues: v8 (copy), v9 (copy), v7 (copy), v2 (copy), v6 (copy), v5 (copy), v4 (copy)
    assert(v8(v10));
    for _, v12 in pairs(v10.keys) do
        assert(v9(v12));
    end;
    local l_render_0 = v10.render;
    if v7 then
        return v2.createElement(v6.Consumer, {
            render = function(v14) --[[ Line: 34 ]] --[[ Name: render ]]
                -- upvalues: v10 (copy), l_render_0 (copy)
                local v15 = {};
                for v16, v17 in pairs(v10.keys) do
                    v15[v16] = v14:Format(v17.key, v17.params);
                end;
                return l_render_0(v15);
            end
        });
    else
        return v2.createElement(v5, {
            render = function(v18) --[[ Line: 44 ]] --[[ Name: render ]]
                -- upvalues: v10 (copy), v4 (ref), l_render_0 (copy)
                local v19 = {};
                for v20, v21 in pairs(v10.keys) do
                    v19[v20] = v4.getString(v18, v21.key, v21.params);
                end;
                return l_render_0(v19);
            end
        });
    end;
end;