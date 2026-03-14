local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Style);
local l_UiModeStyleProvider_0 = v2.UiModeStyleProvider;
local l_DesignTokenProvider_0 = v2.DesignTokenProvider;
return function(v5, v6) --[[ Line: 9 ]] --[[ Name: maybeForceDarkTheme ]]
    -- upvalues: v1 (copy), l_UiModeStyleProvider_0 (copy), l_DesignTokenProvider_0 (copy)
    if v6 then
        return v1.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = "Dark", 
                fontName = nil
            }
        }, {
            DesignTokenProvider = v1.createElement(l_DesignTokenProvider_0, {
                tokenMappers = {}
            }, {
                Content = v5
            })
        });
    else
        return v5;
    end;
end;