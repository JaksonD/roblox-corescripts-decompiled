local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local l_ContextStack_0 = require(l_Parent_2.ReactUtils).ContextStack;
local v5 = require(l_Parent_0.Cursor);
local v6 = require(l_Parent_0.Overlay);
local v7 = require(l_Parent_0.Preferences.PreferencesProvider);
local _ = require(l_Parent_0.Responsive.ResponsiveContext);
local v9 = require(l_Parent_0.Responsive.ResponsiveProvider);
local v10 = require(l_Parent_0.Style.StyleProvider);
local _ = require(l_Parent_1.Components.Types);
local l_ElevationProvider_0 = require(l_Parent_0.Elevation.ElevationProvider).ElevationProvider;
local v13 = require(l_Parent_1.Utility.Flags);
return function(v14) --[[ Line: 30 ]] --[[ Name: FoundationProvider ]]
    -- upvalues: v3 (copy), l_ContextStack_0 (copy), l_ElevationProvider_0 (copy), v7 (copy), v10 (copy), v9 (copy), v6 (copy), v13 (copy), v5 (copy)
    local v15 = if v14.preferences then v14.preferences else {};
    local v16 = if v14.responsiveConfig then v14.responsiveConfig else {};
    return v3.createElement(l_ContextStack_0, {
        providers = {
            v3.createElement(l_ElevationProvider_0, nil), 
            v3.createElement(v7, v15), 
            v3.createElement(v10, {
                theme = v14.theme, 
                device = v14.device, 
                derives = v14.derives, 
                scale = v15.scale
            }), 
            v3.createElement(v9, {
                config = v16
            }), 
            v3.createElement(v6, if v13.FoundationOverlayDisplayOrder and typeof(v14.overlayGui) == "table" then {
                DisplayOrder = v14.overlayGui.DisplayOrder
            } else {
                gui = v14.overlayGui
            }), 
            v3.createElement(v5)
        }
    }, v14.children);
end;