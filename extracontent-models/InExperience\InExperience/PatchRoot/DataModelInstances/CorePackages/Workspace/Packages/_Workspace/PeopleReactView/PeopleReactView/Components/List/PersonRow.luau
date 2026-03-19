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
local l_InputSize_0 = v2.Enums.InputSize;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useSignalBinding_0 = v5.useSignalBinding;
local l_useDeviceOrientation_0 = v7.useDeviceOrientation;
local v16 = require(l_script_FirstAncestor_0.Hooks.useInExperienceCombinedName);
local v17 = require(l_script_FirstAncestor_0.Components.Buttons.PlatformName);
local v18 = require(l_script_FirstAncestor_0.Components.List.PersonButtonRow);
local l_formatUsername_0 = v6.Formatters.formatUsername;
local v20 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local l_GetFFlagAddPeoplePageCardLayout_0 = v4.getService("Flags").GetFFlagAddPeoplePageCardLayout;
return function(v22) --[[ Line: 41 ]] --[[ Name: PersonRow ]]
    -- upvalues: l_useTokens_0 (copy), l_useDeviceOrientation_0 (copy), v8 (copy), v3 (copy), v4 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v16 (copy), l_useSignalBinding_0 (copy), l_Avatar_0 (copy), l_InputSize_0 (copy), l_View_0 (copy), l_Text_0 (copy), v20 (copy), l_formatUsername_0 (copy), v18 (copy), v17 (copy)
    local v23 = l_useTokens_0();
    local v24 = l_useDeviceOrientation_0() == v8.DeviceOrientationMode.Portrait;
    local v25 = v3.useRef(nil);
    local v27 = v3.useCallback(function(v26) --[[ Line: 48 ]]
        -- upvalues: v4 (ref), v22 (copy), v25 (copy)
        v4.getService("FocusNavigationService").registerFrame(v26, v22.person.UserId);
        v25.current = v26;
    end, {
        v22.person.UserId
    });
    local v28 = nil;
    if l_GetFFlagAddPeoplePageCardLayout_0() then
        v28 = v16(v22.person.UserId, v22.person.DisplayName);
    else
        local v29 = v3.useMemo(function() --[[ Line: 58 ]]
            -- upvalues: v4 (ref)
            return v4.getService("PeopleListStore");
        end, {});
        local l_v29_0 = v29 --[[ copy: 7 -> 9 ]];
        local v31 = v3.useMemo(function() --[[ Line: 62 ]]
            -- upvalues: l_v29_0 (copy), v22 (copy)
            return l_v29_0.getProfile(v22.person.UserId);
        end, {
            v22.person.UserId
        });
        v28 = l_useSignalBinding_0(v31):map(function(v32) --[[ Line: 68 ]]
            -- upvalues: v22 (copy)
            if v32 and string.len(v32) > 0 then
                return v32;
            else
                return v22.person.DisplayName;
            end;
        end);
    end;
    local v33 = {
        Color3 = v23.Color.Shift.Shift_300.Color3, 
        Transparency = v23.Color.Shift.Shift_300.Transparency
    };
    local v34 = v3.createElement(l_Avatar_0, {
        userId = v22.person.UserId, 
        size = l_InputSize_0.Large, 
        backgroundStyle = v33, 
        LayoutOrder = 1
    });
    return v3.createElement(l_View_0, {
        tag = {
            ["padding-small row bg-surface-200 radius-medium"] = true, 
            ["size-full-2600 gap-medium"] = v24, 
            ["size-full-1500"] = not v24
        }, 
        LayoutOrder = v22.layoutOrder, 
        ref = v27
    }, {
        PortraitAvatar = v24 and v34 or nil, 
        RowContent = v3.createElement(l_View_0, {
            tag = {
                ["gap-medium size-full align-y-center text-no-wrap"] = true, 
                ["flex-between row"] = not v24, 
                col = v24
            }, 
            LayoutOrder = 2
        }, {
            LeftContent = v3.createElement(l_View_0, {
                tag = {
                    ["row gap-medium align-y-center text-no-wrap"] = true, 
                    ["size-full-0 auto-y"] = v24, 
                    ["size-0-full auto-x"] = not v24
                }, 
                LayoutOrder = 1
            }, {
                Avatar = not v24 and v34 or nil, 
                NameContainer = v3.createElement(l_View_0, {
                    tag = "col gap-small auto-xy flex-evenly", 
                    LayoutOrder = 2
                }, {
                    DisplayName = v3.createElement(l_Text_0, {
                        Text = v28, 
                        textStyle = {
                            Color3 = v23.Color.Content.Default.Color3
                        }, 
                        tag = "text-label-medium auto-xy text-align-x-left text-truncate-end", 
                        LayoutOrder = 1
                    }), 
                    UserName = v3.createElement(l_Text_0, {
                        Text = if v20 then l_formatUsername_0(v22.person.Name) else "@" .. v22.person.Name, 
                        tag = "text-caption-small auto-xy text-align-x-left content-muted text-truncate-end", 
                        LayoutOrder = 2
                    })
                })
            }), 
            RightContent = v3.createElement(l_View_0, {
                tag = "row auto-x size-0-1000 gap-medium", 
                LayoutOrder = 2
            }, {
                PersonButtonRow = v3.createElement(v18, {
                    userId = v22.person.UserId, 
                    index = v22.layoutOrder, 
                    personRowRef = v25
                }), 
                PlatformNameSection = v3.createElement(v17, {
                    UserId = v22.person.UserId
                })
            })
        })
    });
end;