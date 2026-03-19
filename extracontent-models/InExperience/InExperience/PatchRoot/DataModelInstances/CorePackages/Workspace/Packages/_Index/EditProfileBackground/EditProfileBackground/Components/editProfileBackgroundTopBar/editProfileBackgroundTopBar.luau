local l_Parent_0 = script:FindFirstAncestor("EditProfileBackground").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_HeaderBar_0 = require(l_Parent_0.UIBlox).App.Bar.HeaderBar;
local l_makeBackButton_0 = require(l_Parent_0.AppHeaderBar).makeBackButton;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local l_View_0 = v2.View;
return function(v8) --[[ Line: 22 ]] --[[ Name: EditProfileBackgroundTopBar ]]
    -- upvalues: l_useLastInputMode_0 (copy), l_useLocalization_0 (copy), l_makeBackButton_0 (copy), v1 (copy), l_View_0 (copy), l_HeaderBar_0 (copy)
    local v9 = l_useLastInputMode_0() == "Focus";
    local v10 = l_useLocalization_0({
        EditBackground = "Feature.Profile.Label.EditBackground"
    });
    local v11 = l_makeBackButton_0(v8.onClose);
    return v1.createElement(l_View_0, {
        tag = "size-full-1200", 
        LayoutOrder = v8.layoutOrder, 
        ZIndex = 2
    }, {
        headerBar = v1.createElement(l_HeaderBar_0, {
            isSecondary = true, 
            title = v10.EditBackground, 
            backgroundTransparency = 1, 
            barHeight = 48, 
            renderLeft = if not v9 then v11 else nil
        })
    });
end;