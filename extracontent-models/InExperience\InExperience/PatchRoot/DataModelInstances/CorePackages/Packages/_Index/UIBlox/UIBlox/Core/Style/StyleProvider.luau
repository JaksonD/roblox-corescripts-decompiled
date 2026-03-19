local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Style_0 = l_Parent_1.App.Style;
local v3 = require(l_Parent_1.Parent.Roact);
local v4 = require(l_Parent_1.Parent.t);
local v5 = require(l_Style_0.Validator.validateStyle);
local v6 = require(l_Parent_0.StyleContext);
local v7 = require(l_Parent_1.Utility.getTextSizeOffset);
local _ = require(l_Style_0.StyleTypes);
local v9 = require(l_Style_0.Themes);
local v10 = require(l_Style_0.Constants);
local v11 = require(l_Style_0.Fonts.getFontFromName);
local l_getTokens_0 = require(l_Style_0.Tokens).getTokens;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v15 = require(l_Parent_2.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting");
local v16 = v3.Component:extend("StyleProvider");
v16.validateProps = v4.strictInterface({
    style = v4.optional(v5), 
    derivedValues = v4.optional(v4.table), 
    [v3.Children] = v4.table
});
local v17 = {
    Theme = v9.DarkTheme, 
    Settings = {
        PreferredTransparency = 1, 
        ReducedMotion = false, 
        PreferredTextSize = if v15 then Enum.PreferredTextSize.Medium else nil, 
        Scale = 1
    }
};
local v18 = {
    textSizeOffset = 0
};
v16.init = function(v19) --[[ Line: 52 ]] --[[ Name: init ]]
    v19:setState({
        style = v19.props.style, 
        derivedValues = v19.props.derivedValues
    });
end;
v16.updateTextSizeOffset = function(v20, v21) --[[ Line: 61 ]] --[[ Name: updateTextSizeOffset ]]
    -- upvalues: v7 (copy)
    local v22, v23 = v7(v21);
    if v22 then
        v20:setState({
            derivedValues = {
                textSizeOffset = v23
            }
        });
    end;
end;
v16.didUpdate = function(v24, _, v26) --[[ Line: 72 ]] --[[ Name: didUpdate ]]
    if v26.style and v26.style.Settings.PreferredTextSize ~= v24.state.style.Settings.PreferredTextSize then
        v24:updateTextSizeOffset(v24.state.style.Font.Body.Font);
    end;
end;
v16.render = function(v27) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_Object_0 (copy), v17 (copy), v18 (copy), l_getTokens_0 (copy), v10 (copy), v9 (copy), v11 (copy), v3 (copy), v6 (copy)
    local v28 = l_Object_0.assign({}, v17, v27.state.style);
    local v29 = l_Object_0.assign({}, v18, v27.state.derivedValues);
    if v28.Tokens == nil then
        v28.Tokens = l_getTokens_0(v10.DefaultDeviceType, if v28.Theme == v9.LightTheme then v10.ThemeName.Light else v10.ThemeName.Dark, v28.Settings.Scale);
    end;
    if v28.Font == nil then
        v28.Font = v11(v10.FontName.Gotham, v28.Tokens);
    end;
    local v32 = {
        style = v28, 
        update = function(_, v31) --[[ Line: 100 ]] --[[ Name: update ]]
            -- upvalues: v27 (copy)
            if v27.mounted then
                v27:setState({
                    style = v31
                });
            end;
        end, 
        derivedValues = v29
    };
    return v3.createElement(v6.Provider, {
        value = v32
    }, v3.oneChild(v27.props[v3.Children]));
end;
v16.didMount = function(v33) --[[ Line: 113 ]] --[[ Name: didMount ]]
    v33.mounted = true;
end;
v16.willUnmount = function(v34) --[[ Line: 117 ]] --[[ Name: willUnmount ]]
    v34.mounted = false;
end;
return v16;