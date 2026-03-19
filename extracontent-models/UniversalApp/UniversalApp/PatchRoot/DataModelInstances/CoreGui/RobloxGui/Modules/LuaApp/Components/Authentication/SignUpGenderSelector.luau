local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.FitChildren);
local v7 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v11 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v12 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_UserGender_0 = v12.Enums.UserGender;
local v14 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaLoginGenderSelector);
local l_RegisterAuditContent_0 = v12.Components.RegisterAuditContent;
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp;
local v20 = game:DefineFastFlag("FixGenderSelectorIconLightTheme", false);
local v21 = UDim2.new(0.8888888888888888, 0, 0.8888888888888888, 0);
local v22 = v2.PureComponent:extend("SignUpGenderSelector");
v22.defaultProps = {
    size = UDim2.new(1, 0, 0, 48)
};
v22.init = function(v23) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_UserGender_0 (copy), v14 (copy)
    v23.state = {
        gender = l_UserGender_0.Unknown, 
        hoverRight = false, 
        hoverLeft = false
    };
    v23.isMounted = false;
    v23.onGenderSelected = function(v24) --[[ Line: 66 ]]
        -- upvalues: l_UserGender_0 (ref), v23 (copy), v14 (ref)
        spawn(function() --[[ Line: 67 ]]
            -- upvalues: v24 (ref), l_UserGender_0 (ref), v23 (ref), v14 (ref)
            if v24 == l_UserGender_0.Male then
                v23.props.analytics.reportButtonClicked(v14.Context.SinglePageSignUpScreen, v14.Button.GenderMale);
            else
                v23.props.analytics.reportButtonClicked(v14.Context.SinglePageSignUpScreen, v14.Button.GenderFemale);
            end;
            if v23.isMounted then
                if v23.state.gender == v24 then
                    v24 = l_UserGender_0.Unknown;
                end;
                v23:setState({
                    gender = v24
                });
                if v23.props.onGenderChanged then
                    v23.props.onGenderChanged(v24);
                end;
            end;
        end);
    end;
    v23.isSelectedGenderMale = function() --[[ Line: 96 ]]
        -- upvalues: v23 (copy), l_UserGender_0 (ref)
        return v23.state.gender == l_UserGender_0.Male;
    end;
    v23.isSelectedGenderFemale = function() --[[ Line: 100 ]]
        -- upvalues: v23 (copy), l_UserGender_0 (ref)
        return v23.state.gender == l_UserGender_0.Female;
    end;
    v23.onMouseEnterRight = function() --[[ Line: 104 ]]
        -- upvalues: v23 (copy)
        if v23.isMounted then
            v23:setState({
                hoverRight = true
            });
        end;
    end;
    v23.onMouseLeaveRight = function() --[[ Line: 112 ]]
        -- upvalues: v23 (copy)
        if v23.isMounted then
            v23:setState({
                hoverRight = false
            });
        end;
    end;
    v23.onMouseEnterLeft = function() --[[ Line: 120 ]]
        -- upvalues: v23 (copy)
        if v23.isMounted then
            v23:setState({
                hoverLeft = true
            });
        end;
    end;
    v23.onMouseLeaveLeft = function() --[[ Line: 128 ]]
        -- upvalues: v23 (copy)
        if v23.isMounted then
            v23:setState({
                hoverLeft = false
            });
        end;
    end;
end;
v22.didMount = function(v25) --[[ Line: 137 ]] --[[ Name: didMount ]]
    v25.isMounted = true;
end;
v22.willUnmount = function(v26) --[[ Line: 141 ]] --[[ Name: willUnmount ]]
    v26.isMounted = false;
