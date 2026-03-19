local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.React);
local v5 = require(l_script_FirstAncestor_0.Enums.Device);
local v6 = require(l_script_FirstAncestor_0.StyleSheet);
local v7 = require(l_Parent_0.StyleSheetContext);
local v8 = require(l_Parent_0.TagsContext);
local v9 = require(l_Parent_0.TextSizeOffsetContext);
local v10 = require(l_script_FirstAncestor_0.Enums.Theme);
local v11 = require(l_Parent_0.Tokens);
local v12 = require(l_Parent_0.TokensContext);
local v13 = require(l_Parent_0.VariantsContext);
local v14 = require(l_script_FirstAncestor_0.Utility.getTextSizeOffset);
local v15 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v16 = require(l_Parent_0.useTagsState);
local v17 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_getTokens_0 = v11.getTokens;
local v19 = {
    theme = v10.Dark, 
    device = v5.Desktop, 
    scale = 1
};
StyleSheetContextWrapper = function(v20) --[[ Line: 44 ]] --[[ Name: StyleSheetContextWrapper ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy)
    local v21, v22 = v4.useState(nil);
    if v20.setStyleSheetRef and v20.setStyleSheetRef.current ~= v22 then
        v20.setStyleSheetRef.current = v22;
    end;
    return v4.createElement(v7.Provider, {
        value = v21 or v3.None
    }, v20.children);
end;
return function(v23) --[[ Line: 58 ]] --[[ Name: StyleProvider ]]
    -- upvalues: v17 (copy), v19 (copy), v4 (copy), v16 (copy), v13 (copy), l_getTokens_0 (copy), v15 (copy), v14 (copy), v12 (copy), v9 (copy), v8 (copy), v6 (copy)
    local v24 = v17({
        theme = v23.theme, 
        device = v23.device, 
        scale = v23.scale
    }, v19);
    local v25 = v4.useRef(nil);
    local v26, v27 = v16();
    local v28 = v13.useVariantsState();
    local v29 = v4.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: l_getTokens_0 (ref), v24 (copy)
        return l_getTokens_0(v24.device, v24.theme, v24.scale);
    end, {
        v24.device, 
        v24.theme, 
        v24.scale
    });
    local l_preferredTextSize_0 = v15().preferredTextSize;
    local v31 = v4.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: v14 (ref)
        return v14() or 0;
    end, {
        l_preferredTextSize_0
    });
    return v4.createElement(v12.Provider, {
        value = v29
    }, {
        TextSizeOffsetContext = v4.createElement(v9.Provider, {
            value = v31
        }, {
            VariantsContext = v4.createElement(v13.Provider, {
                value = v28
            }, {
                TagsContext = v4.createElement(v8.Provider, {
                    value = v27
                }, v4.createElement(StyleSheetContextWrapper, {
                    setStyleSheetRef = v25
                }, v23.children)), 
                StyleSheet = v4.createElement(v6, {
                    theme = v24.theme, 
                    device = v24.device, 
                    scale = v24.scale, 
                    tags = v26, 
                    derives = v23.derives, 
                    setStyleSheetRef = v25
                })
            })
        })
    });
end;