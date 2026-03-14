local v0 = require(script.Motion);
local v1 = require(script.Utility.useMotion);
local v2 = require(script.AnimatePresence.AnimatePresence);
local v3 = require(script.AnimatePresence.usePresence);
local _ = require(script.Types);
return {
    createState = v0.createState, 
    animate = v0.animate, 
    transition = v0.transition, 
    useMotion = v1, 
    usePresence = v3, 
    AnimatePresence = v2, 
    TransitionPreset = require(script.Enums.TransitionPreset)
};