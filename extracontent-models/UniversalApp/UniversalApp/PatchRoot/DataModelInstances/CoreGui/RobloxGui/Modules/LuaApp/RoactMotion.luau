local l_RoactMotionImplementation_0 = script.Parent.RoactMotionImplementation;
local v1 = require(l_RoactMotionImplementation_0.MotionSpecifier);
local v2 = require(l_RoactMotionImplementation_0.SimpleMotion);
return {
    spring = v1.spring, 
    SimpleMotion = v2
};