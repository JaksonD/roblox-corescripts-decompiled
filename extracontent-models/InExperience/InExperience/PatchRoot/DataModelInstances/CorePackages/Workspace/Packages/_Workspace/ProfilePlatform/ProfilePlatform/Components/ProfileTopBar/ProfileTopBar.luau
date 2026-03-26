local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLastInputMode_0 = v4.useLastInputMode;
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v11 = require(l_Parent_0.Foundation);
local l_View_0 = v11.View;
local l_Divider_0 = v11.Divider;
local v14 = l_Images_0["icons/navigation/close"];
local v15 = v9.USER_PROFILE_HEADER_HEIGHT + v9.CTA_BUTTON_HEIGHT + v9.PAGE_PADDING;
return function(v16) --[[ Line: 33 ]]
    -- upvalues: l_useLastInputMode_0 (copy), l_useStyle_0 (copy), v10 (copy), v2 (copy), v15 (copy), l_View_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy), l_Divider_0 (copy)
    local v17 = l_useLastInputMode_0() == "Focus";
    local v18 = l_useStyle_0();
    local v19 = v10();
    local v20 = if v19 then v19.scrollY else 0;
    local v21 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v16 (copy)
        v16.navigateBack();
    end, {
        v16.navigateBack
    });
    local v23 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v16 (copy), v15 (ref), v20 (copy)
        if v16.backgroundTransparency ~= nil then
            return v16.backgroundTransparency;
        else
            local v22 = v15 - 50;
            if v20 < v22 then
                return 1;
            elseif v15 <= v20 then
                return 0;
            else
                return 1 - (v20 - v22) / 50;
            end;
        end;
    end, {
        v16.backgroundTransparency, 
        v20
    });
    return (v2.createElement(l_View_0, {
        tag = "bg-surface-0 position-top-left size-full-full", 
        backgroundStyle = {
            Transparency = v23
        }, 
        ZIndex = 100
    }, {
        LeftNavigationButton = if not v17 then v2.createElement(l_View_0, {
            tag = "bg-over-media-0 radius-circle", 
            Position = UDim2.new(0, 10, 0, 10), 
            Size = UDim2.new(0, 36, 0, 36), 
            onActivated = v21, 
            backgroundStyle = {
                Transparency = 1 - v23
            }
        }, {
            InnerButton = v2.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                [v2.Event.Activated] = v21
            }, {
                CloseButtonImage = v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 24, 0, 24), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v14, 
                    ImageColor3 = v18.Theme.IconEmphasis.Color, 
                    ImageTransparency = v18.Theme.IconEmphasis.Transparency, 
                    BackgroundTransparency = 1
                })
            })
        }) else nil, 
        BottomDivider = v2.createElement(l_Divider_0, {
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 0, 1), 
            Visible = v23 < 1
        })
    }));
end;