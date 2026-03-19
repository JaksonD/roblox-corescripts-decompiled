local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v4 = require(l_script_FirstAncestor_0.BaseComponents.EditProfileHeaderBar);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v7) --[[ Line: 22 ]]
    -- upvalues: l_useProfileCardWidth_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), v4 (copy)
    local v8 = l_useProfileCardWidth_0();
    local v9 = l_useLocalization_0({
        title = v7.titleKey
    });
    return v2.createElement(l_View_0, {
        tag = "col bg-surface-0 anchor-top-right position-top-right items-start", 
        Size = UDim2.new(0, v8, 1, 0)
    }, {
        TopBar = v2.createElement(v4, {
            onClose = v7.onClose, 
            headerText = v9.title, 
            onSave = v7.onSave, 
            isLoading = v7.isLoading, 
            isDisabled = v7.isDisabled
        }), 
        Content = v2.createElement(l_View_0, {
            tag = "col padding-xlarge gap-xxlarge size-full-0 auto-y"
        }, v7.component)
    });
end;