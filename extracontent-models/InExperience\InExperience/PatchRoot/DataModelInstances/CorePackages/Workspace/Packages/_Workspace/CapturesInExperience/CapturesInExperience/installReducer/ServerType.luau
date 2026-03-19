local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Enums.ServerType);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Actions.ServerTypeDetected);
local l_StandardServer_0 = v2.StandardServer;
return v3.createReducer(l_StandardServer_0, {
    [v4.name] = function(_, v7) --[[ Line: 15 ]]
        return v7.serverType;
    end
});