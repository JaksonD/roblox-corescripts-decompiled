local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
assert(require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled(), "Chrome.Service should not be initialized when Chrome is not enabled");
return (require(l_script_FirstAncestor_0.ChromeShared.Service));