local v0 = require(script.Components.GlobalNav);
local v1 = require(script.Components.GlobalNavContainer);
local v2 = require(script.Components.GlobalNavContainer.useGlobalNavDisplayOptions);
return {
    GlobalNav = v0, 
    GlobalNavContainer = v1, 
    useGlobalNavDisplayOptions = v2, 
    ["jest.config"] = script["jest.config"]
};