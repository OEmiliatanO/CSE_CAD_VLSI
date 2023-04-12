import tkinter as tk
import random
from time import time
from random import randint

class node():
    def __init__(self, from_ = None, to = None, op = None, t = 0):
        self.from_ = from_
        self.from_n = len(self.from_)
        self.to = to
        self.op = op
        self.t = t
    def __str__(self):
        return f"from={self.from_}, from_n={self.from_n}, to={self.to}, op={self.op}, t={self.t}"

window = tk.Tk()
window.resizable(True, True)
canvas = tk.Canvas(window, width=1000, height=1000)
canvas.pack()

def _create_circle(self, x, y, r, **kwargs):
    return self.create_oval(x-r, y-r, x+r, y+r, **kwargs)
tk.Canvas.create_circle = _create_circle

nodes = {}

try:
    input()
    input()
    input()
    while True:
        s = input().split(' ')
        t = int(s[0])
        res = s[1]
        op1 = s[3]
        op  = s[4]
        op2 = s[5]

        for operand in [op1, op2]:
            if operand in nodes:
                nodes[operand].to.append(res)
            else:
                nodes[operand] = node([], [res], None)

        if res in nodes:
            nodes[res].from_ = [op1, op2]
            nodes[res].from_n = 2
            nodes[res].op = op
            nodes[res].t = t
        else:
            nodes[res] = node([op1, op2], [], op, t)
except Exception as e:
    pass
    #print(e)
    #for k, v in nodes.items():
    #    print(f"{k}: {v}")

UNIT = 30
SIZE = 10
queue = []
random.seed(time())
x = dict(zip([i for i in range(100)], [1 for i in range(100)]))
tlabel = set()
for k, v in nodes.items():
    if v.t == 0:
        v.x = UNIT * x[v.t+1]
    else:
        v.x = UNIT * (x[v.t+1] + randint(1, 5))
    
    tlabel.add(v.t)

    v.y = UNIT * (v.t+1) + 5
    v.r = SIZE
    canvas.create_circle(v.x, v.y, v.r, fill="blue")
    l = tk.Label(window, text = k)
    l.place(x=v.x+UNIT*0.2, y=v.y+UNIT*0.2)
    x[v.t+1] += 1

for k, v in nodes.items():
    for to in v.to:
        canvas.create_line(v.x, v.y+SIZE, nodes[to].x, nodes[to].y-SIZE)

for t in range(1, max(tlabel)+1):
    tl = tk.Label(window, text = str(t))
    tl.place(x=10, y=UNIT * (t+1))

window.mainloop()
