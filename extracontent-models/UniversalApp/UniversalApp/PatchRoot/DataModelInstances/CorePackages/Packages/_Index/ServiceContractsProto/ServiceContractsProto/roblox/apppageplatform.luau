local _ = require(script.Parent.Parent.proto);
local v1 = require(script.badges.v1beta1);
local v2 = require(script.shared.v1beta1);
return {
    badges = v1, 
    shared = v2
};