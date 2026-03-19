local l_CorePackages_0 = game:GetService("CorePackages");
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.EnumReactPage);
local v6 = require(l_Parent_0.Components.PortalWithFoundationStylelink);
local v7 = require(l_Parent_0.ReactPageSignal);
local l_TraversalHistoryPage_0 = require(l_Parent_0.Components.Traversal).TraversalHistoryPage;
return v2.memo(v2.forwardRef(function(v9, _) --[[ Line: 25 ]] --[[ Name: InExperienceMenuReactPage ]]
    -- upvalues: v7 (copy), v3 (copy), v5 (copy), v2 (copy), l_TraversalHistoryPage_0 (copy), l_SettingsShowSignal_0 (copy), v6 (copy)
    local v11 = v7(false);
    local v12 = v3.useSignalState(v11.currentReactPage);
    local v13 = nil;
    if v12 == v5.TraversalHistory then
        v13 = v2.createElement(l_TraversalHistoryPage_0);
    end;
    v2.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v9 (copy)
        if v12 then
            v9.onMount();
            return v9.onUnmount;
        else
            return;
        end;
    end, {
        v12
    });
    v2.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: l_SettingsShowSignal_0 (ref), v9 (copy)
        local v15 = l_SettingsShowSignal_0:connect(function(v14) --[[ Line: 43 ]]
            -- upvalues: v9 (ref)
            if not v14 then
                v9.onUnmount();
            end;
        end);
        return function() --[[ Line: 48 ]]
            -- upvalues: v15 (copy)
            v15:Disconnect();
        end;
    end, {});
    return v2.createElement(v6, {
        parent = v9.mountTo
    }, {
        Page = v13
    });
end));