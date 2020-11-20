from tkinter import *
from time import *

window = Tk()
window.title("Timer")

s=0
m=0
h=0

lbl=Label(window, text=str(h)+" : "+str(m)+" : "+str(s), font=(20))
lbl.pack()

def timer_start():    

    global s
    global m
    global h    
    
    s=s+1
    if s>59:
        s=0
        m=m+1
    if m>59:
        m=0
        h=h+1

    lbl.config(text=str(h)+" : "+str(m)+" : "+str(s))
    sleep(1)
    timer_start()
    

btn=Button(window, text="Start", font=(20), command=timer_start)
btn.pack()

window.mainloop
