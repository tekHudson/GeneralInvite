local triggers={"1","inv"}
local o=CreateFrame("Frame")
local index = GetChannelName("General")
o:SetScript("OnEvent",function(_,e,m,s,_,_,_,_,_,id)
   if (e=="CHAT_MSG_WHISPER") or index then
      for _,t in ipairs(triggers) do
         if m:lower():find(t) then
            InviteUnit(s)
            break
          end
        end
      end
    end)
local state=false

SlashCmdList.GENERALINVONE = function()
   state=not state if state then
      print("|cff00ccff Now auto-inviting.|r")
      o:RegisterEvent("CHAT_MSG_WHISPER")
      o:RegisterEvent("CHAT_MSG_CHANNEL")
    else print("|cff00ccff No longer auto-inviting.|r")
      o:UnregisterEvent("CHAT_MSG_WHISPER")
      o:UnregisterEvent("CHAT_MSG_CHANNEL")
     end
   end
SLASH_GENERALINVONE1 = "/generalinv1"
