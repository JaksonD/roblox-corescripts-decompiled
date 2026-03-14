local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.FocusNavigationUtils);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useTopBarHeight_0 = require(l_Parent_0.RobloxAppHooks).useTopBarHeight;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useLastInputMode_0 = v5.useLastInputMode;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local v14 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v15 = require(l_Parent_0.Foundation);
local l_View_0 = v15.View;
local l_Divider_0 = v15.Divider;
local v18 = v12 and 10 or 15;
local v19 = l_Images_0["icons/navigation/close"];
local v20 = v13.USER_PROFILE_HEADER_HEIGHT + v13.CTA_BUTTON_HEIGHT + v13.PAGE_PADDING;
return function(v21) --[[ Line: 39 ]]
    -- upvalues: l_useLastInputMode_0 (copy), l_useSelector_0 (copy), l_useTopBarHeight_0 (copy), l_useStyle_0 (copy), v12 (copy), v14 (copy), v2 (copy), v18 (copy), v20 (copy), l_View_0 (copy), l_ImageSetLabel_0 (copy), v19 (copy), l_Divider_0 (copy)
    local v22 = l_useLastInputMode_0() == "Focus";
    local v24 = l_useSelector_0(function(v23) --[[ Line: 41 ]]
        return v23.TopBar.statusBarHeight;
    end);
    local v25 = l_useTopBarHeight_0();
    local v26 = l_useStyle_0();
    local v27 = if v12 then v14() else nil;
    local v28 = if v27 then v27.scrollY else 0;
    local v29 = v2.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v21 (copy)
        v21.navigateBack();
    end, {
        v21.navigateBack
    });
    local v30 = if v12 then v18 else v24;
    local v32 = if v12 then v2.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v21 (copy), v20 (ref), v28 (copy)
        if v21.backgroundTransparency ~= nil then
            return v21.backgroundTransparency;
        else
            local v31 = v20 - 50;
            if v28 < v31 then
                return 1;
            elseif v20 <= v28 then
                return 0;
            else
                return 1 - (v28 - v31) / 50;
            end;
        end;
    end, {
        v21.backgroundTransparency, 
        v28
    }) else nil;
    if v12 then
        return (v2.createElement(l_View_0, {
            tag = "bg-surface-0 position-top-left size-full-full", 
            backgroundStyle = {
                Transparency = v32
            }, 
            ZIndex = 100
        }, {
            LeftNavigationButton = if not v22 then v2.createElement(l_View_0, {
                tag = "bg-over-media-0 radius-circle", 
                Position = UDim2.new(0, v18, 0, v30), 
                Size = UDim2.new(0, 36, 0, 36), 
                onActivated = v29, 
                backgroundStyle = {
                    Transparency = 1 - v32
                }
            }, {
                InnerButton = v2.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v2.Event.Activated] = v29
                }, {
                    CloseButtonImage = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, 24, 0, 24), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = v19, 
                        ImageColor3 = v26.Theme.IconEmphasis.Color, 
                        ImageTransparency = v26.Theme.IconEmphasis.Transparency, 
                        BackgroundTransparency = 1
                    })
                })
            }) else nil, 
            BottomDivider = v2.createElement(l_Divider_0, {
                Position = UDim2.new(0, 0, 1, -1), 
                Size = UDim2.new(1, 0, 0, 1), 
                Visible = v32 < 1
            })
        }));
    else
        return v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v25), 
            BackgroundTransparency = 0, 
            Active = true, 
            BackgroundColor3 = v26.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = nil
        }, {
            LeftNavigationButton = if not v22 then v2.createElement("TextButton", {
                Position = UDim2.new(0, v18, 0, v30), 
                Size = UDim2.new(0, 36, 0, 36), 
                BackgroundTransparency = 1, 
                Text = "", 
                [v2.Event.Activated] = v29
            }, {
                CloseButtonImage = v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 36, 0, 36), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v19, 
                    ImageColor3 = v26.Theme.IconEmphasis.Color, 
                    ImageTransparency = v26.Theme.IconEmphasis.Transparency, 
                    BackgroundTransparency = 1
                })
            }) else nil
        });
    end;
end;