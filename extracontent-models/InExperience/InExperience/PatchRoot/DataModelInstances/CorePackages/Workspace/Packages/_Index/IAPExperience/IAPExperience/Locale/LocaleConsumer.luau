local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.LocaleRoactContext);
local v6 = require(l_Parent_1.Flags.FFlagIAPExperienceUseAppLocales);
local v7 = v3.Component:extend("LocaleConsumer");
v7.validateProps = v4.strictInterface({
    render = v4.callback
});
v7.render = function(v8) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (copy)
    if v6 then
        error("LocaleConsumer is deprecated. Use LocaleRoactContext.Consumer directly instead.");
    end;
    return v3.createElement(v5.Consumer, {
        render = function(v9) --[[ Line: 25 ]] --[[ Name: render ]]
            -- upvalues: v8 (copy)
            return v8.props.render(v9);
        end
    });
end;
return v7;