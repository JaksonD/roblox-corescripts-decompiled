local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.PeopleService);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.UserProfiles);
local v7 = require(l_Parent_0.RobloxAppHooks);
local v8 = require(l_Parent_0.RobloxAppEnums);
local l_Avatar_0 = v2.Avatar;
local l_Icon_0 = v2.Icon;
local l_IconName_0 = v2.Enums.IconName;
local l_IconSize_0 = v2.Enums.IconSize;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useSignalBinding_0 = v5.useSignalBinding;
local l_useDeviceOrientation_0 = v7.useDeviceOrientation;
local l_useIsRobloxSubscriber_0 = v6.Hooks.useIsRobloxSubscriber;
local v20 = require(l_script_FirstAncestor_0.Hooks.useInExperienceCombinedName);
local v21 = require(l_script_FirstAncestor_0.Components.Buttons.PlatformName);
local v22 = require(l_script_FirstAncestor_0.Components.List.PersonButtonRow);
local l_formatUsername_0 = v6.Formatters.formatUsername;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v25 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local l_GetFFlagAddPeoplePageCardLayout_0 = v4.getService("Flags").GetFFlagAddPeoplePageCardLayout;
return function(v27) --[[ Line: 47 ]] --[[ Name: PersonRow ]]
    -- upvalues: l_useTokens_0 (copy), l_useDeviceOrientation_0 (copy), v8 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), v3 (copy), v4 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v20 (copy), l_useSignalBinding_0 (copy), l_Avatar_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), v25 (copy), l_formatUsername_0 (copy), v22 (copy), v21 (copy)
    local v28 = l_useTokens_0();
    local v29 = l_useDeviceOrientation_0() == v8.DeviceOrientationMode.Portrait;
    local v30 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v30 = l_useIsRobloxSubscriber_0((tostring(v27.person.UserId)));
    end;
    local v31 = v3.useRef(nil);
    local v33 = v3.useCallback(function(v32) --[[ Line: 58 ]]
        -- upvalues: v4 (ref), v27 (copy), v31 (copy)
        v4.getService("FocusNavigationService").registerFrame(v32, v27.person.UserId);
        v31.current = v32;
    end, {
        v27.person.UserId
    });
    local v34 = nil;
    if l_GetFFlagAddPeoplePageCardLayout_0() then
        v34 = v20(v27.person.UserId, v27.person.DisplayName);
    else
        local v35 = v3.useMemo(function() --[[ Line: 68 ]]
            -- upvalues: v4 (ref)
            return v4.getService("PeopleListStore");
        end, {});
        local l_v35_0 = v35 --[[ copy: 8 -> 11 ]];
        local v37 = v3.useMemo(function() --[[ Line: 72 ]]
            -- upvalues: l_v35_0 (copy), v27 (copy)
            return l_v35_0.getProfile(v27.person.UserId);
        end, {
            v27.person.UserId
        });
        v34 = l_useSignalBinding_0(v37):map(function(v38) --[[ Line: 78 ]]
            -- upvalues: v27 (copy)
            if v38 and string.len(v38) > 0 then
                return v38;
            else
                return v27.person.DisplayName;
            end;
        end);
    end;
    local v39 = {
        Color3 = v28.Color.Shift.Shift_300.Color3, 
        Transparency = v28.Color.Shift.Shift_300.Transparency
    };
    local v40 = v3.createElement(l_Avatar_0, {
        userId = v27.person.UserId, 
        size = l_InputSize_0.Large, 
        backgroundStyle = v39, 
        LayoutOrder = 1
    });
    local v41 = v3.createElement(l_Text_0, {
        Text = v34, 
        textStyle = {
            Color3 = v28.Color.Content.Default.Color3
        }, 
        tag = "text-label-medium auto-xy text-align-x-left text-truncate-end", 
        LayoutOrder = 1
    });
    return v3.createElement(l_View_0, {
        tag = {
            ["padding-small row bg-surface-200 radius-medium"] = true, 
            ["size-full-2600 gap-medium"] = v29, 
            ["size-full-1500"] = not v29
        }, 
        LayoutOrder = v27.layoutOrder, 
        ref = v33
    }, {
        PortraitAvatar = v29 and v40 or nil, 
        RowContent = v3.createElement(l_View_0, {
            tag = {
                ["gap-medium size-full align-y-center text-no-wrap"] = true, 
                ["flex-between row"] = not v29, 
                col = v29
            }, 
            LayoutOrder = 2
        }, {
            LeftContent = v3.createElement(l_View_0, {
                tag = {
                    ["row gap-medium align-y-center text-no-wrap"] = true, 
                    ["size-full-0 auto-y"] = v29, 
                    ["size-0-full auto-x"] = not v29
                }, 
                LayoutOrder = 1
            }, {
                Avatar = not v29 and v40 or nil, 
                NameContainer = v3.createElement(l_View_0, {
                    tag = "col gap-small auto-xy flex-evenly", 
                    LayoutOrder = 2
                }, {
                    DisplayName = if l_FFlagEnableBlackbirdCheckDev_0 and v30 then v3.createElement(l_View_0, {
                        tag = "row gap-xsmall auto-xy align-y-center", 
                        LayoutOrder = 1
                    }, {
                        Name = v41, 
                        SubscriptionBadge = v3.createElement(l_Icon_0, {
                            name = l_IconName_0.PaperAirplane, 
                            size = l_IconSize_0.Small, 
                            style = {
                                Color3 = v28.Color.Content.Default.Color3
                            }, 
                            LayoutOrder = 2
                        })
                    }) else v41, 
                    UserName = v3.createElement(l_Text_0, {
                        Text = if v25 then l_formatUsername_0(v27.person.Name) else "@" .. v27.person.Name, 
                        tag = "text-caption-small auto-xy text-align-x-left content-muted text-truncate-end", 
                        LayoutOrder = 2
                    })
                })
            }), 
            RightContent = v3.createElement(l_View_0, {
                tag = "row auto-x size-0-1000 gap-medium", 
                LayoutOrder = 2
            }, {
                PersonButtonRow = v3.createElement(v22, {
                    userId = v27.person.UserId, 
                    index = v27.layoutOrder, 
                    personRowRef = v31
                }), 
                PlatformNameSection = v3.createElement(v21, {
                    UserId = v27.person.UserId
                })
            })
        })
    });
end;