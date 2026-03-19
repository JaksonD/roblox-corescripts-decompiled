local l_Parent_0 = script:FindFirstAncestor("EngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AppStartup);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_navigateWithPlatformAccount_0 = v2.navigateWithPlatformAccount;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v7 = require(l_Parent_0.Responsive);
local l_BackgroundFill_0 = require(l_Parent_0.AuthCommon).Components.BackgroundFill;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
return function(v10) --[[ Line: 20 ]] --[[ Name: useEngagementScreenProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppLogging_0 (copy), v1 (copy), l_ThirdPartyUserService_0 (copy), v7 (copy), l_BackgroundFill_0 (copy), l_navigateWithPlatformAccount_0 (copy)
    local l_useSingleSignOn_0 = v10.useSingleSignOn;
    local l_allowPlatformAccountSwitching_0 = v10.allowPlatformAccountSwitching;
    local v13 = l_useNavigation_0();
    local v14 = l_useRoactService_0(l_AppLogging_0);
    local v15, v16 = v1.useState(false);
    local v17 = nil;
    if l_allowPlatformAccountSwitching_0 then
        v17 = function() --[[ Line: 29 ]]
            -- upvalues: l_ThirdPartyUserService_0 (ref)
            if l_ThirdPartyUserService_0 then
                l_ThirdPartyUserService_0:ShowAccountPicker();
            end;
        end;
    end;
    local v18 = v1.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v16 (copy)
        v16(true);
    end, {});
    local v19 = v7.usePreferredInput();
    local v20 = v1.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), l_BackgroundFill_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Background = v1.createElement(l_BackgroundFill_0, {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
            })
        });
    end, {});
    local v21 = if v19 == v7.Input.Directional then nil else v20;
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v14 (copy), l_ThirdPartyUserService_0 (ref), l_navigateWithPlatformAccount_0 (ref), l_useSingleSignOn_0 (copy), v13 (copy), v16 (copy)
        if v15 then
            v14:logEventOnce("engagement_screen_did_continue");
            if l_ThirdPartyUserService_0 then
                l_ThirdPartyUserService_0:RegisterActiveUser(Enum.UserInputType.Gamepad1);
            end;
            l_navigateWithPlatformAccount_0(l_useSingleSignOn_0, v13.replace);
            v16(false);
        end;
    end, {
        v15, 
        v14, 
        l_useSingleSignOn_0, 
        v13.replace
    });
    return {
        onContinue = v18, 
        onSwitchAccounts = v17, 
        renderBackground = v21
    };
end;