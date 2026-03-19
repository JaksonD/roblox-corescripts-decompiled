local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppHooks);
local v4 = require(l_Parent_0.PeekView);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.NavigationRodux);
local v7 = require(l_Parent_0.Foundation);
local v8 = require(l_Parent_0.InputUi);
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v10 = require(l_Parent_0.SharedFlags);
local v11 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local v14 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_NavigateBack_0 = v6.Thunks.NavigateBack;
local l_useScreenSize_0 = v3.useScreenSize;
local l_useTopBarHeight_0 = v3.useTopBarHeight;
local l_getSafeAreaSize_0 = v8.getSafeAreaSize;
local l_PeekViewWithTopBar_0 = v4.PeekViewWithTopBar;
local l_PeekViewState_0 = v4.PeekViewState;
local l_FFlagProfilePlatformNewProfileHeader_0 = v10.FFlagProfilePlatformNewProfileHeader;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = v10.FFlagSwitchProfileWidthHookToSocialCommon;
local l_IconButton_0 = v7.IconButton;
local l_View_0 = v7.View;
local v28 = {
    position = UDim2.fromScale(0, 0), 
    size = UDim2.fromScale(1, 1), 
    anchorPoint = Vector2.new(0, 0)
};
return function(_) --[[ Line: 41 ]] --[[ Name: AboutDetailsSheet ]]
    -- upvalues: l_useTopBarHeight_0 (copy), l_useDispatch_0 (copy), v11 (copy), v12 (copy), l_useScreenSize_0 (copy), l_useSelector_0 (copy), l_getSafeAreaSize_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v14 (copy), v13 (copy), v2 (copy), l_NavigateBack_0 (copy), l_PeekViewState_0 (copy), l_useNavigationProps_0 (copy), v28 (copy), l_View_0 (copy), l_PeekViewWithTopBar_0 (copy), l_IconButton_0 (copy)
    local v30 = UDim.new(0.55, 0);
    local v31 = l_useTopBarHeight_0();
    local v32 = l_useDispatch_0();
    local v33 = v11();
    local v34 = v33.formFactor == v12.ProfileFormFactor.Wide;
    local v35 = l_useScreenSize_0();
    local v37 = l_useSelector_0(function(v36) --[[ Line: 49 ]]
        return v36.GlobalGuiInset;
    end);
    local v39 = l_useSelector_0(function(v38) --[[ Line: 52 ]]
        return v38.TopBar.statusBarHeight;
    end);
    local v40 = l_getSafeAreaSize_0(v35, v37);
    local v41 = (if l_FFlagProfilePlatformNewProfileHeader_0 then if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v14(v34) else math.min(v40.X.Offset, v13.MAXIMUM_CONTAINER_WIDTH)) / v40.X.Offset;
    local v42 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v32 (copy), l_NavigateBack_0 (ref)
        v32(l_NavigateBack_0(true));
    end, {
        v32
    });
    local v43 = v2.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: v42 (copy)
        v42();
    end, {
        v42
    });
    local v47 = v2.useCallback(function(v44, _, _) --[[ Line: 73 ]]
        -- upvalues: l_PeekViewState_0 (ref), v42 (copy)
        if v44 == l_PeekViewState_0.Closed then
            v42();
        end;
    end, {
        v42
    });
    local v50 = l_useNavigationProps_0(function(_, v49) --[[ Line: 79 ]]
        return {
            sections = v49.sections
        };
    end).sections or {};
    local v51 = {
        position = UDim2.fromScale(1, 0), 
        size = UDim2.fromScale(v41, 1), 
        anchorPoint = Vector2.new(1, 0)
    };
    local v52 = v2.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v34 (copy), v51 (copy), v28 (ref)
        if v34 then
            return v51;
        else
            return v28;
        end;
    end, {
        v33.formFactor
    });
    return v2.createElement(l_View_0, {
        Size = v52.size, 
        Position = v52.position, 
        AnchorPoint = v52.anchorPoint
    }, {
        AboutDetailsSheet = v2.createElement(l_PeekViewWithTopBar_0, {
            briefViewContentHeight = v30, 
            fullViewContentHeight = UDim.new(1, -v31), 
            onViewStateChanged = v47, 
            topBarHeight = v31, 
            topBarSlot = v2.createElement(l_View_0, {
                tag = "bg-surface-100", 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(0, 0, 0, v31), 
                Active = true, 
                BorderSizePixel = 0
            }, {
                LeftNavigationButton = v2.createElement(l_IconButton_0, {
                    Position = UDim2.new(0, 15, 0, v39), 
                    BackgroundTransparency = 1, 
                    onActivated = v43, 
                    icon = "icons/navigation/close"
                })
            }), 
            contentSlot = v2.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 1, -v31), 
                tag = "auto-y align-x-center col padding-bottom-large"
            }, {
                Contents = v2.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    tag = "align-x-center col padding-x-xlarge gap-xlarge padding-top-large padding-bottom-large"
                }, {
                    ContentSections = v2.createElement(v2.Fragment, {}, v50)
                })
            })
        })
    });
end;