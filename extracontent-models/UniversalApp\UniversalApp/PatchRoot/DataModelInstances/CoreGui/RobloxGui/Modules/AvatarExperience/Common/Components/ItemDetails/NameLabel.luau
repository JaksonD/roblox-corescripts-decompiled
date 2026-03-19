local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.Constant.IconSize;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_RoactFitComponents_0 = v3.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v14 = l_Images_0["icons/status/premium_small"];
return function(v15) --[[ Line: 37 ]] --[[ Name: NameLabel ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_IconSize_0 (copy), v1 (copy), l_FitFrameVertical_0 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy), l_Skeleton_0 (copy)
    local v16 = l_useStyle_0();
    local l_Theme_0 = v16.Theme;
    local l_Font_0 = v16.Font;
    local v19, v20 = v2.createBinding(false);
    local function v24(v21) --[[ Line: 49 ]]
        -- upvalues: v15 (copy), v20 (copy)
        if not v15.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v15.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v23 = l_current_0.AbsolutePosition.Y > v21.AbsolutePosition.Y;
                l_current_0.Visible = not v23;
                v20(v23);
                return;
            end;
        end;
    end;
    local function _() --[[ Line: 68 ]]
        -- upvalues: l_Font_0 (copy)
        return l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    end;
    local function _() --[[ Line: 74 ]]
        -- upvalues: v15 (copy)
        return v15.name or "";
    end;
    local l_Small_0 = l_IconSize_0.Small;
    local v28 = v15.name or "";
    local l_Font_1 = l_Font_0.Header1.Font;
    local v30 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local l_showPremiumBenefits_0 = v15.showPremiumBenefits;
    return v1.createElement(l_FitFrameVertical_0, {
        width = UDim.new(1, 0), 
        LayoutOrder = 0, 
        BackgroundTransparency = 1, 
        [v1.Change.AbsolutePosition] = v24
    }, {
        TextLabel = if l_IsVRAppBuild_0() then nil else if v28 then v1.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            Visible = v19, 
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            Text = v28, 
            TextSize = v30, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextWrapped = true
        }, {
            PremiumIcon = if l_showPremiumBenefits_0 then v1.createElement(l_ImageSetLabel_0, {
                Position = UDim2.new(0, 0, 0, 5), 
                Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
                ScaleType = Enum.ScaleType.Fit, 
                Image = v14, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                BackgroundTransparency = 1
            }) else nil
        }) else v1.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v30)
        }), 
        RefUpdater = v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            [v1.Ref] = function(v32) --[[ Line: 125 ]]
                -- upvalues: v15 (copy), v20 (copy)
                if v32 and v32.Parent then
                    local l_Parent_0 = v32.Parent;
                    if not v15.actionBarHeaderRef then
                        return;
                    else
                        local l_current_1 = v15.actionBarHeaderRef.current;
                        if not l_current_1 then
                            return;
                        else
                            local v35 = l_current_1.AbsolutePosition.Y > l_Parent_0.AbsolutePosition.Y;
                            l_current_1.Visible = not v35;
                            v20(v35);
                        end;
                    end;
                end;
            end
        })
    });
end;