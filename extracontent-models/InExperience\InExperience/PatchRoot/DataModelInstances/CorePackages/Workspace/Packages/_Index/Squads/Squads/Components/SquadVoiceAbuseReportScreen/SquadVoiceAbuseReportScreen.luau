local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v2 = require(script.Parent.SquadVoiceAbuseReport);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v3.React;
local l_Foundation_0 = v3.Foundation;
return function(v6) --[[ Line: 12 ]] --[[ Name: SquadVoiceAbuseReportScreen ]]
    -- upvalues: l_React_0 (copy), l_Foundation_0 (copy), v2 (copy)
    local l_navigation_0 = v6.navigation;
    local v8 = l_navigation_0.getParam("reportData", nil);
    assert(v8 ~= nil, "SquadVoiceAbuseReportScreen requires reportData to be passed in");
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 1, 0), 
        padding = UDim.new(0, 12), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        sizeConstraint = {
            MaxSize = Vector2.new(800, 450)
        }
    }, {
        abuseReportFlow = l_React_0.createElement(v2, {
            reportData = v8, 
            onAbandon = l_navigation_0.pop, 
            onComplete = l_navigation_0.pop
        })
    });
end;