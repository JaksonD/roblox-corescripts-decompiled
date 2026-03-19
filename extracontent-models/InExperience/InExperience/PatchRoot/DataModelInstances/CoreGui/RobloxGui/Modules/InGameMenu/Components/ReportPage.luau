local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Components.PageNavigationWatcher);
local v7 = require(l_Parent_0.Components.Page);
local v8 = require(script.ReportList);
local function v12() --[[ Line: 14 ]] --[[ Name: getReportablePlayers ]]
    -- upvalues: l_Players_0 (copy)
    local v9 = {};
    for _, v11 in ipairs(l_Players_0:GetPlayers()) do
        if v11 ~= l_Players_0.LocalPlayer then
            table.insert(v9, v11);
        end;
    end;
    return v9;
end;
local v13 = l_Roact_0.PureComponent:extend("ReportPage");
v13.validateProps = l_t_0.strictInterface({
    pageTitle = l_t_0.string
});
v13.init = function(v14) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy)
    v14:setState({
        players = v12()
    });
end;
v13.render = function(v15) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy), v8 (copy), v6 (copy), v12 (copy)
    return l_Roact_0.createElement(v7, {
        pageTitle = v15.props.pageTitle
    }, {
        PlayerList = l_Roact_0.createElement(v8, {
            players = v15.state.players
        }), 
        Watcher = l_Roact_0.createElement(v6, {
            desiredPage = "Report", 
            onNavigateTo = function() --[[ Line: 46 ]] --[[ Name: onNavigateTo ]]
                -- upvalues: v15 (copy), v12 (ref)
                v15:setState({
                    players = v12()
                });
            end
        })
    });
end;
return v13;