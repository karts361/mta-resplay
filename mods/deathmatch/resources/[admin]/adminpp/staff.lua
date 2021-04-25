------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--  RIGHTS:      All rights reserved by developer
--  FILE:        adminPanel/staff.lua
--  DEVELOPER:   Prime aka Kunal
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

local staffTable =
{
--You can add admins manually here
-- {"Account Name"},
--Eg.
{"Karts"}, {"JustEazzy"}, {"Midlas"}, {"Sadros"}, {"DEAGLOS"}, {"Test_Account"},
}

--=========================================Don't edit anything below this or you might break it=========================================--


addEventHandler("onResourceStart", root,
	function()
		for i=1, #staffTable do
			local staffList = dbPoll(dbQuery(adminDB, "SELECT * FROM staffList WHERE staff=?", staffTable[i][1]), -1)
			if (#staffList == 0) then
				dbExec(adminDB, "INSERT INTO staffList(staff) VALUES(?)", staffTable[i][1])
			end
		end
	end
)

addEventHandler("onPlayerLogin", root,
	function()
		local staffName = dbPoll(dbQuery(adminDB, "SELECT * FROM staffList WHERE staff=?", getAccountName(getPlayerAccount(source))), -1)
		if (not (#staffName == 0)) then
			setElementData(source, "isPlayerStaff", true)
			outputChatBox(generateTimeString().."Вы залогинились в админку. Работаем, не стесняемся! Нажмите P чтобы открыть админ панель", source, 225, 225, 225)
		end
	end
)

addEventHandler("onPlayerLogout", root,
	function()
		setElementData(source, "isPlayerStaff", false)
		outputChatBox(generateTimeString().."Вы разлогинились с админки.", source, 225, 225, 225)
	end
)