end;
v22.render = function(v27) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), l_withStyle_0 (copy), v5 (copy), v2 (copy), v6 (copy), v7 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), l_RegisterAuditContent_0 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v11 (copy), l_UserGender_0 (copy), v21 (copy), l_Images_0 (copy), v20 (copy)
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_size_0 = v27.props.size;
    local v30 = v17() == 1 and "Authentication.SignUp.Label.OptionalGender" or "Authentication.SignUp.Label.Gender";
    return l_withStyle_0(function(v31) --[[ Line: 150 ]]
        -- upvalues: v5 (ref), v17 (ref), v2 (ref), v6 (ref), l_layoutOrder_0 (copy), v7 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v27 (copy), l_RegisterAuditContent_0 (ref), v30 (copy), l_size_0 (copy), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v11 (ref), l_UserGender_0 (ref), v21 (ref), l_Images_0 (ref), v20 (ref)
        return v5({
            titleText = v17() == 1 and "Authentication.SignUp.Label.OptionalGender" or "Authentication.SignUp.Label.Gender"
        })(function(v32) --[[ Line: 153 ]]
            -- upvalues: v2 (ref), v6 (ref), l_layoutOrder_0 (ref), v7 (ref), v31 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v27 (ref), l_RegisterAuditContent_0 (ref), v30 (ref), l_size_0 (ref), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v11 (ref), l_UserGender_0 (ref), v21 (ref), l_Images_0 (ref), v20 (ref)
            return v2.createElement(v6.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v6.FitAxis.Height, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, 5)
                }), 
                Title = v32.titleText and v2.createElement(v7, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v6.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v32.titleText or "", 
                    TextWrapped = true, 
                    Font = v31.Font.CaptionHeader.Font, 
                    TextSize = v31.Font.BaseSize * v31.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v31.Theme.TextEmphasis.Color, 
                    TextTransparency = v31.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                RegisterTitleAuditContent = if l_GetFFlagEnableAuditForSinglePageSignUp_0() and v27.props.enableAuditContentCapture and v32.titleText then v2.createElement(l_RegisterAuditContent_0, {
                    translationKey = v30, 
                    translatedSourceString = v32.titleText
                }) else nil, 
                Frame = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    Size = l_size_0, 
                    BackgroundTransparency = 1
                }, {
                    Boundary = v2.createElement(l_ImageSetLabel_0, {
                        ZIndex = 3, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = l_GetImageData_0("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke", 
                        ImageColor3 = v31.Theme.SecondaryDefault.Color
                    }), 
                    BackgroundImage = v2.createElement(l_ImageSetLabel_0, {
                        ZIndex = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v31.Theme.SecondaryDefault.Color
                    }, {
                        UIListLayout2 = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 1)
                        }), 
                        Left = v2.createElement(v11, {
                            LayoutOrder = 1, 
                            Size = UDim2.new(0.5, 0, 1, 0), 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(7, 8, 7, 8), 
                            ClipsDescendants = true, 
                            Image = "LuaApp/buttons/buttonLeftFill", 
                            ImageColor3 = v31.Theme.BackgroundContrast.Color, 
                            ImageTransparency = 0, 
                            [v2.Event.Activated] = function() --[[ Line: 238 ]]
                                -- upvalues: v27 (ref), l_UserGender_0 (ref)
                                v27.onGenderSelected(l_UserGender_0.Female);
                            end, 
                            [v2.Event.MouseEnter] = v27.onMouseEnterLeft, 
                            [v2.Event.MouseLeave] = v27.onMouseLeaveLeft
                        }, {
                            LeftIcon = v2.createElement(l_ImageSetLabel_0, {
                                LayoutOrder = 1, 
                                Size = v21, 
                                BorderSizePixel = 0, 
                                ScaleType = Enum.ScaleType.Fit, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                ClipsDescendants = true, 
                                Image = if v27.isSelectedGenderFemale() then l_Images_0["icons/common/gender_female_selected"] else l_Images_0["icons/common/gender_female"], 
                                ImageColor3 = if v20 then v31.Theme.IconEmphasis.Color else nil, 
                                ImageTransparency = if v20 then v31.Theme.IconEmphasis.Transparency else v31.Theme.BackgroundUIDefault.Transparency, 
                                BackgroundTransparency = 1
                            })
                        }), 
                        Right = v2.createElement(v11, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(0.5, -1, 1, 0), 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(1, 8, 1, 8), 
                            ClipsDescendants = true, 
                            Image = "LuaApp/buttons/buttonRightFill", 
                            ImageColor3 = v31.Theme.BackgroundContrast.Color, 
                            ImageTransparency = 0, 
                            [v2.Event.Activated] = function() --[[ Line: 278 ]]
                                -- upvalues: v27 (ref), l_UserGender_0 (ref)
                                v27.onGenderSelected(l_UserGender_0.Male);
                            end, 
                            [v2.Event.MouseEnter] = v27.onMouseEnterRight, 
                            [v2.Event.MouseLeave] = v27.onMouseLeaveRight
                        }, {
                            RightIcon = v2.createElement(l_ImageSetLabel_0, {
                                LayoutOrder = 1, 
                                Size = v21, 
                                BorderSizePixel = 0, 
                                ScaleType = Enum.ScaleType.Fit, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                ClipsDescendants = true, 
                                Image = if v27.isSelectedGenderMale() then l_Images_0["icons/common/gender_male_selected"] else l_Images_0["icons/common/gender_male"], 
                                ImageColor3 = if v20 then v31.Theme.IconEmphasis.Color else nil, 
                                ImageTransparency = if v20 then v31.Theme.IconEmphasis.Transparency else v31.Theme.BackgroundUIDefault.Transparency, 
                                BackgroundTransparency = 1
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v15
})(v22));