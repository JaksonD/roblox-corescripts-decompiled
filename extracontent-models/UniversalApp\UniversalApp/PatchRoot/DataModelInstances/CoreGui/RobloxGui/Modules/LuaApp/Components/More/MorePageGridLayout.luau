local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local v8 = require(l_Modules_0.LuaApp.Hooks.useMorePageItemsConfiguration);
local v9 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v10 = require(l_Modules_0.LuaApp.Components.More.MorePageContent);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v12 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useBreakpointXOrLarger_0 = v12.useBreakpointXOrLarger;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput;
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagFixMorePageLogOutCutOff);
local l_FFlagEnableMorePageExitButtonSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMorePageExitButtonSupport;
local l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix;
local v19 = game:DefineFastFlag("MorePageExitButtonNotAllowed", false);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagLuaAppEnableMorePageProfileLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableMorePageProfileLink;
local _ = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
if l_FFlagLuaAppEnableMorePageProfileLink_0 then
    v23 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
    v24 = require(l_Modules_0.LuaApp.Components.GridHome.Header.UserInfo);
    v25 = function() --[[ Line: 41 ]]
        -- upvalues: v3 (copy), v24 (ref), v23 (ref)
        return v3.createElement(v24, {
            source = v23.MorePageSelfWidget
        });
    end;
end;
local v26 = if v16 then require(l_CorePackages_0.Workspace.Packages.AppNavBar).useNavBarPlacement else nil;
return function() --[[ Line: 52 ]]
    -- upvalues: l_useStyle_0 (copy), l_useBreakpointXOrLarger_0 (copy), v12 (copy), l_useSelector_0 (copy), v8 (copy), v3 (copy), v2 (copy), v7 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_useAppPolicy_0 (copy), l_useProperty_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), v19 (copy), v16 (copy), v26 (copy), l_FFlagLuaAppEnableMorePageProfileLink_0 (copy), v25 (ref), v9 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v10 (copy)
    local l_BackgroundDefault_0 = l_useStyle_0().Theme.BackgroundDefault;
    local v28 = l_useBreakpointXOrLarger_0(v12.Keys.Medium);
    local v30 = l_useSelector_0(function(v29) --[[ Line: 56 ]]
        return v29.TopBar.topBarHeight;
    end);
    local v31 = v8();
    local v34 = v3.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v2 (ref), v31 (copy), v7 (ref)
        return v2.reduce(v31, function(v32, v33) --[[ Line: 62 ]]
            -- upvalues: v7 (ref), v2 (ref)
            if v33.type == v7.SectionType.Navigation then
                return {
                    v2.append(v32[1], v33.contents), 
                    v32[2]
                };
            elseif v33.type == v7.SectionType.Action then
                return {
                    v32[1], 
                    v2.append(v32[2], v33.contents)
                };
            else
                return v32;
            end;
        end, {
            {}, 
            {}
        });
    end, {
        v31
    });
    local v35 = nil;
    local v36 = false;
    if l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 then
        v35 = l_useAppPolicy_0(function(v37) --[[ Line: 82 ]]
            return v37.getMoreGridDirectionalLayoutPreferred();
        end);
    else
        local v38 = l_useProperty_0(l_UserInputService_0, "TouchEnabled");
        local v39 = l_useProperty_0(l_UserInputService_0, "KeyboardEnabled");
        local v40 = l_useProperty_0(l_UserInputService_0, "MouseEnabled");
        if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then
            local v41 = v38 or v39 or v40;
            local v42 = false;
            if v12.usePreferredInput() == v12.Input.Directional then
                v42 = not v41;
            end;
            v35 = v42;
        else
            v35 = v12.usePreferredInput() == v12.Input.Directional;
        end;
    end;
    if l_FFlagEnableMorePageExitButtonSupport_0 then
        v36 = l_useAppPolicy_0(function(v43) --[[ Line: 99 ]]
            return v43.getMorePageExitButtonEnabled();
        end) and not v19;
    end;
    local v44 = if v16 then v26() else nil;
    local v45 = nil;
    local v46 = nil;
    if l_FFlagLuaAppEnableMorePageProfileLink_0 then
        local v48 = l_useAppPolicy_0(function(v47) --[[ Line: 112 ]]
            return v47.useGridPageLayout();
        end);
        local v49 = l_useBreakpointXOrLarger_0(v12.Keys.Large);
        if v48 then
            v46 = not v49;
            v45 = {
                v25, 
                v9.BuyRobuxButton, 
                v9.NotificationsButton
            };
        else
            v45 = {
                v9.BuyRobuxButton, 
                v9.NotificationsButton
            };
        end;
    else
        v45 = {
            v9.BuyRobuxButton, 
            v9.NotificationsButton
        };
    end;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = if not v35 or l_FFlagEnableLeftNavOnConsole_0 then l_BackgroundDefault_0.Color else nil, 
        BackgroundTransparency = if not v35 or l_FFlagEnableLeftNavOnConsole_0 then l_BackgroundDefault_0.Transparency else 1
    }, {
        TopBarMorePage = if v35 then nil else v3.createElement(v9.Container, {
            leftItem = v9.BackButton, 
            rightItems = v45, 
            forceCompactMode = v46
        }), 
        MorePageContent = v3.createElement(v10, {
            isWideView = v28, 
            isDirectional = v35, 
            isExitButtonSupported = v36, 
            itemTable = v34, 
            topBarHeight = v35 and 0 or v30, 
            navBarPlacement = v44
        })
    });
end;