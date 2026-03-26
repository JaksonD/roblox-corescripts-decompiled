local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.getLocaleContext);
local v6 = require(l_Parent_0.LocaleRoactContext);
local v7 = require(l_Parent_1.Flags.FFlagIAPExperienceUseAppLocales);
local l_Localization_0 = require(l_Parent_2.RobloxAppLocales).Localization;
local v9 = v3.Component:extend("LocaleProvider");
v9.validateProps = v4.interface({
    locale = v4.string
});
v9.render = function(v10) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_Localization_0 (copy), v5 (copy), v3 (copy), v6 (copy)
    local v11 = nil;
    v11 = if v7 then l_Localization_0.new(v10.props.locale) else v5(v10.props.locale);
    return v3.createElement(v6.Provider, {
        value = v11
    }, v10.props[v3.Children]);
end;
return v9;