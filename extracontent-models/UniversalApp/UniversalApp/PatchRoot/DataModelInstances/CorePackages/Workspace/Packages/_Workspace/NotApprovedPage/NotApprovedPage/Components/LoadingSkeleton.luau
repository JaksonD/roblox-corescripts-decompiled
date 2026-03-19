local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_Radius_0 = v4.Enums.Radius;
local l_ScrollBarVisibility_0 = v4.Enums.ScrollBarVisibility;
local l_ScrollView_0 = v4.ScrollView;
local l_Skeleton_0 = v4.Skeleton;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local v11 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v11.usePreferredInput;
return v3.memo(function() --[[ Line: 25 ]] --[[ Name: LoadingSkeleton ]]
    -- upvalues: l_useTokens_0 (copy), l_usePreferredInput_0 (copy), v11 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v3 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_usePreferredInput_0() == v11.Input.Directional;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local l_Y_1 = l_UserInputService_0.BottomBarSize.Y;
    local l_bottom_0 = l_GuiService_0:GetSafeZoneOffsets().bottom;
    local v18 = if l_Y_1 == 0 then l_bottom_0 else l_Y_1;
    return v3.createElement(l_View_0, {
        tag = "size-full col align-x-center align-y-center bg-surface-0", 
        padding = {
            top = UDim.new(0, l_Y_0), 
            bottom = UDim.new(0, v18)
        }
    }, {
        InnerContainer = v3.createElement(l_View_0, {
            tag = "size-full col gap-large bg-surface-100 radius-large", 
            sizeConstraint = {
                MaxSize = if v14 then Vector2.new(800, 1000) else Vector2.new(600, 800)
            }, 
            LayoutOrder = 1
        }, {
            HeaderSection = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y row flex-between items-center gap-medium padding-xxlarge", 
                LayoutOrder = 1
            }, {
                LeftContent = v3.createElement(l_View_0, {
                    tag = "auto-xy row gap-small items-center", 
                    LayoutOrder = 1
                }, {
                    IconSkeleton = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, v13.Size.Size_800, 0, v13.Size.Size_800), 
                        radius = l_Radius_0.Circle, 
                        LayoutOrder = 1
                    }), 
                    LabelSkeleton = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, v13.Size.Size_3000, 0, v13.Size.Size_700), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 2
                    })
                }), 
                RightContent = v3.createElement(l_View_0, {
                    tag = "auto-xy", 
                    LayoutOrder = 2
                }, {
                    MenuSkeleton = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, v13.Size.Size_800, 0, v13.Size.Size_800), 
                        radius = l_Radius_0.Circle
                    })
                })
            }), 
            Content = v3.createElement(l_View_0, {
                tag = "size-full-0 grow", 
                LayoutOrder = 2
            }, {
                ScrollView = v3.createElement(l_ScrollView_0, {
                    tag = "size-full", 
                    scroll = {
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(1, 0, 1, 0), 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                        scrollBarVisibility = l_ScrollBarVisibility_0.Always
                    }
                }, {
                    Content = v3.createElement(l_View_0, {
                        tag = "size-full-0 auto-y col gap-xlarge padding-x-xxlarge"
                    }, {
                        PunishmentDescription = v3.createElement(l_Skeleton_0, {
                            Size = UDim2.new(0.8, 0, 0, v13.Size.Size_500), 
                            radius = l_Radius_0.Medium, 
                            LayoutOrder = 1
                        }), 
                        WhatHappened = v3.createElement(l_View_0, {
                            tag = "size-full-0 auto-y col gap-medium", 
                            LayoutOrder = 2
                        }, {
                            Title = v3.createElement(l_Skeleton_0, {
                                Size = UDim2.new(0.25, 0, 0, v13.Size.Size_700), 
                                radius = l_Radius_0.Medium, 
                                LayoutOrder = 1
                            }), 
                            Content = v3.createElement(l_Skeleton_0, {
                                Size = UDim2.new(1, 0, 0, v13.Size.Size_2500), 
                                radius = l_Radius_0.Medium, 
                                LayoutOrder = 2
                            })
                        }), 
                        ReviewedEvidence = v3.createElement(l_View_0, {
                            tag = "size-full-0 auto-y col gap-medium", 
                            LayoutOrder = 3
                        }, {
                            Title = v3.createElement(l_Skeleton_0, {
                                Size = UDim2.new(0.25, 0, 0, v13.Size.Size_700), 
                                radius = l_Radius_0.Medium, 
                                LayoutOrder = 1
                            }), 
                            Content = v3.createElement(l_Skeleton_0, {
                                Size = UDim2.new(1, 0, 0, v13.Size.Size_3000), 
                                radius = l_Radius_0.Medium, 
                                LayoutOrder = 2
                            })
                        })
                    })
                })
            }), 
            Footer = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-x-xxlarge padding-bottom-xxlarge padding-top-medium bg-surface-100 radius-large", 
                LayoutOrder = 3
            }, {
                TopCornerCover = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v13.Radius.Large), 
                    Position = UDim2.fromOffset(0, 0), 
                    BackgroundColor3 = v13.Color.Surface.Surface_100.Color3, 
                    BorderSizePixel = 0
                }), 
                ButtonSkeleton = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v13.Size.Size_1100), 
                    radius = l_Radius_0.Medium
                })
            })
        })
    });
end);