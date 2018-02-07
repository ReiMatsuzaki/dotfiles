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

    img = Image.open(args.img, "r")
    draw = ImageDraw.Draw(img)
    draw.font = ImageFont.truetype("/Library/Fonts/Verdana.ttf", 20)
    pos = map(int, args.pos.split(","))

    #    img_size = np.array(img.size)
    #    txt_size = np.array(draw.font.getsize(txt))
    #pos = (img_size-txt_size)/2

    draw.text(pos, args.txt, (0,0,0))

    img.save(args.img)

if(__name__=="__main__"):
    run()

