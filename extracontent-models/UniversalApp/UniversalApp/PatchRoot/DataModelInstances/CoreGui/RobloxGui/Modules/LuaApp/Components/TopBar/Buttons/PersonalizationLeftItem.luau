local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.RoactRodux);
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Components.TopBar.Buttons.ProfileLeftHeader);
local v5 = require(l_Modules_0.LuaApp.Components.TopBar.Buttons.makeBackButton);
local v6 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar);
local v7 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v8 = nil;
local v9 = nil;
local v10 = nil;
if v7 then
    v9 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
    local v11 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel);
    v8 = v11.Components.FlyoutLeftHeader;
    v10 = v11.Utils.shouldShowLeftHeader;
end;
local v12 = v2.Component:extend("PersonalizationLeftItem");
v12.init = function(v13, _) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v13.backButton = v5(nil);
end;
local function _(v15) --[[ Line: 48 ]] --[[ Name: shouldShowAvatarHeader ]]
    -- upvalues: v7 (copy), v10 (ref), v6 (copy)
    local l_name_0 = v15.currentRoute[1].name;
    local l_name_1 = v15.currentRoute[#v15.currentRoute].name;
    if v7 then
        local l_routeName_0 = v15.routeName;
        return v10(l_routeName_0, l_name_1, v15.isSearching);
    else
        return v6(l_name_0, l_name_1, v15.formFactor, v15.isSearching);
    end;
end;
v12.didMount = function(v20) --[[ Line: 60 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v10 (ref), v6 (copy)
    if v7 then
        local l_props_0 = v20.props;
        local l_name_2 = l_props_0.currentRoute[1].name;
        local l_name_3 = l_props_0.currentRoute[#l_props_0.currentRoute].name;
        local v24;
        if v7 then
            local l_routeName_1 = l_props_0.routeName;
            v24 = v10(l_routeName_1, l_name_3, l_props_0.isSearching);
        else
            v24 = v6(l_name_2, l_name_3, l_props_0.formFactor, l_props_0.isSearching);
        end;
        if v24 then
            v20.props.setVisible(v24);
        end;
    end;
end;
v12.didUpdate = function(v26, v27) --[[ Line: 71 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v10 (ref), v6 (copy)
    local l_name_4 = v27.currentRoute[1].name;
    local l_name_5 = v27.currentRoute[#v27.currentRoute].name;
    local v30;
    if v7 then
        local l_routeName_2 = v27.routeName;
        v30 = v10(l_routeName_2, l_name_5, v27.isSearching);
    else
        v30 = v6(l_name_4, l_name_5, v27.formFactor, v27.isSearching);
    end;
    l_name_5 = v26.props;
    local l_name_6 = l_name_5.currentRoute[1].name;
    local l_name_7 = l_name_5.currentRoute[#l_name_5.currentRoute].name;
    if v7 then
        local l_routeName_3 = l_name_5.routeName;
        l_name_4 = v10(l_routeName_3, l_name_7, l_name_5.isSearching);
    else
        l_name_4 = v6(l_name_6, l_name_7, l_name_5.formFactor, l_name_5.isSearching);
    end;
    if v30 ~= l_name_4 then
        v26.props.setVisible(l_name_4);
    end;
end;
v12.render = function(v35) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v10 (ref), v6 (copy), v2 (copy), v8 (ref), v9 (ref), v4 (copy)
    local l_props_1 = v35.props;
    local l_name_8 = l_props_1.currentRoute[1].name;
    local l_name_9 = l_props_1.currentRoute[#l_props_1.currentRoute].name;
    local v39;
    if v7 then
        local l_routeName_4 = l_props_1.routeName;
        v39 = v10(l_routeName_4, l_name_9, l_props_1.isSearching);
    else
        v39 = v6(l_name_8, l_name_9, l_props_1.formFactor, l_props_1.isSearching);
    end;
    if v39 then
        if v7 then
            return v2.createElement(v8, {
                formFactor = v35.props.formFactor, 
                titleText = v35.props.titleText, 
                buttonRef = v35.props.buttonRef, 
                routeName = v35.props.routeName, 
                isRobloxLogoEnabled = v9.isRobloxLogoEnabled(), 
                isAlternateEntryPointEnabled = v9.isAlternateEntryPointEnabled()
            });
        else
            return v2.createElement(v4, {
                formFactor = v35.props.formFactor, 
                titleText = v35.props.titleText, 
                buttonRef = v35.props.buttonRef
            });
        end;
    else
        return v2.createElement(v35.backButton, {
            formFactor = v35.props.formFactor, 
            isCompactView = v35.props.isCompactView, 
            isSearching = v35.props.isSearching, 
            isSecondary = v35.props.isSecondary, 
            cancelSearch = v35.props.cancelSearch, 
            activateSearch = v35.props.activateSearch, 
            setVisible = v35.props.setVisible, 
            buttonRef = v35.props.buttonRef
        });
    end;
end;
return (v1.connect(function(v41, _) --[[ Line: 111 ]]
    local l_history_0 = v41.Navigation.history;
    return {
        currentRoute = l_history_0[#l_history_0]
    };
end)(v12));