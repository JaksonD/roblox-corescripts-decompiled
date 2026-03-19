local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local l_useEffectOnce_0 = v3.Hooks.useEffectOnce;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v6 = require(l_Parent_0.Components.CoreUI.CaptureConfigCTAs);
local v7 = require(l_Parent_0.Components.CapturesGallery.CapturesGallery);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.Analytics.EventNames);
local v10 = require(l_Parent_0.Analytics.useAnalytics);
return function(v11) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), v10 (copy), l_useSelector_0 (copy), v8 (copy), l_useEffectOnce_0 (copy), v9 (copy), v6 (copy), v7 (copy)
    local v12 = v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v11 (copy)
        v11.closeSettingsMenu();
    end, {});
    local v13 = v10();
    local v14, v15 = v2.useState(0);
    local v17 = l_useSelector_0(function(v16) --[[ Line: 30 ]]
        -- upvalues: v8 (ref)
        return v16[v8.RoduxKey].IsMenuOpen;
    end);
    l_useEffectOnce_0(function() --[[ Line: 34 ]]
        -- upvalues: v13 (copy), v9 (ref)
        v13.fireEvent(v9.CapturesPageOpenedInGameMenu);
    end, v17);
    local v19 = v2.useCallback(function(v18) --[[ Line: 38 ]]
        -- upvalues: v15 (copy)
        v15(v18.Y);
    end, {});
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Visible = v17
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 12)
        }), 
        CaptureConfigCTAs = v2.createElement(v6, {
            closeSettingsMenu = v12, 
            LayoutOrder = 1, 
            onAbsoluteSizeChanged = v19
        }), 
        CapturesGallery = v2.createElement(v7, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -v14 - 12)
        })
    });
end;