#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; Filename = "Test - dyu6" ;manually enter file name
Filename = "Original - dyu3" ;manually enter file name

RShift & F4:: ;for testing
{
	Trash(7)
}
Return

RShift & F5:: ;Catching
{
	Loop
	{	
		loop 20
		{
			Loop 2
			{
				Loop 5
				{
					WinActivate, %Filename% ahk_class Qt5QWindowIcon
					sleep 15
					SearchPokemon()
					sleep 1200
					SendInput w
					sleep 900
					SendInput s
					sleep 2800
				}
				sleep 100
				Pokestop(176, 421)
				sleep 100
				Pokestop(127, 502)
				sleep 100
				Pokestop(194, 488)
				sleep 100
				Pokestop(277, 510)
				sleep 100
			}
		RestartEmulator()	
		}
	sleep 15
	Send, {LControl Down} ; open map
	Sleep, 296
	Send, {3}
	Sleep, 172
	Send, {LControl Up}
	Sleep, 1000
	Trash(5)
	sleep 1000
	Poketruck()
	sleep 500
	GPS(43.6402, -79.3761)  ;ferry
	RestartEmulator()
	}
}
Return

RShift & F8:: ;script 1 for gathering pokestops starting at jack layton ferry terminal
{
	Loop 2
	{
		loop 1
		{
			Poketruck()
		}
	RestartEmulator()
	sleep 3000
	; Trash(7)
	sleep 3000
	}
RShift & F9:: pause
RShift & F10:: Reload
RShift & F11:: Exitapp
}
Return

RestartEmulator()
{
	; WinActivate, MultiPlayer ahk_class Qt5QWindow
		; sleep 15
		; MouseClick, left, 380, 92 ; stop instance 1
		; ; MouseClick, left, 384, 129 ; stop instance 2	
		; sleep 500
		; MouseClick, left, 138, 167 ; select OK to quit
		; sleep 4500
		; MouseClick, left, 380, 92 ; start instance 1
		; ; MouseClick, left, 384, 129 ; start instance 2	
	WinClose, %Filename% ahk_class Qt5QWindowIcon
	sleep 5000
	ControlClick, x138 y164, Dialog ahk_class Qt5QWindowIcon ; select OK to quit
		ControlClick, x138 y164, Dialog ahk_class Qt5QWindowIcon ; select OK to quit
			ControlClick, x138 y164, Dialog ahk_class Qt5QWindowIcon ; select OK to quit
	sleep 8000
	run, C:\Users\David Yu\AppData\Roaming\Nox\bin\Nox.exe	
		WinWait, %Filename% ahk_class Qt5QWindowIcon
		if ErrorLevel
		{
			sleep 5
		}
		Else
		sleep 25000	;wait for application to start up
	WinActivate, %Filename% ahk_class Qt5QWindowIcon
		MouseClick, left, 872, 262 ;click on pokemonApp
		sleep 27000	;wait for pokemon to start up
		MouseClick, left, 202, 444 ; click on popup message before game starts
		sleep 1500		
	Loop 2 ; zoom out - looping for robustness
	{
		Click, 258, 103 Left, Down ; zoom out
		Sleep, 62
		Click, 258, 103 Left, Up
		Sleep, 63
		Click, 258, 103 Left, Down
		sleep 15
		MouseMove, 0,-200,10,R
		Click, 260, -104 Left, Up ; zoom out	
		sleep 3000
	}
	sleep 15
	Send, {LControl Down} ; open map
	Sleep, 296
	Send, {3}
	Sleep, 172
	Send, {LControl Up}
}

GPS(longitude, latitude) ;switch GPS location
{
	WinActivate, Nox ahk_class Qt5QWindow
		MouseClick, left, 574, 102,3 ;edit longitude
		sleep 15
		send %longitude%
		sleep 50
		MouseClick, left, 655, 102,3 ;edit latitude
		sleep 15
		send %latitude%
		sleep 15
		MouseClick, left, 755, 102 ;search
		sleep 15
		MouseClick, left, 691, 621 ;submit location
		sleep 15
	WinActivate, %Filename% ahk_class Qt5QWindowIcon
}

Pokestop(X,Y) ;activate pokestop
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon
		MouseClick, left, 369, 129 ;click compass
		sleep 15
		MouseClick, left, %X%, %Y% ;click pokestop
		MouseClick, left, %X%, %Y% ;click pokestop		
		MouseClick, left, %X%, %Y% ;click pokestop		
		sleep 1090		
		MouseClick, left, 24, 74 ;error handling - exit fight
		sleep 30
		MouseClickDrag, left, 142, 386, 243, 374, 2 ;spin coin
		sleep 20
		MouseClickDrag, left, 140, 384, 253, 374, 2 ;spin coin attempt 2
		sleep 20
		MouseClickDrag, left, 143, 385, 293, 374, 2 ;spin coin attempt 3
		sleep 50
		MouseClick, left, 206, 537 ;i'm a passenger	
		sleep 50
		MouseClick, left, 207, 688 ;exit stop
		sleep 15
		MouseClick, left, 207, 688 ;exit stop
		sleep 850
		MouseClick, left, 369, 129 ;click compass
}

