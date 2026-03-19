local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Constants);
local v3 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_CoreGui_0 = v3.Services.CoreGui;
local l_RunService_0 = v3.Services.RunService;
local l_Players_0 = v3.Services.Players;
local v7 = if l_Players_0.LocalPlayer and l_RunService_0:IsRunning() then l_Players_0.LocalPlayer:WaitForChild("PlayerGui", 3) else nil;
local v8 = require(l_script_FirstAncestor_0.Utility.Flags);
local v9 = require(l_script_FirstAncestor_0.Utility.isPluginSecurity);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_useStyleSheet_0 = require(l_script_FirstAncestor_0.Providers.Style.StyleSheetContext).useStyleSheet;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v13 = require(script.Parent.OverlayContext);
local v14 = require(script.Parent.useKeyboardAwareSize);
local v15 = require(l_Parent_0.React);
local v16 = require(l_Parent_0.ReactRoblox);
local v17 = {
    DisplayOrder = v2.MAX_LAYOUT_ORDER - 1
};
local v18 = if v9() then l_CoreGui_0 else v7;
return function(v19) --[[ Line: 38 ]] --[[ Name: OverlayProvider ]]
    -- upvalues: v8 (copy), v10 (copy), v17 (copy), v15 (copy), v14 (copy), l_useStyleSheet_0 (copy), v18 (copy), v13 (copy), v16 (copy), v2 (copy)
    local v20 = if v8.FoundationOverlayDisplayOrder then v10(v19, v17) else v19;
    local v21, v22 = v15.useState(v20.gui);
    local v23, v24 = v15.useState(false);
    local v25 = if v8.FoundationOverlayKeyboardAwareness then v14(v21) else nil;
    local v26 = l_useStyleSheet_0();
    local v27 = v15.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v20 (copy), v24 (copy)
        if v20.gui == nil then
            v24(true);
        end;
    end, {
        v20.gui
    });
    local v28 = false;
    if v20.gui == nil then
        v28 = false;
        if v18 ~= nil then
            v28 = v23;
        end;
    end;
    local v29 = if v20.gui ~= nil then v20.gui else v21;
    return v15.createElement(v13.Provider, {
        value = {
            requestOverlay = v27, 
            instance = v29
        }
    }, {
        FoundationOverlay = if v28 then v16.createPortal(v15.createElement("ScreenGui", {
            Enabled = true, 
            DisplayOrder = if v8.FoundationOverlayDisplayOrder then v20.DisplayOrder else v2.MAX_LAYOUT_ORDER - 1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            ScreenInsets = if v8.FoundationOverlayLuaAppInsetsFix then Enum.ScreenInsets.CoreUISafeInsets else Enum.ScreenInsets.DeviceSafeInsets, 
            SafeAreaCompatibility = Enum.SafeAreaCompatibility.None, 
            ClipToDeviceSafeArea = false, 
            ref = if not v8.FoundationOverlayKeyboardAwareness then v22 else nil
        }, {
            SafeAreaFrame = if v8.FoundationOverlayKeyboardAwareness then v15.createElement("Frame", {
                Size = v25, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ref = v22
            }) else nil, 
            FoundationStyleLink = v15.createElement("StyleLink", {
                StyleSheet = v26
            })
        }), v18) else nil, 
        Children = v15.createElement(v15.Fragment, nil, v20.children)
    });
end;