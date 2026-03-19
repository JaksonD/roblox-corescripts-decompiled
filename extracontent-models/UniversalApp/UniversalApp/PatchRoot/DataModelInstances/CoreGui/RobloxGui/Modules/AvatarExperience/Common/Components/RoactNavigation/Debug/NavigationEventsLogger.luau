local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useRouteName;
local v4 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.events");
if not v4.active[v4.Levels.Debug] then
    return function() --[[ Line: 11 ]]

    end;
else
    return function() --[[ Line: 14 ]] --[[ Name: NavigationEventsLogger ]]
        -- upvalues: l_useRouteName_0 (copy), v4 (copy), v1 (copy), l_NavigationEvents_0 (copy)
        local v5 = l_useRouteName_0();
        local function _(v6) --[[ Line: 17 ]] --[[ Name: logEvent ]]
            -- upvalues: v4 (ref), v5 (copy)
            v4:debug("[{}] {}", v5, v6);
        end;
        v1.useEffect(function() --[[ Line: 21 ]]
            -- upvalues: v4 (ref), v5 (copy)
            v4:debug("[{}] {}", v5, "didMount");
            return function() --[[ Line: 23 ]]
                -- upvalues: v4 (ref), v5 (ref)
                v4:debug("[{}] {}", v5, "willUnmount");
            end;
        end, {});
        return v1.createElement(l_NavigationEvents_0, {
            onWillFocus = function() --[[ Line: 29 ]] --[[ Name: onWillFocus ]]
                -- upvalues: v4 (ref), v5 (copy)
                v4:debug("[{}] {}", v5, "onWillFocus");
            end, 
            onWillBlur = function() --[[ Line: 32 ]] --[[ Name: onWillBlur ]]
                -- upvalues: v4 (ref), v5 (copy)
                v4:debug("[{}] {}", v5, "onWillBlur");
            end, 
            onDidFocus = function() --[[ Line: 35 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v4 (ref), v5 (copy)
                v4:debug("[{}] {}", v5, "onDidFocus");
            end, 
            onDidBlur = function() --[[ Line: 38 ]] --[[ Name: onDidBlur ]]
                -- upvalues: v4 (ref), v5 (copy)
                v4:debug("[{}] {}", v5, "onDidBlur");
            end
        });
    end;
end;