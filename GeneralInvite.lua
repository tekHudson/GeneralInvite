local is_listening = false
local triggers = {"1","inv"}
local frame = CreateFrame("Frame")
local generalChannel = GetChannelName("General")

frame:SetScript("OnEvent",function(_,event,message,sender,_,_,_,_,_,_)
  -- If there are less than 5 people in my group, invite sender
  if GetNumGroupMembers() < 5 then
    if (event == "CHAT_MSG_WHISPER") or generalChannel then
      if userString then
        if string.match(userString, message) then
          InviteUnit(sender)
          break
        end
      else
        for _,trigger in ipairs(triggers) do
          if message:lower():find(trigger) then
            InviteUnit(sender)
            break
          end
        end
      end
    end
  else
    -- Turn off
    is_listening = false
    print("|cff00ff00 Full party, no longer auto-inviting.|r")
    frame:UnregisterEvent("CHAT_MSG_WHISPER")
    frame:UnregisterEvent("CHAT_MSG_CHANNEL")
  end
end)

SlashCmdList.GENERALINV = function(userString)
  if is_listening then
    -- Turn off
    is_listening = false
    print("|cff00ccff No longer auto-inviting.|r")
    raidFrame:UnregisterEvent("CHAT_MSG_WHISPER")
    raidFrame:UnregisterEvent("CHAT_MSG_CHANNEL")
  else
    -- Turn on
    is_listening = true
    print("|cff00ccff Now auto-inviting.|r")
    raidFrame:RegisterEvent("CHAT_MSG_WHISPER")
    raidFrame:RegisterEvent("CHAT_MSG_CHANNEL")
  end
end

SLASH_GENERALINV1 = "/generalinv"
SLASH_GENERALINV2 = "/gi"
