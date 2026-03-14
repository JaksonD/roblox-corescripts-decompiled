local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.Localization);
local v6 = require(l_Parent_1.Otter);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_1.ReactOtter);
local v9 = require(l_Parent_1.RoactUtils);
local v10 = require(l_Parent_1.RobloxAppHooks);
local v11 = require(l_Parent_1.UIBlox);
local v12 = require(l_Parent_0.Components.FeedHeader.FeedHeader);
local l_View_0 = v4.View;
local l_ContextualMenu_0 = v11.App.Menu.ContextualMenu;
local v15 = require(l_Parent_0.Analytics.EventNames);
local v16 = require(l_Parent_0.App.FeedContext);
local l_Images_0 = v11.App.ImageSet.Images;
local l_MenuDirection_0 = v11.App.Menu.MenuDirection;
local v19 = require(l_Parent_0.Thunks.RemovePost);
local v20 = require(l_Parent_0.Hooks.useAnalytics);
local l_useAnimatedBinding_0 = v8.useAnimatedBinding;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v24 = require(l_Parent_0.Hooks.useSafeZoneOffsets);
local l_useScreenSize_0 = v10.useScreenSize;
local l_useTokens_0 = v4.Hooks.useTokens;
local v27 = {
    motorCallback = v6.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
return function(v28) --[[ Line: 58 ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v16 (copy), l_useLocalization_0 (copy), v20 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useScreenSize_0 (copy), v24 (copy), l_useAnimatedBinding_0 (copy), v8 (copy), v15 (copy), l_ContextActionService_0 (copy), v19 (copy), l_Images_0 (copy), l_View_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), v27 (copy), v12 (copy)
    local v29 = if l_Players_0 and l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "";
    local v30 = v7.useContext(v16);
    local v31 = l_useLocalization_0({
        removePost = "Feature.ContentFeed.Action.Delete", 
        report = "Feature.ContentFeed.Action.Report"
    });
    local v32 = v20();
    local v33 = l_useDispatch_0();
    local v34 = l_useTokens_0();
    local v35 = l_useScreenSize_0();
    local v36 = v24();
    local v37, v38 = v7.useState(false);
    local v39, v40 = l_useAnimatedBinding_0(0);
    v7.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v30 (copy), v40 (copy), v8 (ref)
        if v30.isZooming then
            v40(v8.spring(1, {
                dampingRatio = 1, 
                frequency = 4
            }));
            return;
        else
            v40(v8.spring(0, {
                dampingRatio = 1, 
                frequency = 4
            }));
            return;
        end;
    end, {
        v30.isZooming
    });
    local v41 = v7.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v38 (copy)
        v38(false);
    end, {});
    local v42 = v7.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v30 (copy), v32 (copy), v15 (ref), v28 (copy)
        if v30.isZooming then
            return;
        else
            v32.fireEvent(v15.ContentFeedExitCtaPressed, {
                postId = v28.postId
            });
            v30.navigateBack(false);
            return;
        end;
    end, {
        v32.fireEvent, 
        v30.isZooming, 
        v30.navigateBack
    });
    local v43 = v7.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v32 (copy), v15 (ref), v28 (copy), v30 (copy)
        v32.fireEvent(v15.ContentFeedCloseShortcutPressed, {
            postId = v28.postId
        });
        v30.navigateBack(false);
    end, {
        v32.fireEvent, 
        v30.navigateBack
    });
    v7.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: l_ContextActionService_0 (ref), v43 (copy)
        l_ContextActionService_0:BindCoreAction("ContentFeedCloseShortcutAction", function(_, v45) --[[ Line: 114 ]]
            -- upvalues: v43 (ref)
            if v45 == Enum.UserInputState.End then
                v43();
            end;
        end, false, Enum.KeyCode.Escape);
        return function() --[[ Line: 120 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("ContentFeedCloseShortcutAction");
        end;
    end, {
        v43
    });
    local v46 = v7.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v30 (copy), v32 (copy), v15 (ref), v28 (copy), v38 (copy), v37 (copy)
        if v30.isZooming then
            return;
        else
            v32.fireEvent(v15.ContentFeedMoreMenuButtonPressed, {
                postId = v28.postId
            });
            v38(not v37);
            return;
        end;
    end, {
        v32.fireEvent, 
        v30.isZooming, 
        v37, 
        v28.postId
    });
    local v47 = v7.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v32 (copy), v15 (ref), v28 (copy), v30 (copy), v38 (copy)
        v32.fireEvent(v15.ContentFeedReportCtaPressed, {
            postId = v28.postId
        });
        v30.navigateToReportPage(v28.postId);
        v38(false);
    end, {
        v32.fireEvent, 
        v30.navigateToReportPage, 
        v28.postId
    });
    local v48 = v7.useCallback(function() --[[ Line: 144 ]]
        -- upvalues: v32 (copy), v15 (ref), v28 (copy), v33 (copy), v19 (ref), v38 (copy)
        v32.fireEvent(v15.ContentFeedDeleteCtaPressed, {
            postId = v28.postId
        });
        v33(v19(v28.postId));
        v28.removePostTransition();
        v38(false);
    end, {
        v32.fireEvent, 
        v28.postId, 
        v28.removePostTransition
    });
    local v49 = {};
    if v28.creatorId ~= v29 then
        table.insert(v49, {
            icon = l_Images_0["icons/actions/feedback"], 
            onActivated = v47, 
            text = v31.report
        });
    end;
    if v28.creatorId == v29 then
        table.insert(v49, {
            icon = l_Images_0["icons/actions/edit/delete"], 
            onActivated = v48, 
            text = v31.removePost
        });
    end;
    return v7.createElement(l_View_0, {
        GroupTransparency = if v30.isZooming then v39:map(function(v50) --[[ Line: 173 ]]
            return v50;
        end) else nil, 
        Position = UDim2.fromOffset(0, v36.top), 
        Size = UDim2.new(1, 0, 0, 56), 
        tag = "bg-action-subtle", 
        ZIndex = v28.ZIndex
    }, {
        GradientBackdrop = v7.createElement(l_View_0, {
            Position = UDim2.fromOffset(0, -v36.top), 
            Size = UDim2.new(1, 0, 1, v36.top), 
            tag = "col size-full-full bg-contrast", 
            ZIndex = 0
        }, {
            UIGradient = v7.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v34.Color.OverMedia.OverMedia_0.Color3), 
                    ColorSequenceKeypoint.new(1, v34.Color.OverMedia.OverMedia_0.Color3)
                }), 
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.5), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        ContextualMenu = v7.createElement(l_ContextualMenu_0, {
            buttonProps = v49, 
            closeBackgroundVisible = false, 
            horizontalAlignment = Enum.HorizontalAlignment.Right, 
            menuDirection = l_MenuDirection_0.Down, 
            motorOverrideOptions = v27, 
            onDismiss = v41, 
            open = v37, 
            openPositionX = UDim.new(0, -12), 
            openPositionY = UDim.new(0, 56), 
            screenSize = v35, 
            zIndex = 2
        }), 
        FeedHeader = v7.createElement(v12, {
            isContextualMenuOpen = v37, 
            isPlaceholderPost = v28.isPlaceholderPost, 
            onBackActivated = v42, 
            onMoreActivated = v46, 
            ZIndex = 1
        })
    });
end;