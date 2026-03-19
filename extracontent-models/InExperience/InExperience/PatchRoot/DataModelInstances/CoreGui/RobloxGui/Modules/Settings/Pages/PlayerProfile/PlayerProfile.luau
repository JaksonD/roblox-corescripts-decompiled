local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_IconName_0 = v4.Enums.IconName;
local l_Visibility_0 = v4.Enums.Visibility;
local l_IconButton_0 = v4.IconButton;
local l_ScrollView_0 = v4.ScrollView;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local v12 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_useDeviceOrientation_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceOrientation;
local v14 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useBreakpointXOrLarger_0 = v14.useBreakpointXOrLarger;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v17 = require(l_CorePackages_0.Workspace.Packages.PeopleService);
local v18 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_getProfilePlatform_0 = v18.getProfilePlatform;
local l_useDynamicSizeMargin_0 = v18.useDynamicSizeMargin;
local l_ProfileWrapperContext_0 = v18.ProfileWrapperContext;
local l_CurrentlyWearing_0 = v18.CurrentlyWearing;
local v23 = require(script.Parent.AddConnectionButton);
local v24 = require(script.Parent.ProfileHeader);
return v2.memo(function(v25) --[[ Line: 42 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_ProfileWrapperContext_0 (copy), v17 (copy), l_Players_0 (copy), v3 (copy), l_useDeviceOrientation_0 (copy), l_useBreakpointXOrLarger_0 (copy), v14 (copy), v12 (copy), l_useDynamicSizeMargin_0 (copy), l_useDispatch_0 (copy), l_getProfilePlatform_0 (copy), v18 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_Text_0 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v24 (copy), v23 (copy), l_CurrentlyWearing_0 (copy)
    local v26 = l_useTokens_0();
    local v27 = v2.useContext(l_ProfileWrapperContext_0);
    local l_profileId_0 = v27.profileId;
    local l_profileType_0 = v27.profileType;
    local v30 = v2.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v17 (ref)
        return v17.getService("FriendStatusStore");
    end, {});
    local v31 = v2.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v25 (copy), l_Players_0 (ref)
        if v25.userId then
            return (l_Players_0:GetPlayerByUserId(v25.userId));
        else
            return nil;
        end;
    end, {
        v25.userId
    });
    local v32 = v3.useSignalState(v30.getShouldShowFriendButton(v25.userId, v31));
    local v33 = l_useDeviceOrientation_0();
    local v34 = l_useBreakpointXOrLarger_0(v14.Keys.Medium);
    local v35 = v33 == v12.DeviceOrientationMode.Portrait and not v34;
    local v36, v37 = l_useDynamicSizeMargin_0();
    local v38, v39 = v2.useState(true);
    local v40, v41 = v2.useState(false);
    local v42 = l_useDispatch_0();
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v42 (copy), l_getProfilePlatform_0 (ref), l_profileId_0 (copy), l_profileType_0 (copy), v18 (ref), v39 (copy), v41 (copy)
        v42(l_getProfilePlatform_0.API({
            profileId = l_profileId_0, 
            profileType = l_profileType_0, 
            components = {
                {
                    component = v18.Components.CurrentlyWearing
                }, 
                {
                    component = v18.Components.UserProfileHeader
                }
            }, 
            includeComponentOrdering = false, 
            onlyEssentialComponents = true
        })):andThen(function(_) --[[ Line: 87 ]]
            -- upvalues: v39 (ref), v41 (ref)
            v39(false);
            v41(false);
        end):catch(function(_) --[[ Line: 91 ]]
            -- upvalues: v39 (ref), v41 (ref)
            v39(false);
            v41(true);
        end);
    end, {
        l_profileId_0, 
        l_profileType_0
    });
    if v38 then
        return nil;
    elseif v40 then
        return v2.createElement(l_View_0, {
            tag = "size-full col"
        }, {
            BackBar = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y row padding-xsmall", 
                LayoutOrder = 1
            }, {
                BackButton = v2.createElement(l_IconButton_0, {
                    icon = l_IconName_0.ChevronLargeLeft, 
                    onActivated = v25.closePage
                })
            }), 
            ErrorMessage = v2.createElement(l_Text_0, {
                tag = "size-full-0 auto-y content-default text-title-medium", 
                Text = "Error loading profile", 
                LayoutOrder = 2
            })
        });
    else
        return v2.createElement(l_View_0, {
            tag = "size-full padding-bottom-medium", 
            onAbsoluteSizeChanged = v37
        }, {
            BackBar = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y row padding-xsmall", 
                LayoutOrder = 1
            }, {
                BackButton = v2.createElement(l_IconButton_0, {
                    icon = l_IconName_0.ChevronLargeLeft, 
                    onActivated = v25.closePage
                })
            }), 
            ScrollView = v2.createElement(l_ScrollView_0, {
                tag = "size-full", 
                scroll = {
                    scrollBarVisibility = l_Visibility_0.Auto, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    CanvasSize = UDim2.fromScale(1, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
                }, 
                layout = {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v26.Padding.XXLarge)
                }, 
                padding = {
                    top = UDim.new(0, 48)
                }, 
                LayoutOrder = 2
            }, {
                ProfileHeaderContainer = v2.createElement(l_View_0, {
                    tag = {
                        ["size-full-0 auto-y"] = true, 
                        ["col gap-xxlarge"] = v35
                    }, 
                    LayoutOrder = 1
                }, {
                    ProfileHeader = v2.createElement(v24, {
                        profileId = l_profileId_0, 
                        layoutOrder = 1
                    }), 
                    AddConnectionButtonContainer = if v32 then v2.createElement(l_View_0, {
                        tag = {
                            ["size-full-0 auto-y"] = v35, 
                            ["size-2500-2200 row align-y-center"] = not v35 and not v34, 
                            ["size-3000-2200 row align-y-center"] = not v35 and v34
                        }, 
                        padding = if v35 then {
                            left = UDim.new(0, v36), 
                            right = UDim.new(0, v36)
                        } else nil, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, -v36, 0, 0), 
                        ZIndex = 2, 
                        LayoutOrder = 2
                    }, {
                        AddConnectionButton = v2.createElement(v23, {
                            userId = v25.userId
                        })
                    }) else nil
                }), 
                CurrentlyWearingCarousel = v2.createElement(l_CurrentlyWearing_0, {
                    layoutOrder = 3
                })
            })
        });
    end;
end);