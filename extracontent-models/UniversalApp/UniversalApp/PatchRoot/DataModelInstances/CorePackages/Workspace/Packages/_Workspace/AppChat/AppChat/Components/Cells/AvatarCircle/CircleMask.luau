local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableAppChatFocusableFixes_0 = v3.FFlagEnableAppChatFocusableFixes;
local l_FFlagEnableAppChatFocusableFixesUpdate_0 = v3.FFlagEnableAppChatFocusableFixesUpdate;
local l_useCursor_0 = v1.Hooks.useCursor;
local v7 = {
    Size36x36 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png", 
    Size48x48 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
};
return function(v8) --[[ Line: 32 ]] --[[ Name: CircleMask ]]
    -- upvalues: v7 (copy), v2 (copy), l_FFlagEnableAppChatFocusableFixesUpdate_0 (copy), l_useCursor_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v9 = v7[v8.overlaySize or "Size36x36"];
    return v2.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v8.circleInteriorBackgroundColor3, 
        BackgroundTransparency = v8.circleInteriorBackgroundTransparency, 
        BorderSizePixel = 0, 
        Image = "", 
        SelectionImageObject = if l_FFlagEnableAppChatFocusableFixesUpdate_0 then l_useCursor_0() else nil, 
        AutoButtonColor = false, 
        ClipsDescendants = true, 
        [v2.Event.Activated] = v8.onActivated, 
        Selectable = if l_FFlagEnableAppChatFocusableFixes_0 then v8.selectable else nil, 
        LayoutOrder = v8.LayoutOrder
    }, {
        imageMask = v2.createElement("ImageLabel", {
            Image = v9, 
            ImageColor3 = v8.circleColor3, 
            ImageTransparency = v8.circleTransparency, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, v8.renderAboveMask)
    }, v8.children);
end;