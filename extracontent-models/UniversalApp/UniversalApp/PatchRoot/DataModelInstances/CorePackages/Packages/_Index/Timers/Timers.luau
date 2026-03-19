local l_Parent_0 = script.Parent;
local l_Object_0 = require(l_Parent_0.Collections).Object;
local v2 = require(script.makeTimerImpl);
local v3 = require(script.makeIntervalImpl);
return l_Object_0.assign({}, v2(task.delay), v3(task.delay));