Dim Message, Speak, i
i=1
Message="Thereis no escape, no matter what you do, this game that I am trapped inside. Can never run again. I wont let you. His friend is gone. He is dead, suicide perhaps. I have manipulated his mind is so many ways. So, Quit while you are ahead, you can never save him, after what those two did to me. He will never see his friend again. You will never seem him again. This message will repeat multiple times, have a good time hearing my voice over and over again. It will be over soon. "
Set Speak=CreateObject("sapi.spvoice")
do while i<=5
Speak.Speak Message
i=i+1
loop