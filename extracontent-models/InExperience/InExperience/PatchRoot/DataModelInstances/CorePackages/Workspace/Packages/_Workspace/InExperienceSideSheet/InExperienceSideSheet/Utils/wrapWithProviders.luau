local l_Parent_0 = script:FindFirstAncestor("InExperienceSideSheet").Parent;
local v1 = require(l_Parent_0.Chrome);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.Style);
local l_Constants_0 = require(l_Parent_0.UIBlox).App.Style.Constants;
local l_UiModeStyleProvider_0 = v5.UiModeStyleProvider;
local l_UnibarStyle_0 = v1.UnibarStyle;
return function(v9, v10) --[[ Line: 15 ]] --[[ Name: wrapWithProviders ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), l_UnibarStyle_0 (copy)
    local v12 = v4.Store.new(function(v11) --[[ Line: 16 ]]
        return v11 or {};
    end);
    local l_v9_0 = v9;
    for _, v15 in v10 do
        l_v9_0 = v2.createElement(v15, nil, l_v9_0);
    end;
    return v2.createElement(v3.StoreProvider, {
        store = v12
    }, {
        UiModeStyleProvider = v2.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            UnibarStyleProvider = v2.createElement(l_UnibarStyle_0.Provider, {}, l_v9_0)
        })
    });
end;