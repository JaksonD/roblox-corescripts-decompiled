local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_UtilityActionIcon_0 = v4.App.Button.UtilityActionIcon;
local v7 = require(l_CorePackages_0.Packages.Foundation);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableHeaderBarButtonsUpdate;
local v10 = l_Images_0["icons/common/search"];
local v11 = v3.PureComponent:extend("SearchButton");
v11.validateProps = v2.strictInterface({
    formFactor = v2.string, 
    isCompactView = v2.boolean, 
    isSearching = v2.boolean, 
    isSecondary = v2.optional(v2.boolean), 
    setVisible = v1.isCallable, 
    cancelSearch = v1.isCallable, 
    activateSearch = v1.isCallable, 
    buttonRef = v2.optional(v2.table), 
    enableSearch = v2.boolean
});
local function _(v12) --[[ Line: 35 ]] --[[ Name: isVisible ]]
    return v12.enableSearch and v12.isCompactView;
end;
v11.updateVisibility = function(v14, v15) --[[ Line: 40 ]] --[[ Name: updateVisibility ]]
    local l_props_0 = v14.props;
    local v17 = l_props_0.enableSearch and l_props_0.isCompactView;
    if v17 ~= v15 then
        v14.props.setVisible(v17);
    end;
end;
v11.didMount = function(v18) --[[ Line: 47 ]] --[[ Name: didMount ]]
    v18:updateVisibility(nil);
end;
v11.didUpdate = function(v19, v20, _) --[[ Line: 51 ]] --[[ Name: didUpdate ]]
    v19:updateVisibility(v20.enableSearch and v20.isCompactView);
end;
v11.render = function(v22) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v3 (copy), v7 (copy), l_UtilityActionIcon_0 (copy), v10 (copy)
    if l_FFlagEnableHeaderBarButtonsUpdate_0 then
        return v3.createElement(v7.IconButton, {
            isCircular = true, 
            icon = v7.Enums.IconName.MagnifyingGlass, 
            onActivated = v22.props.activateSearch, 
            ref = v22.props.buttonRef
        });
    else
        return v3.createElement(l_UtilityActionIcon_0, {
            icon = v10, 
            onActivated = v22.props.activateSearch, 
            ref = v22.props.buttonRef
        });
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v23, _) --[[ Line: 72 ]]
    return {
        enableSearch = v23.getSearchBar()
    };
end)(v11));