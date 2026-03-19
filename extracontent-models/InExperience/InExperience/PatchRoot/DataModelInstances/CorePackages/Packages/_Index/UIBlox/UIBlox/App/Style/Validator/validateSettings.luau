local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting");
local v2 = require(l_Parent_0.t);
return (v2.strictInterface({
    PreferredTransparency = v2.optional(v2.number), 
    ReducedMotion = v2.optional(v2.boolean), 
    PreferredTextSize = if v1 then v2.optional(v2.enum(Enum.PreferredTextSize)) else nil, 
    Scale = v2.optional(v2.number)
}));