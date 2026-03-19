local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_HeaderBar_0 = require(l_Parent_0.UIBlox).App.Bar.HeaderBar;
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_makeBackButton_0 = require(l_Parent_0.AppHeaderBar).makeBackButton;
local l_useLastInputMode_0 = v3.useLastInputMode;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local l_FFlagEditProfileInExperiencePersonasV2_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileInExperiencePersonasV2;
return function(v12) --[[ Line: 24 ]] --[[ Name: EditProfileTopBar ]]
    -- upvalues: v10 (copy), l_useLastInputMode_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_makeBackButton_0 (copy), v2 (copy), l_HeaderBar_0 (copy), l_FFlagEditProfileInExperiencePersonasV2_0 (copy)
    local v13 = if v10 then l_useLastInputMode_0() == "Focus" else nil;
    local v14 = l_useLocalization_0({
        title = v6.Title
    });
    local v15 = l_makeBackButton_0(v12.onClose);
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        LayoutOrder = v12.layoutOrder, 
        ZIndex = 2
    }, {
        headerBar = v2.createElement(l_HeaderBar_0, {
            isSecondary = true, 
            title = l_FFlagEditProfileInExperiencePersonasV2_0 and v12.title or v14.title, 
            backgroundTransparency = 1, 
            barHeight = 48, 
            renderLeft = if (not v10 or v13) and v10 then nil else v15
        })
    });
end;