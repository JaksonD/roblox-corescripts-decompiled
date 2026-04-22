local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_Parent_0.ProfilePlatform.Enums);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v8.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v8.Utils.Constants;
local v11 = require(l_Parent_0.VerifiedBadges);
local l_MouseIconOverrideService_0 = require(l_Parent_0.CoreScriptsCommon).MouseIconOverrideService;
local l_useScreenSize_0 = require(l_Parent_0.CoreScriptsRoactCommon).useScreenSize;
local l_LoadableImage_0 = v7.App.Loading.LoadableImage;
local l_Dialog_0 = v4.Dialog;
local l_DialogSize_0 = v4.Enums.DialogSize;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useAbbreviatedNumberLocalization_0 = v5.Hooks.useAbbreviatedNumberLocalization;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_Skeleton_0 = v4.Skeleton;
local l_useTokens_0 = v4.Hooks.useTokens;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v25 = require(l_script_FirstAncestor_0.Common.constants);
local v26 = {
    [v3.DisabledReasons.BannedFromCommunity] = "subTextBannedFromCommunity", 
    [v3.DisabledReasons.CommunityIsClosed] = "subTextGroupClosed", 
    [v3.DisabledReasons.MaxCommunitiesJoined] = "subTextPremiumMaxGroups", 
    [v3.DisabledReasons.AccountCreatedLessThanOneDay] = "subTextRequiresAccountTenureTooltipOneDay", 
    [v3.DisabledReasons.AccountCreatedLessThanThreeDays] = "subTextRequiresAccountTenureTooltipThreeDays", 
    [v3.DisabledReasons.AccountCreatedLessThanOneWeek] = "subTextRequiresAccountTenureTooltipOneWeek", 
    [v3.DisabledReasons.AccountCreatedLessThanOneMonth] = "subTextRequiresAccountTenureTooltipOneMonth", 
    [v3.DisabledReasons.AccountCreatedLessThanThreeMonths] = "subTextRequiresAccountTenureTooltipThreeMonths", 
    [v3.DisabledReasons.InsufficientVerificationLevelHigh] = "subTextInsufficientVerificationLevelHigh", 
    [v3.DisabledReasons.InsufficientVerificationLevelMedium] = "subTextInsufficientVerificationLevelMedium", 
    [v3.DisabledReasons.InsufficientVerificationLevelLow] = "subTextInsufficientVerificationLevelLow"
};
return function(v27) --[[ Line: 61 ]]
    -- upvalues: l_useTokens_0 (copy), l_useScreenSize_0 (copy), v25 (copy), l_useLocalization_0 (copy), v6 (copy), l_MouseIconOverrideService_0 (copy), v3 (copy), v26 (copy), l_TextService_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_View_0 (copy), l_LoadableImage_0 (copy), l_Text_0 (copy), l_Skeleton_0 (copy), v11 (copy), l_useAbbreviatedNumberLocalization_0 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy)
    local v28 = l_useTokens_0();
    local v29 = v27.enableInputDelayed == nil or v27.enableInputDelayed;
    local v30 = if l_useScreenSize_0().Y < v25.SMALL_SCREEN_HEIGHT_THRESHOLD then v25.THUMBNAIL_SIZE_SMALL else v25.THUMBNAIL_SIZE;
    local l_data_0 = v27.data;
    local v32 = l_data_0 == nil;
    local v33 = if l_data_0 then l_data_0.groupName else nil;
    local v34 = if l_data_0 then l_data_0.ownerName else nil;
    local v35 = if l_data_0 then l_data_0.ownerIsVerified else false;
    local v36 = if l_data_0 then l_data_0.membersCount else 0;
    local v37 = if l_data_0 then l_data_0.isAlreadyMember else false;
    local v38 = if l_data_0 then l_data_0.hasPendingRequest else false;
    local v39 = if l_data_0 then l_data_0.isEligible else false;
    local v40 = if l_data_0 then l_data_0.disabledReason else nil;
    local v41 = not l_data_0 or not (l_data_0.hasSocialModules ~= nil) or l_data_0.hasSocialModules;
    local v42 = l_useLocalization_0({
        joinGroup = "Feature.Groups.Action.JoinGroup", 
        followGroup = "Feature.Groups.Action.Follow", 
        notNowButton = "Feature.Groups.Action.NotNow", 
        closeButton = "Feature.Groups.Action.Close", 
        titleJoin = {
            "Feature.Groups.Title.Join"; 
            groupName = v33 or ""
        }, 
        titleFollow = {
            "Feature.Groups.Title.Follow"; 
            groupName = v33 or ""
        }, 
        titleAlreadyRequested = {
            "Feature.Groups.Title.RequestedToJoin"; 
            groupName = v33 or ""
        }, 
        titleAlreadyMember = {
            "Feature.Groups.Title.AlreadyMember"; 
            groupName = v33 or ""
        }, 
        titleAlreadyFollowing = {
            "Feature.Groups.Title.AlreadyFollowing"; 
            groupName = v33 or ""
        }, 
        titleUnableToJoin = {
            "Feature.Groups.Title.UnableToJoin"; 
            groupName = v33 or ""
        }, 
        ownerBy = {
            "Feature.Groups.Label.ByOwnerWithFormat"; 
            ownerName = v34 or ""
        }, 
        members = "Feature.Groups.Heading.Members", 
        followers = "Feature.Groups.Heading.Followers", 
        subTextPendingRequest = "Feature.Groups.Description.JoinGroupPending", 
        subTextBannedFromCommunity = "Feature.Groups.Message.BannedFromGroup", 
        subTextGroupClosed = "Feature.Groups.Message.GroupClosed", 
        subTextPremiumMaxGroups = "Feature.Groups.Description.PremiumMaxGroups", 
        subTextRequiresAccountTenureTooltipOneDay = "Feature.Groups.Description.RequiresAccountTenureTooltipOneDay", 
        subTextRequiresAccountTenureTooltipThreeDays = "Feature.Groups.Description.RequiresAccountTenureTooltipThreeDays", 
        subTextRequiresAccountTenureTooltipOneWeek = "Feature.Groups.Description.RequiresAccountTenureTooltipOneWeek", 
        subTextRequiresAccountTenureTooltipOneMonth = "Feature.Groups.Description.RequiresAccountTenureTooltipOneMonth", 
        subTextRequiresAccountTenureTooltipThreeMonths = "Feature.Groups.Description.RequiresAccountTenureTooltipThreeMonths", 
        subTextInsufficientVerificationLevelHigh = "Feature.Groups.Modal.ContentTextHigh", 
        subTextInsufficientVerificationLevelMedium = "Feature.Groups.Modal.ContentTextMedium", 
        subTextInsufficientVerificationLevelLow = "Feature.Groups.Modal.ContentTextLow", 
        subTextNotEligible = "Feature.Groups.Description.NotEligibleToJoin"
    });
    v6.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: l_MouseIconOverrideService_0 (ref)
        l_MouseIconOverrideService_0.push("GroupJoinPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        return function() --[[ Line: 127 ]]
            -- upvalues: l_MouseIconOverrideService_0 (ref)
            l_MouseIconOverrideService_0.pop("GroupJoinPromptOverride");
        end;
    end, {});
    local v43 = v6.useRef(nil);
    local v44, v45 = v6.useState(nil);
    local v46 = v6.useRef(nil);
    local v47, v48 = v6.useState(nil);
    v6.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: v43 (copy), v45 (copy), v44 (copy)
        local v49 = nil;
        if v43.current then
            local l_current_0 = v43.current;
            if l_current_0.AbsoluteSize.X > 0 then
                v45(l_current_0.AbsoluteSize.X);
            end;
            v49 = l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 145 ]]
                -- upvalues: l_current_0 (copy), v44 (ref), v45 (ref)
                if l_current_0.AbsoluteSize.X > 0 and l_current_0.AbsoluteSize.X ~= v44 then
                    v45(l_current_0.AbsoluteSize.X);
                end;
            end);
        end;
        return function() --[[ Line: 151 ]]
            -- upvalues: v49 (ref)
            if v49 then
                v49:Disconnect();
                v49 = nil;
            end;
        end;
    end, {
        v44
    });
    v6.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: v46 (copy), v48 (copy), v47 (copy)
        local v51 = nil;
        if v46.current then
            local l_current_1 = v46.current;
            if l_current_1.AbsoluteSize.X > 0 then
                v48(l_current_1.AbsoluteSize.X);
            end;
            v51 = l_current_1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 166 ]]
                -- upvalues: l_current_1 (copy), v47 (ref), v48 (ref)
                if l_current_1.AbsoluteSize.X > 0 and l_current_1.AbsoluteSize.X ~= v47 then
                    v48(l_current_1.AbsoluteSize.X);
                end;
            end);
        end;
        return function() --[[ Line: 172 ]]
            -- upvalues: v51 (ref)
            if v51 then
                v51:Disconnect();
                v51 = nil;
            end;
        end;
    end, {
        v47
    });
    local v55 = v6.useMemo(function() --[[ Line: 180 ]]
        -- upvalues: v38 (copy), v42 (copy), v37 (copy), v39 (copy), v40 (copy), v3 (ref), v26 (ref)
        if v38 then
            return v42.subTextPendingRequest;
        elseif not v37 and not v39 and v40 then
            local v53 = v3.DisabledReasons[v40];
            if v53 then
                local v54 = v26[v53];
                if v54 then
                    return v42[v54];
                end;
            end;
            return v42.subTextNotEligible;
        else
            return nil;
        end;
    end, {
        v42, 
        v37, 
        v38, 
        v39, 
        v40
    });
    local v57 = v6.useMemo(function() --[[ Line: 201 ]]
        -- upvalues: v32 (copy), v41 (copy), v42 (copy), v37 (copy), v38 (copy), v39 (copy), v33 (copy)
        if v32 then
            return nil;
        else
            local v56 = if v41 then v42.titleJoin else v42.titleFollow;
            if v37 then
                v56 = if v41 then v42.titleAlreadyMember else v42.titleAlreadyFollowing;
            elseif v38 then
                v56 = v42.titleAlreadyRequested;
            elseif not v39 then
                v56 = v42.titleUnableToJoin;
            end;
            if v56 then
                return v56;
            else
                return v33;
            end;
        end;
    end, {
        v42, 
        v33, 
        v37, 
        v38, 
        v39, 
        v41, 
        v32
    });
    local l_Font_0 = v28.Typography.HeadingSmall.Font;
    local l_FontSize_0 = v28.Typography.HeadingSmall.FontSize;
    local l_Font_1 = v28.Typography.BodyMedium.Font;
    local l_FontSize_1 = v28.Typography.BodyMedium.FontSize;
    local l_Medium_0 = v28.Padding.Medium;
    local v63 = v6.useMemo(function() --[[ Line: 230 ]]
        -- upvalues: v57 (copy), v44 (copy), l_TextService_0 (ref), l_FontSize_0 (copy), l_Font_0 (copy)
        if v57 and v57 ~= "" and v44 and v44 > 0 then
            return (l_TextService_0:GetTextSize(v57, l_FontSize_0, l_Font_0, Vector2.new(v44, 1e999)));
        else
            return nil;
        end;
    end, {
        v57, 
        v44, 
        l_Font_0, 
        l_FontSize_0
    });
    local v65 = v6.useMemo(function() --[[ Line: 244 ]]
        -- upvalues: v55 (copy), v47 (copy), l_Medium_0 (copy), l_TextService_0 (ref), l_FontSize_1 (copy), l_Font_1 (copy)
        if v55 and v47 and v47 > 0 then
            local v64 = v47 - l_Medium_0 * 2;
            if v64 > 0 then
                return (l_TextService_0:GetTextSize(v55, l_FontSize_1, l_Font_1, Vector2.new(v64, 1e999)));
            end;
        end;
        return nil;
    end, {
        v55, 
        v47, 
        l_Font_1, 
        l_FontSize_1, 
        l_Medium_0
    });
    local v67 = v6.useMemo(function() --[[ Line: 261 ]]
        -- upvalues: v63 (copy), v65 (copy)
        local v66 = {};
        if v63 then
            v66.title = v63;
        end;
        if v65 then
            v66.subText = v65;
        end;
        return v66;
    end, {
        v63, 
        v65
    });
    local v68 = if v27.groupId then l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v27.groupId), l_Constants_0.RbxthumbTypes.GroupIcon, v25.THUMBNAIL_SIZE) else nil;
    local v69 = v6.useCallback(function() --[[ Line: 281 ]]
        -- upvalues: v68 (copy), v6 (ref), l_View_0 (ref), v28 (copy), v30 (copy), l_LoadableImage_0 (ref)
        if v68 then
            return (v6.createElement(l_View_0, {
                tag = "col size-full-0 auto-y align-x-center", 
                LayoutOrder = 0
            }, {
                UIPadding = v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v28.Padding.Medium), 
                    PaddingBottom = UDim.new(0, v28.Padding.Medium)
                }), 
                ImageContainer = v6.createElement(l_View_0, {
                    Size = UDim2.new(0, v30, 0, v30)
                }, {
                    UISizeConstraint = v6.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v30, v30)
                    }), 
                    LoadableImage = v6.createElement(l_LoadableImage_0, {
                        Size = UDim2.fromScale(1, 1), 
                        Image = v68, 
                        BackgroundTransparency = 1, 
                        useShimmerAnimationWhileLoading = true, 
                        showFailedStateWhenLoadingFailed = true, 
                        cornerRadius = UDim.new(0, v28.Radius.Medium)
                    })
                })
            }));
        else
            return nil;
        end;
    end, {
        v68, 
        v28, 
        v30
    });
    local v70 = v6.useCallback(function() --[[ Line: 310 ]]
        -- upvalues: v6 (ref), l_View_0 (ref), v43 (copy), v57 (copy), v32 (copy), v67 (copy), l_Text_0 (ref), v28 (copy), v44 (copy), l_Skeleton_0 (ref), l_FontSize_0 (copy)
        return v6.createElement(l_View_0, {
            tag = "col size-full-0 auto-y", 
            LayoutOrder = 1, 
            ref = v43
        }, {
            TitleText = if not (not (v57 and v57 ~= "") or v32) and v67 and v67.title then v6.createElement(l_Text_0, {
                tag = "text-align-x-left", 
                Text = v57, 
                TextWrapped = true, 
                fontStyle = v28.Typography.HeadingSmall, 
                textStyle = v28.Color.Content.Emphasis, 
                Size = UDim2.fromOffset(math.ceil(v67.title.X), (math.ceil(v67.title.Y))), 
                AutomaticSize = Enum.AutomaticSize.None
            }, {
                UISizeConstraint = v6.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(if v44 then v44 else 1e999, 1e999)
                })
            }) else if not (v57 and v57 ~= "") or v32 then if v32 then v6.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, l_FontSize_0)
            }) else nil else v6.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-align-x-left", 
                Text = v57, 
                TextWrapped = true, 
                fontStyle = v28.Typography.HeadingSmall, 
                textStyle = v28.Color.Content.Emphasis
            })
        });
    end, {
        v57, 
        v32, 
        v67, 
        v44, 
        v28, 
        v43, 
        l_FontSize_0
    });
    local v71 = v6.useCallback(function() --[[ Line: 348 ]]
        -- upvalues: v34 (copy), v32 (copy), v6 (ref), l_View_0 (ref), v28 (copy), v11 (ref), v35 (copy), l_Text_0 (ref), v42 (copy), l_Skeleton_0 (ref), l_FontSize_1 (copy)
        if v34 ~= nil and v34 ~= "" and not v32 then
            return (v6.createElement(l_View_0, {
                tag = "col size-full-0 auto-y", 
                LayoutOrder = 2
            }, {
                UIPadding = v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v28.Padding.XSmall)
                }), 
                Content = v6.createElement(v11.EmojiWrapper, {
                    emoji = if v35 then v11.emoji.verified else "", 
                    size = UDim2.new(1, 0, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    horizontalAlignment = Enum.HorizontalAlignment.Left
                }, {
                    Text = v6.createElement(l_Text_0, {
                        tag = "size-full-0 auto-y text-body-medium text-align-x-left", 
                        Text = v42.ownerBy, 
                        TextWrapped = true
                    })
                })
            }));
        elseif v32 then
            return (v6.createElement(l_View_0, {
                tag = "col size-full-0 auto-y", 
                LayoutOrder = 2
            }, {
                UIPadding = v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v28.Padding.XSmall)
                }), 
                Shimmer = v6.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, l_FontSize_1)
                })
            }));
        else
            return nil;
        end;
    end, {
        v34, 
        v35, 
        v32, 
        v28, 
        v42, 
        l_FontSize_1
    });
    local v72 = l_useAbbreviatedNumberLocalization_0(v36);
    local v73 = v6.useCallback(function() --[[ Line: 389 ]]
        -- upvalues: v6 (ref), l_View_0 (ref), v46 (copy), v28 (copy), v32 (copy), l_Skeleton_0 (ref), l_FontSize_1 (copy), v55 (copy), v67 (copy), l_Text_0 (ref), v47 (copy), v36 (copy), v72 (copy), v41 (copy), v42 (copy)
        return v6.createElement(l_View_0, {
            tag = "col size-full-0 auto-y", 
            LayoutOrder = 3, 
            ref = v46
        }, {
            UIPadding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v28.Padding.Medium)
            }), 
            Content = if v32 then v6.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.4, 0, 0, l_FontSize_1)
            }) else if v55 ~= nil and v67 and v67.subText then v6.createElement(l_Text_0, {
                tag = "text-body-medium text-align-x-left", 
                Text = v55, 
                TextWrapped = true, 
                Size = UDim2.fromOffset(math.ceil(v67.subText.X), (math.ceil(v67.subText.Y))), 
                AutomaticSize = Enum.AutomaticSize.None
            }, {
                UISizeConstraint = v6.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(if v47 then v47 - v28.Padding.Medium * 2 else 1e999, 1e999)
                })
            }) else if v55 ~= nil then v6.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-body-medium text-align-x-left", 
                Text = v55, 
                TextWrapped = true
            }) else if v36 and v36 > 0 then v6.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-body-medium text-align-x-left", 
                Text = v72 .. " " .. if v41 then v42.members else v42.followers, 
                TextWrapped = true
            }) else nil
        });
    end, {
        v32, 
        v55, 
        v67, 
        v47, 
        v28, 
        v36, 
        v72, 
        v41, 
        v42, 
        v46, 
        l_FontSize_1
    });
    local v74, v75 = v6.useState(false);
    local v76 = v6.useCallback(function() --[[ Line: 450 ]]
        -- upvalues: v74 (copy), v75 (copy), v27 (copy)
        if not v74 then
            v75(true);
            if v27.onJoin then
                v27.onJoin();
            end;
        end;
    end, {
        v27.onJoin
    });
    local v77 = v6.useCallback(function() --[[ Line: 459 ]]
        -- upvalues: v74 (copy), v27 (copy)
        if not v74 and v27.onClose then
            v27.onClose();
        end;
    end, {
        v27.onClose, 
        v74
    });
    local v78 = v6.useMemo(function() --[[ Line: 467 ]]
        -- upvalues: v32 (copy), l_ButtonVariant_0 (ref), v37 (copy), v39 (copy), v38 (copy), v42 (copy), v77 (copy), v74 (copy), v41 (copy), v76 (copy), v29 (copy), v25 (ref)
        if v32 then
            return {
                {
                    variant = l_ButtonVariant_0.Standard, 
                    isLoading = true, 
                    isDisabled = true
                }
            };
        elseif v37 or not v39 or v38 then
            return {
                {
                    variant = l_ButtonVariant_0.Standard, 
                    text = v42.closeButton, 
                    onActivated = v77, 
                    isDisabled = v74
                }
            };
        else
            return {
                {
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = v41 and v42.joinGroup or v42.followGroup, 
                    onActivated = v76, 
                    inputDelay = if v29 then v25.ACCEPT_DELAY_SECONDS else nil, 
                    isLoading = v74, 
                    isDisabled = v74
                }, 
                {
                    variant = l_ButtonVariant_0.Standard, 
                    text = v42.notNowButton, 
                    onActivated = v77, 
                    isDisabled = v74
                }
            };
        end;
    end, {
        v42, 
        v76, 
        v77, 
        v29, 
        v38, 
        v39, 
        v37, 
        v74, 
        v41
    });
    return v6.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        onClose = v77
    }, {
        DialogContent = v6.createElement(l_Dialog_0.Content, {
            LayoutOrder = 1
        }, {
            Content = v6.createElement(l_View_0, {
                tag = "col size-full-0 auto-y"
            }, {
                UIListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                GroupImage = v69(), 
                Title = v70(), 
                OwnerName = v71(), 
                SubContent = v73()
            })
        }), 
        DialogActions = v6.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 2, 
            actions = v78
        })
    });
end;