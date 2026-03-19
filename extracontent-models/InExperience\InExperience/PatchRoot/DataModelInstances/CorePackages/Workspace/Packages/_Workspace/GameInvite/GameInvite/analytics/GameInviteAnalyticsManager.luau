local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local v2 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalytics);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_EventStream_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventStream;
local l_Diag_0 = require(l_Parent_0.Analytics).AnalyticsReporters.Diag;
return (v2.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0)):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)));