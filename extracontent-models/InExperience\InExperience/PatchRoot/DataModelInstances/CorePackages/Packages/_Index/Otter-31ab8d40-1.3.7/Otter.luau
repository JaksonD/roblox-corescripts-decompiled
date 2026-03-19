local v0 = require(script.createGroupMotor);
local v1 = require(script.createSingleMotor);
local v2 = require(script.ease);
local v3 = require(script.spring);
local v4 = require(script.instant);
local _ = require(script.types);
local v6 = require(script.AnimationStepSignal);
return {
    createGroupMotor = v0, 
    createSingleMotor = v1, 
    ease = v2, 
    spring = v3, 
    instant = v4, 
    __devAnimationStepSignal = v6
};