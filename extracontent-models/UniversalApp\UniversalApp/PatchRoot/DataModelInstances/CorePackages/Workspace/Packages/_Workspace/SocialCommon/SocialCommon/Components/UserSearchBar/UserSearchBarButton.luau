local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.Localization);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local v10 = require(l_script_FirstAncestor_0.Hooks.useIsWideMode);
local v11 = require(l_script_FirstAncestor_0.Components.UserSearchBar.UserSearchBar);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(v13) --[[ Line: 31 ]]
    -- upvalues: v10 (copy), l_useSelector_0 (copy), l_getPageMargin_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_ImageSetButton_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), v11 (copy)
    local v14 = v10();
    local v16 = l_useSelector_0(function(v15) --[[ Line: 35 ]]
        return v15.ScreenSize;
    end);
    local v17 = l_getPageMargin_0(v16.X);
    local v18 = l_useLocalization_0({
        searchPlaceholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople"
    });
    return v2.createElement(l_ImageSetButton_0, {
        BackgroundTransparency = 1, 
        Size = if v14 then UDim2.fromOffset(400, 48) else UDim2.new(1, l_FFlagCreateConnectionsHub_0 and 0 or -2 * v17, 0, 48), 
        Position = UDim2.new(0, l_FFlagCreateConnectionsHub_0 and 0 or v17, 0, 0), 
        [v2.Event.Activated] = v13.onActivated
    }, {
        SearchBar = v2.createElement(v11, {
            isDisabled = true, 
            searchPlaceholderText = v18.searchPlaceholderText
        })
    });
end;