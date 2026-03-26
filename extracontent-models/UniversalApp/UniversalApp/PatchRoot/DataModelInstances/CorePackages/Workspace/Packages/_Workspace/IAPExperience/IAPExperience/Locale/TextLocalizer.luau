local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Locale.LocaleService);
local v5 = require(script.Parent.LocaleConsumer);
local v6 = require(l_Parent_0.Flags.FFlagIAPExperienceUseAppLocales);
local v7 = v3.strictInterface({
    locKey = v3.string, 
    params = v3.optional(v3.table), 
    render = v3.callback
});
return function(v8) --[[ Line: 21 ]] --[[ Name: TextLocalizer ]]
    -- upvalues: v6 (copy), v7 (copy), v2 (copy), v5 (copy), v4 (copy)
    if v6 then
        error("TextLocalizer is deprecated. Use MultiTextLocalizer or RobloxAppLocales.Localization:Format() instead.");
    end;
    assert(v7(v8));
    local l_locKey_0 = v8.locKey;
    local l_params_0 = v8.params;
    local l_render_0 = v8.render;
    return v2.createElement(v5, {
        render = function(v12) --[[ Line: 31 ]] --[[ Name: render ]]
            -- upvalues: l_render_0 (copy), v4 (ref), l_locKey_0 (copy), l_params_0 (copy)
            return l_render_0(v4.getString(v12, l_locKey_0, l_params_0));
        end
    });
end;