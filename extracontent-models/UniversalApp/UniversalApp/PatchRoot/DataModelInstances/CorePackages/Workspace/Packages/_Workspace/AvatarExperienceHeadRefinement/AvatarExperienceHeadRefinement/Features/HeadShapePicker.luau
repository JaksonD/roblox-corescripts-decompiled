local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.AppCommonStyle);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagDHMHideHeadRefinementSubheading_0 = v7.FFlagDHMHideHeadRefinementSubheading;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v7.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXEnableResponsiveHeadRefinementMenu_0 = v7.FFlagAXEnableResponsiveHeadRefinementMenu;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local v13 = require(l_script_FirstAncestor_0.Components.HeadShapeList);
local l_Toggle_0 = v6.Toggle;
local l_Divider_0 = v6.Divider;
local l_View_0 = v6.View;
local l_InputSize_0 = v6.Enums.InputSize;
local l_Loading_0 = v6.Loading;
local l_IconSize_0 = v6.Enums.IconSize;
local _ = require(l_script_FirstAncestor_0.Enums.HeadShapeTileSize);
local v21 = require(l_script_FirstAncestor_0.Utils.sortHeadShapes);
local l_useDesignTokens_0 = v5.useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v24) --[[ Line: 48 ]] --[[ Name: HeadShapePicker ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_FFlagDHMHideHeadRefinementSubheading_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v2 (copy), v21 (copy), l_StyledTextLabel_0 (copy), l_Loading_0 (copy), l_IconSize_0 (copy), l_LoadingSpinner_0 (copy), v13 (copy), l_FFlagAXEnableResponsiveHeadRefinementMenu_0 (copy), l_View_0 (copy), l_Divider_0 (copy), l_Toggle_0 (copy), l_InputSize_0 (copy)
    local v25 = l_useDesignTokens_0();
    local v26 = l_useLocalization_0({
        headingText = "Feature.Avatar.Label.HeadRefinement.Title", 
        subheadingText = not l_FFlagDHMHideHeadRefinementSubheading_0 and "Feature.Avatar.Label.HeadRefinement.Description" or nil, 
        unsupportedText = "Feature.Avatar.Label.HeadRefinement.Description.Unsupported", 
        facialAnimationLabel = l_FFlagHeadRefinementFacialAnimationToggle_0 and "Feature.Avatar.Label.HeadRefinement.FacialAnimation" or nil
    });
    local v28 = v2.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v21 (ref), v24 (copy)
        return v21(v24.items or {}, function(v27) --[[ Line: 62 ]]
            return v27.headShapeName;
        end);
    end, {
        v24.items
    });
    return v2.createElement("Frame", {
        Size = v24.size or UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = v25.Semantic.Color.Background.Default.Color3, 
        BackgroundTransparency = v25.Semantic.Color.Background.Default.Transparency, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerContainer", 
        ref = v24.containerRef, 
        NextSelectionUp = v24.NextSelectionUp
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v25.Global.Size_200), 
            PaddingBottom = UDim.new(0, v25.Global.Size_250)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v25.Semantic.Radius.Medium)
        }), 
        Heading = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerHeadingText"
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v25.Global.Size_250), 
                PaddingRight = UDim.new(0, v25.Global.Size_250), 
                PaddingBottom = UDim.new(0, v25.Global.Size_150)
            }), 
            StyledTextLabel = v2.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.XY, 
                size = UDim2.new(0, 0, 0, 0), 
                text = v26.headingText, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v25.Semantic.Typography.Header, 
                colorStyle = v25.Semantic.Color.Text.Emphasis
            })
        }), 
        HeadShapePickerLoading = if v24.isLoading then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v25.Global.Size_150), 
                PaddingBottom = UDim.new(0, v25.Global.Size_150)
            }), 
            Spinner = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v2.createElement(l_Loading_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v25.Global.Size_250, 0.5, 0), 
                size = l_IconSize_0.Medium
            }) else v2.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.new(0, v25.Global.Size_250, 0.5, 0), 
                size = UDim2.fromOffset(v25.Semantic.Icon.Size.Medium, v25.Semantic.Icon.Size.Medium)
            })
        }) else nil, 
        Subheading = if not v24.isLoading and (not l_FFlagDHMHideHeadRefinementSubheading_0 or v24.isUnsupported) then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerSubheadingText"
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v25.Global.Size_250), 
                PaddingRight = UDim.new(0, v25.Global.Size_250), 
                PaddingBottom = if v24.isUnsupported then nil else UDim.new(0, v25.Global.Size_150)
            }), 
            StyledTextLabel = v2.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.XY, 
                size = UDim2.new(0, 0, 0, 0), 
                text = if v24.isUnsupported then v26.unsupportedText else v26.subheadingText, 
                textWrapped = true, 
                textXAlignment = Enum.TextXAlignment.Left, 
                fontStyle = v25.Semantic.Typography.CaptionBody, 
                colorStyle = v25.Semantic.Color.Text.Default
            })
        }) else nil, 
        HeadShapeList = if not not v24.isUnsupported or v24.isLoading then nil else v2.createElement(v13, {
            orientation = v24.orientation, 
            tileSize = v24.tileSize, 
            items = v28, 
            LayoutOrder = 3, 
            NextSelectionUp = v24.NextSelectionUp, 
            maxHeight = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then v24.headShapeListMaxHeight else nil
        }), 
        FacialAnimationDivider = if not (not l_FFlagHeadRefinementFacialAnimationToggle_0 or v24.isLoading) and v24.isFacialAnimationEnabled ~= nil and v24.onFacialAnimationToggle ~= nil then v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 4, 
            testId = "AvatarExperienceHeadRefinement_FacialAnimationDivider"
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v25.Global.Size_250), 
                PaddingRight = UDim.new(0, v25.Global.Size_250), 
                PaddingTop = UDim.new(0, v25.Global.Size_150), 
                PaddingBottom = UDim.new(0, v25.Global.Size_150)
            }), 
            Divider = v2.createElement(l_Divider_0, {
                Orientation = Enum.FillDirection.Horizontal, 
                Size = UDim2.new(1, 0, 0, 1)
            })
        }) else nil, 
        FacialAnimationToggle = if not (not l_FFlagHeadRefinementFacialAnimationToggle_0 or v24.isLoading) and v24.isFacialAnimationEnabled ~= nil and v24.onFacialAnimationToggle ~= nil then v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 5, 
            testId = "AvatarExperienceHeadRefinement_FacialAnimationToggle"
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v25.Global.Size_250), 
                PaddingRight = UDim.new(0, v25.Global.Size_250), 
                PaddingTop = UDim.new(0, v25.Global.Size_150), 
                PaddingBottom = UDim.new(0, v25.Global.Size_150)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v25.Global.Size_200)
            }), 
            ToggleWrapper = v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 1
            }, {
                Toggle = v2.createElement(l_Toggle_0, {
                    isChecked = v24.isFacialAnimationEnabled, 
                    onActivated = function(v29) --[[ Line: 223 ]] --[[ Name: onActivated ]]
                        -- upvalues: v24 (copy)
                        if v24.onFacialAnimationToggle then
                            v24.onFacialAnimationToggle(v29);
                        end;
                    end, 
                    label = "", 
                    size = l_InputSize_0.Medium, 
                    testId = "AvatarExperienceHeadRefinement_FacialAnimationToggleButton"
                })
            }), 
            Label = v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 2
            }, {
                StyledTextLabel = v2.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.XY, 
                    size = UDim2.new(0, 0, 0, 0), 
                    text = v26.facialAnimationLabel, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = v25.Semantic.Typography.CaptionBody, 
                    colorStyle = v25.Semantic.Color.Text.Default
                })
            })
        }) else nil
    });
end;