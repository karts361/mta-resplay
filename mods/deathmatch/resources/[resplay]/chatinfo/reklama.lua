function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

reklamy = {"Остались вопросы по игре? Откройте меню K, нажмите Модерация - Задать вопрос и напишите все ваши вопросы"} --Reklamy
reklamy2 = {"Нашли баг? Отправьте его в личные сообщения группы ВК: #FFBF00vk.com/resplay #FFFFFFили в дискорд канал #FFBF00https://discord.gg/94NWrbk"} --Reklamy

function getAds ()
 
cislo = math.random(1, #reklamy)
--cislo2 = math.random(1, #reklamy2) 
outputChatBox(generateTimeString()..reklamy[cislo], getRootElement(), 255, 255, 255, true)
--outputChatBox(generateTimeString()..reklamy2[cislo2], getRootElement(), 255,255,255, true)
 
end
 
setTimer(getAds, 1200000, 0)


function getAds2 ()
 
--cislo = math.random(1, #reklamy)
cislo2 = math.random(1, #reklamy2) 
--outputChatBox(generateTimeString()..reklamy[cislo], getRootElement(), 0, 120, 255, true)
outputChatBox(generateTimeString()..reklamy2[cislo2], getRootElement(), 255,255,255, true)
 
end
 
setTimer(getAds2, 900000, 0)
