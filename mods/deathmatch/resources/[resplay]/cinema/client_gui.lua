-- Scripted by G&T Mapping & Loki

-------------------
-- GUI / VISUALS --
-------------------

fontType = dxCreateFont("fonts/uni_sans_heavy.ttf", 25, false, "antialiased")
thumb = "img/bg.png"

function Browser_Tab()
	Image(36, 177, 258, 49, thumb, 0, 0, 0, tocolor(255, 255, 255, 60), true)
end

plTabColor = {51, 51, 51, 255}
ulTabColor = {217, 45, 45, 255}

fontScale = 0.5

fontScaleSmall = 0.35

function Panel()
	Rectangle(16, 76, 1247, 870, tocolor(16, 16, 16, 255), false)
	Rectangle(842, 167, 411, 769, tocolor(16, 16, 16, 255), false)
	Rectangle(26, 167, 806, 769, tocolor(16, 16, 16, 255), false)
	
	Text("YouTube Браузер", 36, 177, 293, 225, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, false, false, false, false)
	Text("Настройки", 301, 177, 558, 225, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, false, false, false, false)
	Text("Помощь", 565, 177, 822, 225, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, false, false, false, false)
	
	Rectangle(36, 260, 786, 413, tocolor(38, 40, 40, 255), false)
	Rectangle(36, 683, 786, 243, tocolor(38, 40, 40, 255), false)
	
	Text("RESPLAY Cinema", 76, 76, 772, 157, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, false, false, false, false)
	
	Image(620, 768, 64, 64, "img/add.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	
	Text("ИГРАТЬ", 307, 693, 552, 916, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, true, false, false, false)
	Text("УДАЛИТЬ", 46, 693, 291, 916, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, true, false, false, false)
	
	Rectangle(852, 260, 87, 38, tocolor(unpack(plTabColor)), false)
    Text("Плейлист", 852, 260, 939, 298, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, false, false, false, false)
    
	Rectangle(949, 260, 87, 38, tocolor(unpack(ulTabColor)), false)
    Text("Игроки", 949, 260, 1036, 298, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, false, false, false, false)
	
    Text("Статус:", 873, 86, 872, 157, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "left", "center", false, false, false, false, false)
    
	if theater then
        Text("ОТКРЫТО", 950, 86, 872, 157, tocolor(0, 255, 0, 255), fontScaleSmall, fontType, "left", "center", false, false, false, false, false)
    else
        Text("ЗАКРЫТО", 968, 86, 872, 157, tocolor(230, 0, 0, 255), fontScaleSmall, fontType, "left", "center", false, false, false, false, false)
    end
	
	Text("Посетителей: ", 1077, 86, 872, 157, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "left", "center", false, false, false, false, false)
	Text(#getElementsWithinColShape(cinemaCol,"player"), 1200, 93, 872, 157, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "left", "center", false, false, false, false, false)	
	--Text("Beta v1.0", 1080, 78, 1258, 107, tocolor(234, 234, 234, 255), fontScale, fontType, "right", "top", false, false, true, false, false)
end

function Settings_Tab()
    if not settingsTabOpen then return end
	
	Image(301, 177, 258, 49, thumb, 0, 0, 0, tocolor(255, 255, 255, 60), false)
	
    Text("VIP настройки", 46, 270, 293, 308, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    Text("Мои настройки", 46, 509, 293, 547, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true) 
    Text("Откр/Закр кинотеатр", 94, 325, 345, 354, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if theater then
        Image(40, 325, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 325, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Вкл/Выкл проигрывание", 94, 371, 345, 400, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if playback then
        Image(40, 371, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 371, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Переключить Аудио", 94, 417, 345, 446, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if audio then
        Image(40, 417, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 417, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Вкл/Выкл Плейлист", 94, 463, 345, 492, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if queue then
        Image(40, 463, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 463, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Вкл/Выкл Свет", 408, 325, 659, 354, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if ambilight then
        Image(354, 325, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 325, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Вкл/Выкл Аудиторию", 408, 371, 659, 400, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if audience then
        Image(354, 371, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 371, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Вкл/Выкл Ночной режим", 408, 417, 659, 446, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if time then
        Image(354, 417, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 417, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Разр/Запр Орудие", 408, 463, 659, 492, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    
	if weapons then
        Image(354, 463, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 463, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Сменить обзор", 94, 610, 345, 639, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    Image(40, 610, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 
    Text("Вкл/Выкл Звук", 94, 564, 345, 593, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    Image(40, 564, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 
    Text("Вкл/Выкл Браузер", 408, 564, 659, 593, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    Image(354, 564, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 
    Text("", 408, 610, 659, 639, tocolor(255, 255, 255, 255), fontScale, fontType, "left", "center", false, false, false, false, true)
    Image(354, 610, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   
    Image(672, 316, 137, 46, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    Text(LIST, 672, 316, 809, 362, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, true, false, false, false)
 
    Image(672, 370, 137, 46, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    Text("Выгнать игрока", 672, 374, 809, 408, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, true, false, false, false)
 
    Image(672, 420, 137, 46, "img/button.png", 0, 0, 0,         tocolor(255, 255, 255, 255), false)
    Text("Выгнать всех", 672, 428, 809, 454,   tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, true, false, false, false)
 
    Image(672, 470, 137, 46, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	Text("Выгнать посетителей", 672, 482, 809, 500, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, true, false, false, false)

	Image(672, 520, 137, 46, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	Text("Доб/Удал VIP", 672, 540, 809, 546, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, true, false, false, false)

    Image(672, 570, 137, 46, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	Text("Очистить Плейлист", 672, 590, 809, 592, tocolor(255, 255, 255, 255), fontScaleSmall, fontType, "center", "center", false, true, false, false, false)
 
end

function Dialog()
	local text = "Вы уверены?"
	local yes = "Да"
	local no = "Нет"
	Rectangle(463, 355, 339, 214, tocolor(255, 127, 0, 255), true)
	Image(491, 486, 137, 47, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	Text(yes, 490 + 1, 486 + 1, 627 + 1, 533 + 1, tocolor(0, 0, 0, 255), fontScale, fontType, "center", "center", false, false, true, false, false)
	Text(yes, 490, 486, 627, 533, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, false, true, false, false)
	Image(637, 486, 137, 47, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	Text(no, 637 + 1, 486 + 1, 774 + 1, 533 + 1, tocolor(0, 0, 0, 255), fontScale, fontType, "center", "center", false, false, true, false, false)
	Text(no, 637, 486, 774, 533, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, false, true, false, false)
	Text(text, 463 + 1, 355 + 1, 802 + 1, 493 + 1, tocolor(0, 0, 0, 255), fontScale, fontType, "center", "center", false, true, true, false, false)
	Text(text, 463, 355, 802, 493, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, true, true, false, false)
end

browserSwitch = "PC"
myBrowserURL = "https://www.youtube.com/tv"
switchedBrowser = false

function switchMyBrowser()
	if not isPanelVisible then return end
	
	Rectangle(761, 260, 61, 38, tocolor(34, 34, 34, 210), true)
	Text(browserSwitch, 761, 260, 822, 298, tocolor(255, 255, 255, 255), fontScale, fontType, "center", "center", false, true, true, false, false)
end

function createBrowserGui()
	Browser_Bg = guiCreateStaticImage(36, 260, 786, 413, "img/bg.png", false)
	Browser = guiCreateBrowser(0, 0, 786, 413, false, false, false, Browser_Bg)
	
	addEventHandler("onClientBrowserCreated",root,function()
		if isElement(Browser) then
			loadBrowserURL(guiGetBrowser(Browser),myBrowserURL)
		end
	end)
end

function Help_Tab_CEGUI()
	GUIEditor.scrollpane[1] = guiCreateScrollPane(36, 261, 786, 411, false)
	GUIEditor.label[7] = guiCreateLabel(10, 10, 766, 752, "a", false, GUIEditor.scrollpane[1])
	guiLabelSetColor(GUIEditor.label[7], 77, 252, 135)
	guiLabelSetHorizontalAlign(GUIEditor.label[7], "left", true)    
end

function Help_Tab()
	Image(565, 177, 258, 49, thumb, 0, 0, 0, tocolor(255, 255, 255, 60), false)
end

guiFont = guiCreateFont("fonts/uni_sans_heavy.ttf", 12)

HelpInfo = ScrollPane(41, 263, 774, 401, false)

HelpLabel = Label(2, 5, 746, 1100, [[RESPLAY Cinema

----------------------------
Команды
----------------------------

Главные команды:

F3 - Открыть/Закрыть браузер
M или /muteit - Выключить/Включить звук
(-/+) - Регулировать громкость

Остальные команды:

/play [url] - Добавляет допустимый URL-адрес YouTube в плейлисте. Принимает большинство типов URL-адресов с YouTube.
/playlist - Показывает список воспроизведения в окне чата
/geturl - Получает URL-адрес текущего видео
/proper - Настраивает ширину экрана, делая его более нормальным

VIP/Admin команды:

/replay - Воспроизведение текущего видео
/skipvideo - Принудительно пропустить текущее видео
/remove [number] - Удаляет видео из плейлиста
/stopplay - Воспроизведение останавливается для всех, и очищает плейлист

Дизайн и перевод от Jengas]], false, HelpInfo)

guiLabelSetColor(HelpLabel, 255, 127, 0)
guiLabelSetHorizontalAlign(HelpLabel, "left", true)
guiSetFont(HelpLabel, guiFont)
guiSetVisible(HelpInfo,false)
