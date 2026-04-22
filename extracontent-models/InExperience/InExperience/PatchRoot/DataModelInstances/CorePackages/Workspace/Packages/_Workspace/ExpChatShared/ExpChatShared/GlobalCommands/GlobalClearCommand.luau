local _ = require(script.Parent.types);
local v1 = require(script.Parent.Parent.Commands.RBXClearCommand);
return {
    name = script.Name, 
    alias = v1.alias, 
    clientRun = v1.clientRun
};