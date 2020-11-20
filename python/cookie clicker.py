from tkinter import *
from random import *
from time import *

window = Tk()
window.title("Cookie Clicker")

c=0

def cookie_click():

    global c
    c=c+1
    
    b.config(text="cookies: "+str(c))    

def curs_buy():

    global c

    c=c-5

    b.config(text="cookies: "+str(c))

def gran_buy():

     global c

     c=c-100

     b.config(text="cookies: "+str(c))

    
    
b=Label(window, text="cookies: "+"0")
b.pack()

a=Button(window, text="Cookie", command=cookie_click)
a.pack()

space=Label(window, text="")
space.pack()

cursor=Button(window, text="cursor", command=curs_buy)
cursor.pack()

grandma=Button(window, text="grandma", command=gran_buy)
grandma.pack()

window.mainloop()
