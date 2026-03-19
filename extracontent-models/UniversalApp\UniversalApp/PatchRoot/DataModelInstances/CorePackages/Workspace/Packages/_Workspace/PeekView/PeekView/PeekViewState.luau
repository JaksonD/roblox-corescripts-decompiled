local l_Parent_0 = script.Parent.Parent;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
return {
    Hidden = l_Symbol_0.named("Hidden"), 
    Closed = l_Symbol_0.named("Closed"), 
    Brief = l_Symbol_0.named("Brief"), 
    SuperBrief = l_Symbol_0.named("SuperBrief"), 
    Full = l_Symbol_0.named("Full"), 
    Extended = l_Symbol_0.named("Extended")
};