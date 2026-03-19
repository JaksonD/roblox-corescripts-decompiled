local v0 = require(script.makeTimerImpl);
local v1 = require(script.makeIntervalImpl);
return require(script.Parent.Object.assign)({}, v0(task.delay), v1(task.delay));