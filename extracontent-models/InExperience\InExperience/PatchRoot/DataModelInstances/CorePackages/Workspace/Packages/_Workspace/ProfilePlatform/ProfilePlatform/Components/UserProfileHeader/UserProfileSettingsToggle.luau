local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Toggle_0 = v3.Toggle;
local l_ToggleSize_0 = v3.Enums.ToggleSize;
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_HorizontalPageMargin_0 = v6.App.Container.HorizontalPageMargin;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v12 = require(l_script_FirstAncestor_0.Networking.UserProfileSettingsNetworking);
local v13 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserProfileHeader);
return function(v14) --[[ Line: 27 ]] --[[ Name: UserProfileSettingsToggle ]]
    -- upvalues: v11 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v2 (copy), v12 (copy), v13 (copy), l_HorizontalPageMargin_0 (copy), l_StyledTextLabel_0 (copy), l_Toggle_0 (copy), l_ToggleSize_0 (copy)
    local v15 = v11();
    local v16 = l_useStyle_0();
    local v17 = l_useDispatch_0();
    local v20 = v2.useCallback(function(v18) --[[ Line: 32 ]]
        -- upvalues: v17 (copy), v12 (ref), v13 (ref), v15 (copy)
        v17(v12.SetUserProfileSettings.API({
            isInExperienceNameEnabled = v18
        })):andThen(function(v19) --[[ Line: 35 ]]
            -- upvalues: v17 (ref), v13 (ref), v15 (ref)
            if v19.responseBody.successfullyUpdated then
                v17(v13(v15.profileId));
            end;
        end);
    end);
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = v14.size, 
        layoutOrder = v14.layoutOrder, 
        backgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 8)
        }), 
        Label = v2.createElement(l_StyledTextLabel_0, {
            text = "In-experience name:", 
            fontStyle = v16.Font.CaptionHeader, 
            colorStyle = v16.Theme.TextEmphasis, 
            automaticSize = Enum.AutomaticSize.XY
        }), 
        Toggle = v2.createElement(l_Toggle_0, {
            label = "", 
            size = l_ToggleSize_0.Medium, 
            isChecked = v14.isInExperienceNameEnabled, 
            onActivated = v20
        })
    });
end;