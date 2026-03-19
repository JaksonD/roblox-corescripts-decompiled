local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local v4 = require(l_CorePackages_0.Packages.t);
local l_AppCard_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore).AppCard;
local l_SceneView_0 = v3.SceneView;
local l_FFlagAXUsePreloadingSwitchView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUsePreloadingSwitchView;
local v8 = {
    keepVisitedScreensMounted = false
};
local v9 = v2.Component:extend("PreloadingSwitchView");
v9.validateProps = v4.interface({
    navigation = v4.interface({
        state = v4.interface({
            index = v4.number, 
            routes = v4.array(v4.table)
        })
    }), 
    navigationConfig = v4.optional(v4.interface({
        keepVisitedScreensMounted = v4.optional(v4.boolean)
    })), 
    screenProps = v4.optional(v4.any), 
    descriptors = v4.table
});
v9.getDerivedStateFromProps = function(v10, v11) --[[ Line: 42 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v1 (copy), v8 (copy)
    local l_state_0 = v10.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local l_descriptors_0 = v10.descriptors;
    local l_keepVisitedScreensMounted_0 = v1.Dictionary.join(v8, v10.navigationConfig or {}).keepVisitedScreensMounted;
    local v16 = {
        [l_key_0] = true
    };
    if l_keepVisitedScreensMounted_0 then
        local v17 = v11.visitedScreenKeys or {};
        for v18 in v17 do
            if l_descriptors_0[v18] ~= nil then
                v16[v18] = true;
            end;
        end;
    end;
    return {
        visitedScreenKeys = v16
    };
end;
local function _(v19) --[[ Line: 68 ]] --[[ Name: alwaysRenderScreen ]]
    return v19.options and v19.options.alwaysRendered;
end;
v9.render = function(v21) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXUsePreloadingSwitchView_0 (copy), v2 (copy), l_AppCard_0 (copy), l_SceneView_0 (copy)
    local l_state_1 = v21.props.navigation.state;
    local l_screenProps_0 = v21.props.screenProps;
    local l_descriptors_1 = v21.props.descriptors;
    local l_visitedScreenKeys_0 = v21.state.visitedScreenKeys;
    local l_key_1 = l_state_1.routes[l_state_1.index].key;
    local v27 = {};
    for v28, v29 in l_descriptors_1 do
        local v30 = v28 == l_key_1;
        if l_visitedScreenKeys_0[v28] == true or v29.options and v29.options.alwaysRendered then
            v27["card_" .. v28] = if l_FFlagAXUsePreloadingSwitchView_0 then v2.createElement(l_AppCard_0, {
                isActive = v30, 
                descriptor = v29, 
                screenProps = l_screenProps_0, 
                isVisible = v30
            }) else v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                BorderSizePixel = 0, 
                Visible = v30
            }, {
                Content = v2.createElement(l_SceneView_0, {
                    component = v29.getComponent(), 
                    navigation = v29.navigation, 
                    screenProps = l_screenProps_0
                })
            });
        end;
    end;
    return v2.createElement("Folder", nil, v27);
end;
return v9;