CatchPokemon()
{
	loop 5 ; throw balls
	{
		Pokeball_long()
		sleep 2000
		Pokeball_Medium()
		sleep 2000
		Pokeball_short()
		sleep 2000
		Pokeball_VeryLong()	
		sleep 2000	
	}	
	sleep 1000 ;wait for fight to finish
	;MouseClick, left, 47, 87 ;flee from fight
	sleep 50
	MouseClick, left, 207, 688 ;exit fight
	sleep 15
	MouseClick, left, 207, 688 ;exit fight
}

SearchPokemon()
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon
	loop 1 ; from the ferry
	{
		MouseClick, left, 369, 129 ;click compass
		sleep 50
		MouseClick, left, 147, 421 ; outer rings
		sleep 15
		MouseClick, left, 159, 448
		sleep 15
		MouseClick, left, 237, 456
		sleep 15
		MouseClick, left, 296, 550
		sleep 15	
		MouseClick, left, 224, 581	
		sleep 15
		MouseClick, left, 126, 533	
		sleep 15
		MouseClick, left, 179, 448
		sleep 15	
		MouseClick, left, 203, 433
		sleep 15	
		MouseClick, left, 224, 406
		sleep 15	
		MouseClick, left, 215, 439
		sleep 15	
		MouseClick, left, 220, 438
		sleep 15	
		MouseClick, left, 150, 447
		sleep 15	
		MouseClick, left, 147, 407
		sleep 15
		MouseClick, left, 200, 428
		sleep 15
		MouseClick, left, 91, 502
		sleep 15
		MouseClick, left, 107, 543
		sleep 15	
		MouseClick, left, 107, 543
		sleep 15	
		MouseClick, left, 155, 527
		sleep 15	
		MouseClick, left, 158, 500
		sleep 15	
		MouseClick, left, 153, 482
		sleep 15	
		MouseClick, left, 175, 529
		sleep 15	
		MouseClick, left, 201, 517
		sleep 15
		MouseClick, left, 230, 490
		sleep 15
		MouseClick, left, 223, 469
		sleep 15
		MouseClick, left, 166, 468
		sleep 15	
		MouseClick, left, 236, 509
		sleep 15
		MouseClick, left, 246, 539
		sleep 15
		MouseClick, left, 274, 545
		sleep 15
		MouseClick, left, 313, 519
		sleep 15	
		MouseClick, left, 244, 494
		sleep 15	
		MouseClick, left, 305, 491
		sleep 15	
		MouseClick, left, 252, 569
		sleep 15	
		MouseClick, left, 232, 470
		sleep 15	
		MouseClick, left, 177, 472 ;inner rings
		sleep 15	
		MouseClick, left, 162, 440
		sleep 15
		MouseClick, left, 152, 423
		sleep 15
		MouseClick, left, 106, 500
		sleep 15
		MouseClick, left, 130, 526
		sleep 15	
		MouseClick, left, 145, 494
		sleep 15
		MouseClick, left, 181, 502
		sleep 15	
		MouseClick, left, 174, 486
		sleep 15
		MouseClick, left, 217, 489
		sleep 15
		MouseClick, left, 203, 506
		sleep 15	
		MouseClick, left, 254, 498
		sleep 15	
		MouseClick, left, 257, 518
		sleep 15	
		MouseClick, left, 272, 538
		sleep 15	
		MouseClick, left, 291, 532
		sleep 15	
		MouseClick, left, 298, 519
		sleep 15	
		MouseClick, left, 258, 535
		sleep 15
		MouseClick, left, 171, 503
		sleep 15
		MouseClick, left, 213, 501 
		sleep 15
		MouseClick, left, 304, 512
		sleep 15	
		MouseClick, left, 139, 528
		sleep 15	
		MouseClick, left, 106, 529	
		sleep 15
		MouseClick, left, 161, 407
		sleep 15	
		MouseClick, left, 276, 511 ; Final Stop
		sleep 3000 ; wait for pokemon to show Up
		CatchPokemon()
		MouseClick, left, 207, 688 ;exit stop
		sleep 15
		MouseClick, left, 207, 688 ;exit stop	
		sleep 2000 
	}		
}

Pokeball_Short()
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon	
	sleep 10
	MouseClickDrag, left, 200, 732, 200, 592
}

Pokeball_Medium()
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon	
	sleep 10
	MouseClickDrag, left, 200, 732, 200, 492
}

