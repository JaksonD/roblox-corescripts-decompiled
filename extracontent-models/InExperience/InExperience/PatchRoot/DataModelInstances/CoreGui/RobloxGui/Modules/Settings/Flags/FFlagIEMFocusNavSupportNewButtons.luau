local CorePackages = game:GetService("CorePackages")
local FFlagIEMFocusNavToButtons = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIEMFocusNavToButtons
local v3 = game:DefineFastFlag("IEMFocusNavSupportNewButtons2", false)

return FFlagIEMFocusNavToButtons and v3
