local l_Parent_0 = script.Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
return {
    ReloadPage = l_Signal_0.new(), 
    ReportMutedError = l_Signal_0.new()
};