Pokeball_Long()
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon	
	sleep 10
	MouseClickDrag, left, 200, 732, 200, 392
}

Pokeball_VeryLong()
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon	
	sleep 10
	MouseClickDrag, left, 200, 732, 200, 192
}

Poketruck()
{
	sleep 500
	GPS(43.6402, -79.3761)  ;ferry
	sleep 5000
	Pokestop(176, 421)
	sleep 100
	Pokestop(127, 502)
	sleep 100
	Pokestop(194, 488)
	sleep 100
	;Pokestop(279, 466) ; this stop has been removed from game
	;sleep 100
	Pokestop(277, 510)
	sleep 100
	GPS(43.6406, -79.3764)			
	sleep 3000			
	GPS(43.6412, -79.377)
	sleep 5500
	Pokestop(179, 479)
	sleep 100
	GPS(43.6416, -79.3771)				
	sleep 3000			
	GPS(43.6419, -79.3774)
	sleep 3500
	Pokestop(168, 492)
	sleep 100
	Pokestop(274, 479)
	sleep 100
	GPS(43.6427, -79.3779)
	sleep 3000
	GPS(43.6431, -79.3782)
	sleep 4500
	Pokestop(208, 447)
	sleep 100
	Pokestop(136, 490)
	sleep 100
	GPS(43.6428, -79.3794)
	sleep 4500
	Pokestop(265, 462)
	sleep 100
	Pokestop(131, 469)
	sleep 100
	GPS(43.6432, -79.3806)
	sleep 4500
	Pokestop(176, 425)
	sleep 100
	Pokestop(284, 459)
	sleep 100
	Pokestop(226, 561)
	sleep 100
	GPS(43.643, -79.3813)
	sleep 4000
	Pokestop(186, 445)
	sleep 100
	Pokestop(229, 538)
	sleep 100
	GPS(43.6435, -79.3817) 			
	sleep 3000			
	GPS(43.6439, -79.382)  ;error handling - prevent teleport
	sleep 3000
	GPS(43.6443, -79.3823)			
	sleep 3000			
	GPS(43.6446, -79.3826)  ;check point #1 (front/york)
	sleep 5000
	Pokestop(133, 492)
	sleep 100
	Pokestop(241, 472)
	sleep 100
	GPS(43.645, -79.3823)
	sleep 4000
	Pokestop(136, 472)
	sleep 100
	Pokestop(255, 460)
	sleep 100
	GPS(43.6455, -79.3813)
	sleep 4500
	Pokestop(237, 443)
	sleep 100
	Pokestop(271, 512)
	sleep 100
	Pokestop(166, 568)
	sleep 100
	GPS(43.6459, -79.3807)
	sleep 4500
	Pokestop(234, 452)
	sleep 100
	Pokestop(222, 504)
	sleep 100
	;Pokestop(121, 531) ; duplicate
	;sleep 100				
	GPS(43.6457, -79.3798)  ;checkpoint #2 (front/bay)
	sleep 4500
	Pokestop(263, 479)
	sleep 100
	Pokestop(171, 527)
	sleep 100
	GPS(43.6465, -79.3793)			
	sleep 3000				
	GPS(43.647, -79.3795)
	sleep 5000
	Pokestop(209, 436)
	sleep 100
	Pokestop(240, 543)
	sleep 100
	Pokestop(128, 544)
	sleep 100
	GPS(43.6476, -79.3801)
	sleep 3500
	Pokestop(213, 428)
	sleep 100
	Pokestop(180, 465)
	sleep 100
	Pokestop(144, 546)
	sleep 100
	GPS(43.6472, -79.3811)
	sleep 4500
	Pokestop(222, 481)
	sleep 100
	Pokestop(148, 493)
	sleep 100
	GPS(43.648, -79.3813)
	sleep 4500
	Pokestop(221, 433)
	sleep 100
	Pokestop(200, 553)
	GPS(43.6482, -79.3826)
	sleep 4500
	Pokestop(228, 443)
	sleep 100
	Pokestop(166, 548)
	GPS(43.6479, -79.3837)  ;checkpoint #3 (king/york)
	sleep 4000
	Pokestop(249, 453)
	sleep 100
	Pokestop(129, 480)
	sleep 100
	GPS(43.6476, -79.3847)
	sleep 5000
	Pokestop(206, 433)
	sleep 100
	Pokestop(135, 499)
	sleep 100
	GPS(43.6473, -79.3857)
	sleep 3500
	Pokestop(238, 478)
	sleep 100
	Pokestop(212, 542)
	sleep 100
	GPS(43.6472, -79.3865)
	sleep 4500
	Pokestop(242, 430)
	sleep 100
	Pokestop(151, 503)
	sleep 100
	GPS(43.647, -79.3878)
	sleep 4000
	Pokestop(250, 463)
	sleep 100
	Pokestop(143, 521)
	sleep 100
	GPS(43.6466, -79.3885)  
	sleep 4500
	Pokestop(269, 517)
	sleep 100
	Pokestop(130, 485)
	sleep 100
	GPS(43.6461, -79.3889)
	sleep 3000				
	GPS(43.6457, -79.3891)
	sleep 4500
	Pokestop(167, 441)  ; stop removed // added back
	sleep 100
	Pokestop(125, 518)  ; stop removed // added back
	sleep 100
	Pokestop(296, 508)
	sleep 100
	GPS(43.6458, -79.3880)
	sleep 3000					
	GPS(43.646, -79.3875)
	sleep 4500
	Pokestop(184, 419)
	sleep 100
	Pokestop(130, 522)
	sleep 100
	Pokestop(245, 515)
	sleep 100
	GPS(43.6460, -79.3862)
	sleep 3000		
	GPS(43.646, -79.3858)
	sleep 5000
	Pokestop(208, 467)
	sleep 100
	Pokestop(224, 521)
	sleep 100
	GPS(43.6453, -79.3857)
	sleep 3000					
	GPS(43.6448, -79.3858)
	sleep 4500
	Pokestop(230, 437)
	sleep 100
	Pokestop(155, 450)
	sleep 100
	GPS(43.6444, -79.3862)
	sleep 4500
	Pokestop(231, 526)
	sleep 100
	GPS(43.6447, -79.387)
	sleep 4500
	Pokestop(171, 442)
	sleep 100
	Pokestop(126, 488)
	sleep 100
	Pokestop(212, 542)
	sleep 100
	GPS(43.6442, -79.3881)
	sleep 4500
	Pokestop(258, 467)
	sleep 100
	GPS(43.6438, -79.3887)
	sleep 4500
	Pokestop(182, 438)
	sleep 100
	Pokestop(164, 506)
	sleep 100
	GPS(43.6434, -79.3886)
	sleep 3000			
	GPS(43.6431, -79.3884)  ;error handling
	sleep 3000
	GPS(43.6425, -79.3879)
	sleep 4500
	Pokestop(139, 451)
	sleep 100
	Pokestop(258, 461)
	sleep 100
	Pokestop(232, 520)
	sleep 100
	GPS(43.6422, -79.3868)
	sleep 3000
	Pokestop(163, 474)
	sleep 100			
	GPS(43.6422, -79.386)
	sleep 4500
	Pokestop(137, 549)
	sleep 100
	Pokestop(250, 502)
	sleep 100
	GPS(43.6426, -79.385)
	sleep 4000
	Pokestop(128, 480)
	sleep 100
	Pokestop(208, 441)
	sleep 100
	GPS(43.6423, -79.384)
	sleep 4500
	Pokestop(148, 441)
	sleep 100
	Pokestop(177, 533)
	sleep 100
	Pokestop(291, 491)
	sleep 100
	GPS(43.6426, -79.383)
	sleep 4500
	Pokestop(135, 451)
	sleep 100
	GPS(43.6423, -79.3819)
	sleep 5000			
	GPS(43.6422, -79.381)
	sleep 4500
	Pokestop(191, 434)
	sleep 100
	GPS(43.6414, -79.3806)  ;error handling movement
	sleep 5000
	GPS(43.6406, -79.3802)  ;error handling movement
	sleep 5000
	GPS(43.6401, -79.3798)
	sleep 3000					
	GPS(43.6399, -79.3796)
	sleep 4500
	Pokestop(263, 452)
	sleep 100
	Pokestop(133, 528)
	sleep 100
	GPS(43.6404, -79.3788)
	sleep 3000					
	GPS(43.6407, -79.3785)
	sleep 4500
	Pokestop(125, 496)
	sleep 100
	GPS(43.6409, -79.3775)
	sleep 3000					
	GPS(43.6411, -79.3769)  ;error handling movement
	sleep 3000
	GPS(43.6408, -79.3766)
	sleep 3000	
}

Trash(ItemsToTrash)
{
	WinActivate, %Filename% ahk_class Qt5QWindowIcon
	MouseClick, left, 202, 685  ;open items
	sleep 1100
	MouseClick, left, 317, 631  ;open items
	sleep 1100	
	loop %ItemsToTrash%
	{
		MouseClick, left, 370, 164
		sleep 1100
		Click, 297, 357 Left, Down ;hold down to clear items
		sleep 5000
		Click, 297, 357 Left, Up
		sleep 15
		MouseClick, left, 200, 482 ;confirm discard
		sleep 1100
	}
	MouseClick, left, 207, 688 ;exit items
	sleep 15
	MouseClick, left, 207, 688 ;exit items
}

