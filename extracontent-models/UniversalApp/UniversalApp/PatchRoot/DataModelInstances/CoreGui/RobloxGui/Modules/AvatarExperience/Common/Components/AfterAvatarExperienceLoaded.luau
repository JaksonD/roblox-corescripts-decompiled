local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_RetrievalStatus_0 = v5.App.Loading.Enum.RetrievalStatus;
local l_LoadingStateContainer_0 = v5.App.Container.LoadingStateContainer;
local v8 = v2.PureComponent:extend("AvatarExperienceLoaded");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
v8.validateProps = v4.strictInterface({
    showLoadingBar = v4.boolean, 
    [v2.Children] = v4.optional(v4.table), 
    avatarExperienceLoaded = v4.boolean
});
v8.init = function(v11) --[[ Line: 38 ]] --[[ Name: init ]]
    v11.emptyRenderFunction = function() --[[ Line: 39 ]]
        return nil;
    end;
end;
v8.getLoadingStatus = function(v12) --[[ Line: 44 ]] --[[ Name: getLoadingStatus ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if not v12.props.avatarExperienceLoaded then
        return l_RetrievalStatus_0.Fetching;
    else
        return l_RetrievalStatus_0.Done;
    end;
end;
v8.render = function(v13) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_LoadingStateContainer_0 (copy)
    local v14 = nil;
    if not v13.props.showLoadingBar then
        v14 = v13.emptyRenderFunction;
    end;
    return v2.createElement(l_LoadingStateContainer_0, {
        dataStatus = v13:getLoadingStatus(), 
        renderOnLoaded = function() --[[ Line: 61 ]] --[[ Name: renderOnLoaded ]]
            -- upvalues: v2 (ref), v13 (copy)
            return v2.oneChild(v13.props[v2.Children]);
        end, 
        renderOnLoading = v14
    });
end;
v8 = v3.connect(function(v15, _) --[[ Line: 68 ]] --[[ Name: mapStateToProps ]]
    return {
        avatarExperienceLoaded = v15.AvatarExperience.Common.AvatarExperienceLoaded
    };
end, nil)(v8);
return function(v17, v18) --[[ Line: 76 ]]
    -- upvalues: v2 (copy), v8 (ref)
    if v18 == nil then
        v18 = true;
    end;
    return function(v19) --[[ Line: 81 ]]
        -- upvalues: v2 (ref), v8 (ref), v18 (ref), v17 (copy)
        return v2.createElement(v8, {
            showLoadingBar = v18
        }, {
            Child = v2.createElement(v17, v19)
        });
    end;
end;