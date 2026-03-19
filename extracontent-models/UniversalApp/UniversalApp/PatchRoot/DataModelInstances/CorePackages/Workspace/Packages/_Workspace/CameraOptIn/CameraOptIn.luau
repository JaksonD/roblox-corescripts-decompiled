local v0 = require(script.getCameraOptIn);
local v1 = require(script.getCameraDevicePermission);
return {
    getCameraOptIn = v0, 
    getCameraDevicePermission = v1
};