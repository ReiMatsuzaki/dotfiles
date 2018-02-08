import os
join = os.path.join
exists = os.path.exists
expanduser = os.path.expanduser
import sys
import matplotlib as mpl
mpl.use('PDF')
import matplotlib.pylab as plt
import numpy as np
tr = np.transpose
import pandas as pd


import argparse
from PIL import Image, ImageDraw, ImageFont

def run():
    parser = argparse.ArgumentParser(description="insert text to image file")
    parser.add_argument("img")
    parser.add_argument("txt")
    parser.add_argument("pos")
    args = parser.parse_args()

    try:
        img = Image.open(args.img, "r").convert("RGBA")
    except(Exception) as e:
        print("Error on open image")
        print(e.message)
        sys.exit()
        
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype("/Library/Fonts/Verdana.ttf", 20)
    #    draw.font = ImageFont.truetype("/Library/Fonts/Verdana.ttf", 20)
    pos = map(int, args.pos.split(","))

    #    img_size = np.array(img.size)
    #    txt_size = np.array(draw.font.getsize(txt))
    #pos = (img_size-txt_size)/2

    #    draw.text(pos, args.txt, (0,0,0))
    #draw.text(pos, args.txt, fill='#000000')
    #    draw.text(pos, args.txt, fill='#000000')
    draw.text(pos, args.txt, font=font, fill=(255,255,255,0))
    #draw.text(pos, args.txt, font=font)
    """
    try:
        draw.text(pos, args.txt, (0,0,0))
    except(Exception) as e:
        print("Error on adding text")
        print(e.message)
        print(args.img)
        print(args.txt)
        print(pos)
        sys.exit()        
    """

    img.save(args.img)

if(__name__=="__main__"):
    run()

