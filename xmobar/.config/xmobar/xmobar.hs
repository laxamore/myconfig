Config { font = "xft:Mononoki Nerd Font:regular:pixelsize=20"
       , bgColor = "#282A2E"
       , fgColor = "grey"
       , position = Top
       , lowerOnStart = True
       , commands = [ Run Network "enp3s0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Network "wlp4s0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Com "uname" ["-s","-r"] "" 36000
    		        , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run Com ".config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%cpu% | %memory% * %swap% | %enp3s0% - %wlp4s0% }{ <fc=#ee9a00>%date%</fc>| %uname% %trayerpad%"
       }
