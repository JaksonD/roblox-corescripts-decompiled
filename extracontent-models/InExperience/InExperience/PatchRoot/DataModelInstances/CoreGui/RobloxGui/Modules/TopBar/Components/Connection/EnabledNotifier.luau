local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
    return nil;
else
    local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
    local v7 = require(l_RobloxGui_0.Modules.ChatSelector);
    local v8 = require(l_RobloxGui_0.Modules.BackpackScript);
    local v9 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
    local v10 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
    local v11 = v2.PureComponent:extend("CoreGuiCEnabledNotifieronnector");
    v11.validateProps = v4.strictInterface({
        topBarEnabled = v4.boolean
    });
    v11.notifyEnabled = function(v12) --[[ Line: 28 ]] --[[ Name: notifyEnabled ]]
        -- upvalues: v10 (copy), v7 (copy), v8 (copy), v9 (copy)
        v10:SetTopBarEnabled(v12.props.topBarEnabled);
        v7:TopbarEnabledChanged(v12.props.topBarEnabled);
        v8:TopbarEnabledChanged(v12.props.topBarEnabled);
        v9:setTopBarEnabled(v12.props.topBarEnabled);
    end;
    v11.didMount = function(v13) --[[ Line: 35 ]] --[[ Name: didMount ]]
        v13:notifyEnabled();
    end;
    v11.render = function(_) --[[ Line: 39 ]] --[[ Name: render ]]
        return nil;
    end;
    v11.didUpdate = function(v15, v16, _) --[[ Line: 43 ]] --[[ Name: didUpdate ]]
        if v15.props.topBarEnabled ~= v16.topBarEnabled then
            v15:notifyEnabled();
        end;
    end;
    return v3.UNSTABLE_connect2(function(v18) --[[ Line: 49 ]] --[[ Name: mapStateToProps ]]
        return {
            topBarEnabled = v18.displayOptions.topbarEnabled
        };
    end, nil)(v11);
end;