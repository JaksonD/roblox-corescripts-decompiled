local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_usePlayerCountText_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).usePlayerCountText;
local v15 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenGameDetails);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsExpanded);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_GameStats_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameStats;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRevisedExperienceTile);
local function _(v23, v24) --[[ Line: 69 ]] --[[ Name: formatRating ]]
    if v23 + v24 == 0 then
        return "--";
    else
        return (("%*%%"):format((math.round(v23 / (v23 + v24) * 100))));
    end;
end;
return function(v26) --[[ Line: 78 ]] --[[ Name: ExperienceCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v3 (copy), l_usePlayerCountText_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_useSelector_0 (copy), l_DeviceOrientationMode_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v17 (copy), l_AvatarScreen_0 (copy), v15 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_LoadableImage_0 (copy), l_Skeleton_0 (copy), v22 (copy), l_GameStats_0 (copy)
    local v27 = l_useDispatch_0();
    local v28 = l_useNavigation_0();
    local v29 = l_useStyle_0();
    local v30 = v3.useRef(nil);
    local l_Font_0 = v29.Font;
    local l_Theme_0 = v29.Theme;
    local v33;
    if v26.isHydrated and v26.totalDownVotes and v26.totalUpVotes then
        local l_totalUpVotes_0 = v26.totalUpVotes;
        local l_totalDownVotes_0 = v26.totalDownVotes;
        v33 = l_totalUpVotes_0 + l_totalDownVotes_0 == 0 and "--" or ("%*%%"):format((math.round(l_totalUpVotes_0 / (l_totalUpVotes_0 + l_totalDownVotes_0) * 100)));
    else
        v33 = "--";
    end;
    local v36 = v26.isHydrated and v26.playerCount or nil;
    local v37 = l_usePlayerCountText_0(v36);
    local v38 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize * 2);
    local v39 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v40 = l_getIconSize_0(l_IconSize_0.Small);
    local v41 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v42, v43 = v3.useState(1);
    local v45 = l_useSelector_0(function(v44) --[[ Line: 100 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v44.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end, l_getUseSelectorDeepEquals_0());
    v3.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v30 (copy), v43 (copy)
        local l_current_0 = v30.current;
        if not l_current_0 or not l_current_0.AbsoluteSize then
            return;
        else
            local l_X_0 = l_current_0.AbsoluteSize.X;
            if l_X_0 < 100 then
                v43(0.7);
                return;
            elseif l_X_0 < 120 then
                v43(0.8);
                return;
            elseif l_X_0 < 140 then
                v43(0.9);
                return;
            else
                v43(1);
                return;
            end;
        end;
    end, {
        v26.isHydrated, 
        v45, 
        v30
    });
    local function v49() --[[ Line: 123 ]] --[[ Name: onActivated ]]
        -- upvalues: v27 (copy), v17 (ref), v28 (copy), l_AvatarScreen_0 (ref), v15 (ref), v26 (copy)
        local v48 = {
            onClose = function() --[[ Line: 125 ]] --[[ Name: onClose ]]
                -- upvalues: v27 (ref), v17 (ref), v28 (ref), l_AvatarScreen_0 (ref)
                v27(v17(false));
                v28.navigate(l_AvatarScreen_0.Catalog);
            end
        };
        v27(v15(v26.universeId, v28, v48));
    end;
    local function v54() --[[ Line: 133 ]] --[[ Name: renderFooterRow ]]
        -- upvalues: v26 (copy), v29 (copy), v40 (copy), v42 (copy), v3 (ref), v39 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v33 (copy), v41 (copy), v37 (copy)
        if not v26.isHydrated then
            return nil;
        else
            local l_Theme_1 = v29.Theme;
            local l_Font_1 = v29.Font;
            local v52 = UDim2.fromOffset(v40 * v42, v40 * v42);
            local v53 = UDim2.fromOffset(v40 * v42 + 4, 0);
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v39), 
                LayoutOrder = 2
            }, {
                RatingStats = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(0.5, 1)
                }, {
                    Icon = v3.createElement(l_ImageSetLabel_0, {
                        Size = v52, 
                        Image = l_Images_0["icons/status/games/rating_small"], 
                        BackgroundTransparency = 1, 
                        ImageTransparency = l_Theme_1.IconDefault.Transparency, 
                        ImageColor3 = l_Theme_1.IconDefault.Color, 
                        LayoutOrder = 1
                    }), 
                    Text = v3.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1.Body.Font, 
                        Position = v53, 
                        Text = v33, 
                        TextSize = v41 * v42, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextColor3 = l_Theme_1.TextMuted.Color, 
                        TextTransparency = l_Theme_1.TextMuted.Transparency, 
                        LayoutOrder = 2
                    })
                }), 
                PlayingStats = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Position = UDim2.new(0.5, 4, 0, 0), 
                    Size = UDim2.fromScale(0.5, 1)
                }, {
                    Icon = v3.createElement(l_ImageSetLabel_0, {
                        Size = v52, 
                        Image = l_Images_0["icons/status/games/people-playing_small"], 
                        BackgroundTransparency = 1, 
                        ImageTransparency = l_Theme_1.IconDefault.Transparency, 
                        ImageColor3 = l_Theme_1.IconDefault.Color, 
                        LayoutOrder = 1
                    }), 
                    Text = v3.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1.Body.Font, 
                        Position = v53, 
                        Text = v37, 
                        TextSize = v41 * v42, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextColor3 = l_Theme_1.TextMuted.Color, 
                        TextTransparency = l_Theme_1.TextMuted.Transparency, 
                        LayoutOrder = 2
                    })
                })
            });
        end;
    end;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v26.index, 
        Size = UDim2.new(1, 0, 0, 0), 
        ref = v30
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 8)
        }), 
        ImageButton = v3.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Image = nil, 
            Size = UDim2.fromScale(1, 1), 
            [v3.Event.Activated] = v49
        }, {
            Image = v3.createElement(l_LoadableImage_0, {
                BackgroundTransparency = 1, 
                Image = ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v26.universeId, 150, 150), 
                Size = UDim2.fromScale(1, 1), 
                cornerRadius = UDim.new(0, 12)
            }), 
            UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        TitleShimmer = if not v26.isHydrated then v3.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v38), 
            LayoutOrder = 1
        }) else nil, 
        Title = if v26.isHydrated then v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0.Header2.Font, 
            Text = v26.name, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextWrapped = true, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.new(1, 0, 0, v38), 
            LayoutOrder = 1
        }) else nil, 
        FooterShimmer = if not v26.isHydrated then v3.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v39), 
            LayoutOrder = 2
        }) else nil, 
        Footer = if v26.isHydrated then if v22() then v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, 22)
            }), 
            Footer = v3.createElement(l_GameStats_0, {
                stats = {
                    playerCount = v26.playerCount, 
                    totalUpVotes = v26.totalUpVotes, 
                    totalDownVotes = v26.totalDownVotes
                }
            })
        }) else v54() else nil
    });
end;