local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Thunks.OpenEducationalPopup);
local v9 = require(l_Parent_0.Utility.ExternalEventConnection);
local v10 = require(l_Parent_0.InGameMenuPolicy);
local v11 = require(l_Parent_0.Utility.UserLocalStore);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local v13 = require(l_Parent_0.Resources.Constants);
local v14 = l_Roact_0.PureComponent:extend("NativeCloseEventConnector");
v14.validateProps = l_t_0.strictInterface({
    isEducationalPopupEnabled = l_t_0.boolean, 
    maxDisplayCount = l_t_0.integer, 
    openEducationalPopup = l_t_0.optional(l_t_0.callback)
});
v14.init = function(v15) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v11 (copy), l_GuiService_0 (copy), v12 (copy), v13 (copy)
    v15.onNativeCloseConnect = function() --[[ Line: 27 ]]
        -- upvalues: v15 (copy), l_RbxAnalyticsService_0 (ref), v11 (ref), l_GuiService_0 (ref), v12 (ref), v13 (ref)
        if v15.props.isEducationalPopupEnabled then
            l_RbxAnalyticsService_0:ReportCounter("LeaveGame_NativeClose", 1);
            local v16 = v11.new();
            v15.props.openEducationalPopup(l_GuiService_0, v16, v15.props.maxDisplayCount);
        end;
        v12(v13.AnalyticsInGameMenuName, "LeaveGame_NativeClose", {});
    end;
end;
v14.render = function(v17) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v9 (copy), l_GuiService_0 (copy)
    return l_Roact_0.createElement(v9, {
        event = l_GuiService_0.NativeClose, 
        callback = v17.onNativeCloseConnect
    });
end;
v14 = v10.connect(function(v18, _) --[[ Line: 46 ]]
    return {
        isEducationalPopupEnabled = v18.enableEducationalPopup(), 
        maxDisplayCount = v18.educationalPopupMaxDisplayCount()
    };
end)(v14);
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v20) --[[ Line: 53 ]]
    -- upvalues: v8 (copy)
    return {
        openEducationalPopup = function(v21, v22, v23) --[[ Line: 55 ]] --[[ Name: openEducationalPopup ]]
            -- upvalues: v20 (copy), v8 (ref)
            return v20(v8(v21, v22, v23));
        end
    };
end)(v14);