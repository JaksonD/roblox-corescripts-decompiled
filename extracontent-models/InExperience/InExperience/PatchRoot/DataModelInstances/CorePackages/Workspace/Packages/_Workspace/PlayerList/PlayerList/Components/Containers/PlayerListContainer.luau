local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local _ = require(l_Parent_1.Signals);
local v4 = require(l_Parent_1.SignalsReact);
local v5 = require(l_Parent_1.ReactFocusNavigation);
local _ = require(l_Parent_1.LeaderboardStore);
local v7 = require(l_Parent_0.Common.LeaderboardStoreContext);
local v8 = require(l_Parent_0.Common.LayoutValuesContext);
local v9 = require(l_Parent_0.Common.CreateLayoutValues);
local l_FocusNavigationContext_0 = v5.FocusNavigationContext;
local l_FocusNavigationService_0 = v5.FocusNavigationService;
local v12 = require(l_Parent_0.Flags.FFlagAddNewPlayerListFocusNav);
return v2.memo(function(v13) --[[ Line: 27 ]]
    -- upvalues: v9 (copy), v4 (copy), l_FocusNavigationService_0 (copy), v5 (copy), v2 (copy), v7 (copy), v8 (copy), v12 (copy), l_FocusNavigationContext_0 (copy)
    local v14 = v9(v13.isTenFoot or false, v13.TopBarConstants);
    local v15 = v4.useSignalState(v13.leaderboardStore);
    local v16 = l_FocusNavigationService_0.new(v5.EngineInterface.CoreGui);
    return v2.createElement(v7.Provider, {
        value = v15
    }, {
        LayoutValuesProvider = v2.createElement(v8.Provider, {
            value = v14
        }, if v12 then {
            FocusNavigationProvider = v2.createElement(l_FocusNavigationContext_0.Provider, {
                value = v16
            }, v13.children)
        } else v13.children)
    });
end);