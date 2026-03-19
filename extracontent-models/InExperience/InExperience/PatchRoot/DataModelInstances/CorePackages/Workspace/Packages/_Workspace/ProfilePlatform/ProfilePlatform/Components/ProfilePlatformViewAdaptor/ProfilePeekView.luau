local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.PeekView);
local l_PeekView_0 = v3.PeekView;
local l_PeekViewState_0 = v3.PeekViewState;
local v6 = require(l_Parent_0.RoactUtils);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v11 = l_FFlagProfilePlatformNewProfileHeader_0 and 0 or 25;
return function(v12) --[[ Line: 37 ]] --[[ Name: ProfilePeekView ]]
    -- upvalues: l_useSelector_0 (copy), v2 (copy), l_PeekViewState_0 (copy), l_View_0 (copy), v11 (copy), l_PeekView_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), v8 (copy)
    local v14 = v12.statusBarHeight or l_useSelector_0(function(v13) --[[ Line: 39 ]]
        return v13.TopBar.statusBarHeight;
    end);
    local v18 = v2.useCallback(function(v15, v16, v17) --[[ Line: 43 ]]
        -- upvalues: l_PeekViewState_0 (ref), v12 (copy)
        if v15 == l_PeekViewState_0.Closed and v12.onClosed then
            v12.onClosed();
        end;
        if v12.onViewStateChanged then
            v12.onViewStateChanged(v15, v16, v17);
        end;
    end, {
        v12.onClosed, 
        v12.onViewStateChanged
    });
    local v19, v20 = v2.useBinding(0);
    return v2.createElement(l_View_0, {
        tag = "position-top-left", 
        Size = UDim2.new(v12.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
    }, {
        StatusBarSpace = v2.createElement(l_View_0, {
            tag = "position-top-left bg-surface-0", 
            Size = UDim2.new(1, 0, 0, v14), 
            BorderSizePixel = 0, 
            ZIndex = 999
        }), 
        ProfileContent = v2.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 1, -v14 + v11), 
            Position = UDim2.new(0, 0, 0, v14 - v11)
        }, {
            PeekView = v2.createElement(l_PeekView_0, {
                hasScrim = true, 
                fullViewContentHeight = v12.fullViewContentHeight, 
                briefViewContentHeight = if v12.briefViewContentHeight then v12.briefViewContentHeight else UDim.new(0.5, 0), 
                bottomDockedContainerHeight = v12.bottomDockedContainerHeight, 
                bottomDockedContainerContent = {
                    PeekViewBottomBar = v12.bottomBarSlot
                }, 
                mountAsFullView = v12.mountAsFullView, 
                mountAnimation = v12.mountAnimation, 
                viewStateChanged = v18, 
                briefToFullTransitionPercent = function(v21) --[[ Line: 56 ]]
                    -- upvalues: v20 (copy), v12 (copy)
                    v20(v21);
                    if v12.transitionPercentCallback then
                        v12.transitionPercentCallback(v21);
                    end;
                end, 
                hasSolidDragger = (not l_FFlagProfilePlatformNewProfileHeader_0 or v12.profileType ~= v8.ProfileTypes.User) and nil
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Content = v12.contentSlot
            })
        }), 
        TransparentTopBarOverlay = v2.createElement("CanvasGroup", {
            Size = UDim2.new(1, 0, 0, 56), 
            Position = UDim2.new(0, 0, 0, v14), 
            BackgroundTransparency = 1, 
            ZIndex = 1000, 
            GroupTransparency = v19:map(function(v22) --[[ Line: 113 ]]
                return 1 - v22;
            end)
        }, {
            TopBar = v12.topBarSlot
        })
    });
end;