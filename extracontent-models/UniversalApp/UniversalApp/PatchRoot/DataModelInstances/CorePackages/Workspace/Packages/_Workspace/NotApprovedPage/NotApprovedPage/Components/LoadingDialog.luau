local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_View_0 = v1.View;
local l_Skeleton_0 = v1.Skeleton;
local l_Radius_0 = v1.Enums.Radius;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_FullPageModal_0 = require(l_Parent_0.UIBlox).App.Dialog.Modal.FullPageModal;
local v7 = require(l_Parent_0.React);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCallback_0 = v7.useCallback;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_UserInputService_0 = game:GetService("UserInputService");
return v7.memo(function(v13) --[[ Line: 30 ]]
    -- upvalues: l_useTokens_0 (copy), l_UserInputService_0 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v7 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FullPageModal_0 (copy)
    local v14 = l_useTokens_0();
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v17 = l_useSelector_0(function(v16) --[[ Line: 34 ]]
        return v16.ScreenSize;
    end);
    local v18 = l_useCallback_0(function() --[[ Line: 40 ]]
        -- upvalues: v7 (ref), l_View_0 (ref), l_Skeleton_0 (ref), v14 (copy), l_Radius_0 (ref)
        return v7.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium padding-large"
        }, {
            Skeleton1 = v7.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v14.Size.Size_1100), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            })
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v14
    } else l_dependencyArray_0(v14));
    return v7.createElement(l_FullPageModal_0, {
        title = v13.title, 
        screenSize = v17, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        footerContent = v18
    }, v7.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-xlarge padding-xxlarge margin-top-small"
    }, {
        PunishmentDescription = v7.createElement(l_Skeleton_0, {
            Size = UDim2.new(0.8, 0, 0, v14.Size.Size_500), 
            radius = l_Radius_0.Medium, 
            LayoutOrder = 1
        }), 
        WhatHappened = v7.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium", 
            LayoutOrder = 2
        }, {
            Title = v7.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.2, 0, 0, v14.Size.Size_700), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            Content = v7.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v14.Size.Size_2500), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            })
        }), 
        ReviewedEvidence = v7.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium", 
            LayoutOrder = 3
        }, {
            Title = v7.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.2, 0, 0, v14.Size.Size_700), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            Content = v7.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v14.Size.Size_3000), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            })
        })
    }));
end);