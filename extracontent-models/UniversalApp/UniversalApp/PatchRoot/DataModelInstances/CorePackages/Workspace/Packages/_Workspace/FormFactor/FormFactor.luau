local v0 = require(script.FormFactor);
local v1 = require(script.FormFactorReducer);
local v2 = require(script.SetFormFactor);
return {
    FormFactorReducer = v1, 
    Enums = {
        FormFactor = v0
    }, 
    Actions = {
        SetFormFactor = v2
    }
};