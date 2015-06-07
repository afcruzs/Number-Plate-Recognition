import os

for fin in os.listdir("."):
    if fin.startswith("num"):
        os.rename(fin, fin.replace("num","temp"))

for fin in os.listdir("."):
    for i in range(ord('A'),ord('Z')):
        if fin.startswith("temp"+chr(i)):
            os.rename(fin, "temp"+chr(i)+str(1)+".png")
        
    
