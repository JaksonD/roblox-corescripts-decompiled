local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(script.FriendStatusConnector);
local v5 = require(script.LastInputTypeConnector);
local v6 = require(script.MouseOverrideManager);
local v7 = require(script.FocusHighlightManager);
local v8 = require(script.NativeCloseEventConnector);
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.InGameMenuPolicy);
local v11 = l_t_0.strictInterface({
    isEducationalPopupEnabled = l_t_0.optional(l_t_0.boolean)
});
return v10.connect(function(v12, _) --[[ Line: 32 ]]
    return {
        isEducationalPopupEnabled = v12.enableEducationalPopup()
    };
end)(function(v14) --[[ Line: 20 ]] --[[ Name: Connection ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    assert(v11);
    return l_Roact_0.createFragment({
        FriendStatusConnector = l_Roact_0.createElement(v4), 
        LastInputTypeConnector = l_Roact_0.createElement(v5), 
        MouseOverrideManager = l_Roact_0.createElement(v6), 
        FocusHighlightManager = l_Roact_0.createElement(v7), 
        NativeCloseEventConnector = v14.isEducationalPopupEnabled and l_Roact_0.createElement(v8) or nil
    });
end);