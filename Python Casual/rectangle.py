import tkinter as tk

rectSize = 200

def on_motion(event):
    if following_mouse:
        canvas.coords(rectangle, event.x-rectSize/2, event.y-rectSize/2, event.x+rectSize/2, event.y+rectSize/2)

def toggle_follow():
    global following_mouse
    following_mouse = not following_mouse

def on_key_press(event):
    if event.keysym == 'q':
        toggle_follow()
    elif event.keysym == 'Escape':
        window.destroy()

window = tk.Tk()
window.config(highlightbackground='#000000')
canvas = tk.Canvas(window, width=1920, height=1080, background='#000000')
canvas.pack()
rectangle = canvas.create_rectangle(0, 0, rectSize, rectSize, fill="gray1")

following_mouse = True
canvas.bind("<Motion>", on_motion)
window.bind("<Key>", on_key_press)

window.config(cursor="none")

label = tk.Label(canvas,borderwidth=0,bg='#000000')
window.overrideredirect(True)
window.wm_attributes('-transparentcolor','#000000')
window.wm_attributes('-topmost', True)
canvas.create_window(0, 0, anchor=tk.NW, window=label)

window.mainloop()
