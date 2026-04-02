local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_FFlagGameInviteModalUnlockMouse_0 = require(l_Parent_0.SharedFlags).FFlagGameInviteModalUnlockMouse;
local v6 = require(l_Context_0.GameInviteModalLayoutContext);
local v7 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSet_0 = v4.Core.ImageSet;
local l_Images_0 = v4.App.ImageSet.Images;
local v11 = Rect.new(8, 8, 9, 9);
return function(v12) --[[ Line: 22 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v6 (copy), l_ImageSet_0 (copy), l_FFlagGameInviteModalUnlockMouse_0 (copy), v7 (copy), l_Images_0 (copy), v11 (copy)
    local v13 = l_useStyle_0();
    local l_Theme_0 = v13.Theme;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = v3.useContext(v6);
    local l_isFullWidth_0 = v18.isFullWidth;
    local l_isFullHeight_0 = v18.isFullHeight;
    local l_modalSize_0 = v18.modalSize;
    if l_isFullWidth_0 or l_isFullHeight_0 then
        v15 = Vector2.new(0.5, 1);
        v16 = "component_assets/bullet_17";
        v17 = UDim2.new(0.5, 0, 1, 0);
    else
        v15 = Vector2.new(0.5, 0.5);
        v16 = "component_assets/circle_17";
        v17 = UDim2.new(0.5, 0, 0.5, 0);
    end;
    return v3.createElement(l_ImageSet_0.ImageSetButton, {
        Selectable = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v13.Theme.Overlay.Color, 
        Transparency = v13.Theme.Overlay.Transparency, 
        AutoButtonColor = false, 
        Modal = l_FFlagGameInviteModalUnlockMouse_0 and true or nil, 
        ZIndex = 0, 
        [v3.Event.Activated] = function() --[[ Line: 52 ]]
            -- upvalues: v7 (ref)
            v7:closeModal();
        end
    }, {
        GameInviteModalContainer = v3.createElement(l_ImageSet_0.ImageSetButton, {
            Position = v17, 
            Size = l_modalSize_0, 
            AnchorPoint = v15, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_Images_0[v16], 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
            ImageTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v11, 
            AutoButtonColor = false, 
            ClipsDescendants = true, 
            Selectable = false
        }, v12.children)
    });
end;