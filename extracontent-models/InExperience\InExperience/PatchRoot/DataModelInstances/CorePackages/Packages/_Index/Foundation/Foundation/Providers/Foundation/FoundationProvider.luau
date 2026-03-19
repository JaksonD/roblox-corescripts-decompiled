local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local l_ContextStack_0 = require(l_Parent_2.ReactUtils).ContextStack;
local v5 = require(l_Parent_0.Cursor);
local v6 = require(l_Parent_0.Overlay);
local v7 = require(l_Parent_0.Plugin.PluginProvider);
local v8 = require(l_Parent_0.Preferences.PreferencesProvider);
local _ = require(l_Parent_0.Responsive.ResponsiveContext);
local v10 = require(l_Parent_0.Responsive.ResponsiveProvider);
local v11 = require(l_Parent_0.Style.StyleProvider);
local _ = require(l_Parent_1.Components.Types);
local l_ElevationProvider_0 = require(l_Parent_0.Elevation.ElevationProvider).ElevationProvider;
local v14 = require(l_Parent_1.Utility.Flags);
return function(v15) --[[ Line: 32 ]] --[[ Name: FoundationProvider ]]
    -- upvalues: v3 (copy), l_ContextStack_0 (copy), v7 (copy), l_ElevationProvider_0 (copy), v8 (copy), v11 (copy), v10 (copy), v6 (copy), v14 (copy), v5 (copy)
    local v16 = if v15.preferences then v15.preferences else {};
    local v17 = if v15.responsiveConfig then v15.responsiveConfig else {};
    return v3.createElement(l_ContextStack_0, {
        providers = {
            v3.createElement(v7, {
                plugin = v15.plugin
            }), 
            v3.createElement(l_ElevationProvider_0, nil), 
            v3.createElement(v8, v16), 
            v3.createElement(v11, {
                theme = v15.theme, 
                device = v15.device, 
                derives = v15.derives, 
                scale = v16.scale
            }), 
            v3.createElement(v10, {
                config = v17
            }), 
            v3.createElement(v6, if v14.FoundationOverlayDisplayOrder and typeof(v15.overlayGui) == "table" then {
                DisplayOrder = v15.overlayGui.DisplayOrder
            } else {
                gui = v15.overlayGui
            }), 
            v3.createElement(v5)
        }
    }, v15.children);
end;